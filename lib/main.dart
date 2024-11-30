import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wvsu_coop/authentication/sign_up.dart';
import 'package:wvsu_coop/screens/about_us.dart';
import 'package:wvsu_coop/screens/contact_us.dart';
import 'package:wvsu_coop/screens/stalls.dart';
import 'homepage.dart';

import 'package:firebase_core/firebase_core.dart' hide FirebaseOptions;
import 'firebase_options.dart';
import 'authentication/auth_service.dart';
import 'authentication/log_in.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      routes: {
        '/home': (context) => HomePage(),
        '/login': (context) => const LogInPage(isSignUp: false),
        '/sign-up': (context) => const SignUpPage(),
        '/stalls': (context) => StallsPage(),
        '/about_us': (context) => AboutUsScreen(),
        '/contact_us': (context) => const ContactUsScreen(),
      },
      home: HomePage(),
    );
  }
}
