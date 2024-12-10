import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _OrdersPageState createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  final List<Map<String, dynamic>> orders = [
    {
      'orderId': '1733394528727',
      'Kiosk': 'Kiosk 12',
      'totalPrice': 90.0,
      'items': [
        {'name': 'Bubble Tea', 'price': 50.0},
        {'name': 'Ube Matcha Lemonade', 'price': 40.0},
      ],
    },
    {
      'orderId': '1733394530543',
      'Kiosk': 'Kiosk 12',
      'totalPrice': 100.0,
      'items': [
        {'name': 'Puto', 'price': 20.0},
        {'name': 'Kutsinta', 'price': 30.0},
        {'name': 'Bubble Tea', 'price': 50.0},
      ],
    },
    {
      'orderId': '1733394530360',
      'Kiosk': 'Kiosk 12',
      'totalPrice': 70.0,
      'items': [
        {'name': 'Kutsinta', 'price': 30.0},
        {'name': 'Ube Matcha Lemonade', 'price': 40.0},
      ],
    },
    {
      'orderId': '1733394527246',
      'Kiosk': 'Kiosk 12',
      'totalPrice': 50.0,
      'items': [
        {'name': 'Kutsinta', 'price': 30.0},
        {'name': 'Puto', 'price': 20.0},
      ],
    },
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Store Orders'),
        backgroundColor: Colors.teal,
      ),
      body: ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, index) {
          final order = orders[index];
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    title: Text('Order #${order['orderId']}'),
                    subtitle: Text(
                      '${order['Kiosk']} - Total: ₱${order['totalPrice']}',
                    ),
                    onTap: () {
                      // Show more details or handle order actions
                      showOrderDetails(context, order['orderId'], order);
                    },
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          orders.removeAt(index);
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                      ),
                      child: const Text('Order Complete'),
                    ),
                  ),
                ],
              ),
            ),
          );
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
                Text('Kiosk: ${orderData['Kiosk']}'),
                const SizedBox(height: 8),
                Text('Total Price: ₱${orderData['totalPrice']}'),
                const SizedBox(height: 8),
                const Text('Items:'),
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