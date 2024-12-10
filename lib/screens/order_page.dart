import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  _OrdersPageState createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  @override
  void initState() {
    super.initState();
  }

  Future<List<DocumentSnapshot>> getOrders() async {
    try {
      final QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collectionGroup('orders')
          .get();
      print('Orders fetched: ${snapshot.docs.length}'); // Debug print

      // Print the data of each fetched document
      for (var doc in snapshot.docs) {
        print('Order ID: ${doc.id}, Data: ${doc.data()}');
      }

      return snapshot.docs;
    } catch (e) {
      print('Error fetching orders: $e');
      return [];
    }
  }

  Future<void> deleteOrder(String orderId, String userId) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('orders')
          .doc(orderId)
          .delete();
      print('Order $orderId deleted successfully');
    } catch (e) {
      print('Error deleting order: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Store Orders'),
        backgroundColor: Colors.teal,
      ),
      body: FutureBuilder<List<DocumentSnapshot>>(
        future: getOrders(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No orders found.'));
          } else {
            final orders = snapshot.data!;
            final filteredOrders = orders.where((order) {
              final orderData = order.data() as Map<String, dynamic>;
              final items = orderData['items'] as List<dynamic>?;
              if (items == null) {
                print('No items found in order ID: ${order.id}');
                return false;
              }
              return items.any((item) {
                final stall = item['stall'];
                print('Checking item with stall: $stall');
                return stall == 'Kiosk 12';
              });
            }).toList();

            print('Filtered orders count: ${filteredOrders.length}'); // Debug print

            return ListView.builder(
              itemCount: filteredOrders.length,
              itemBuilder: (context, index) {
                final order = filteredOrders[index];
                final orderId = order.id;
                final orderData = order.data() as Map<String, dynamic>;
                final items = orderData['items'] as List<dynamic>?;
                final userId = order.reference.parent.parent!.id;

                return Card(
                  margin: const EdgeInsets.all(8.0),
                  child: ExpansionTile(
                    title: Text('Order #$orderId'),
                    subtitle: Text('Total: ₱${orderData['totalPrice']}'),
                    children: [
                      ...items != null
                          ? items.expand<Widget>((item) {
                              final meals = item['meals'] as List<dynamic>?;
                              return meals != null
                                  ? meals.map<Widget>((meal) {
                                      return ListTile(
                                        title: Text('${meal['name']}'),
                                        subtitle: Text('Price: ₱${meal['price']}'),
                                      );
                                    }).toList()
                                  : [const Text('No meals found')];
                            }).toList()
                          : [const Text('No items found')],
                      TextButton(
                        onPressed: () async {
                          await deleteOrder(orderId, userId);
                          setState(() {
                            filteredOrders.removeAt(index);
                          });
                        },
                        child: const Text('Order Complete'),
                      ),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }

  void showOrderDetails(
      BuildContext context, String orderId, Map<String, dynamic> orderData) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Order Details: $orderId'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('User ID: ${orderData['userId']}'),
                const SizedBox(height: 8),
                Text('Total Price: ₱${orderData['totalPrice']}'),
                const SizedBox(height: 8),
                const Text('Items:'),
                ...orderData['items'].expand<Widget>((item) {
                  final meals = item['meals'] as List<dynamic>?;
                  return meals != null
                      ? meals.map<Widget>((meal) {
                          return Text('${meal['name']} - ₱${meal['price']}');
                        }).toList()
                      : [const Text('No meals found')];
                }).toList(),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
}