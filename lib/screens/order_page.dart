import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  _OrdersPageState createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  late String storeId;

  @override
  void initState() {
    super.initState();
    getStoreId();
  }

  // Get store ID of the logged-in user (assuming it's stored in Firestore)
  Future<void> getStoreId() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();
      setState(() {
        storeId = userDoc[
            'storeId']; // Assuming storeId is stored in Firestore for store owners
      });
    }
  }

  // Fetch orders for the store
  Future<List<DocumentSnapshot>> getOrders() async {
    final ordersSnapshot = await FirebaseFirestore.instance
        .collection('orders')
        .where('storeId', isEqualTo: storeId)
        .get();
    return ordersSnapshot.docs;
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
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No orders found.'));
          } else {
            final orders = snapshot.data!;
            return ListView.builder(
              itemCount: orders.length,
              itemBuilder: (context, index) {
                final order = orders[index];
                final orderId = order.id;
                final orderData = order.data() as Map<String, dynamic>;

                return ListTile(
                  title: Text('Order #$orderId'),
                  subtitle: Text('Total: ₱${orderData['totalPrice']}'),
                  onTap: () {
                    // Show more details or handle order actions
                    showOrderDetails(context, orderId, orderData);
                  },
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
                Text('Items:'),
                ...orderData['items'].map<Widget>((item) {
                  return Text('${item['name']} - ₱${item['price']}');
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
