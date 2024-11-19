import 'package:flutter/material.dart';
import 'screens/about_us.dart';
import 'screens/stalls.dart';
import 'homepage.dart';
import 'screens/contact_us.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WVSU',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      routes: {
        // Define routes for navigation
        '/about_us': (context) => AboutUsScreen(),
        '/stalls': (context) => StallsPage(),
        '/contact_us': (context) => ContactUsScreen(),
      },
    );
  }
}
