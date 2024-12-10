import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart' hide FirebaseOptions;
import 'firebase_options.dart';
import 'authentication/auth_service.dart';
import 'authentication/log_in.dart';
import 'authentication/sign_up.dart';
import 'screens/about_us.dart';
import 'screens/contact_us.dart';
import 'screens/stalls.dart';
import 'homepage.dart';
import 'screens/order_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AuthService authService = AuthService();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      routes: {
        '/home': (context) => HomePage(),
        '/login': (context) => const LogInPage(isSignUp: false),
        '/sign-up': (context) => const SignUpPage(),
        '/stalls': (context) => const StallsPage(),
        '/about_us': (context) => AboutUsScreen(),
        '/contact_us': (context) => const ContactUsScreen(),
        '/order_page': (context) => const OrdersPage(),
      },
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
            final user = snapshot.data!;
            
            if (user.email == 'stallowner1@gmail.com') {
              return const OrdersPage();
            } else {
              return HomePage();
            }
          } else {
            return const LogInPage(isSignUp: false);
          }
        },
      ),
    );
  }
}