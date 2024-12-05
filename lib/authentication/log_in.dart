import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:wvsu_coop/authentication/auth_service.dart';
import 'package:wvsu_coop/screens/order_page.dart';

class LogInPage extends StatefulWidget {
  final bool isSignUp;

  const LogInPage({super.key, this.isSignUp = false});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isSignUp = false;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _isSignUp = widget.isSignUp;
  }

  void _submitForm() async {
    setState(() {
      _isLoading = true;
    });

    try {
      if (_isSignUp) {
        await AuthService().signUp(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
          role: 'user', // Regular user by default
        );
      } else {
        await AuthService().signIn(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );

        // Check if the user is a store owner after login
        bool isStoreOwner = await AuthService().isStoreOwner();
        if (isStoreOwner) {
          // Navigate to the store owner's orders page
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) =>
                OrdersPage(), // Assuming OrdersPage shows orders for store owners
          ));
        } else {
          // Navigate to the regular user's homepage
          Navigator.of(context).pushReplacementNamed('/home');
        }
      }

      // ignore: use_build_context_synchronously
      Navigator.of(context).pop();
    } catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _logInAsGuest() async {
    setState(() {
      _isLoading = true;
    });

    try {
      await AuthService().signInAsGuest();

      // ignore: use_build_context_synchronously
      Navigator.of(context).pop();
    } catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.5),
      body: Stack(
        children: [
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: Container(
              color: Colors.black.withOpacity(0.2),
            ),
          ),
          Center(
            child: Container(
              width: 300,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10.0,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    _isSignUp ? 'Sign Up' : 'Log In',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _passwordController,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(height: 16),
                  _isLoading
                      ? const CircularProgressIndicator()
                      : Column(
                          children: [
                            ElevatedButton(
                              onPressed: _submitForm,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 12.0,
                                  horizontal: 24.0,
                                ),
                              ),
                              child: Text(
                                _isSignUp ? 'Sign Up' : 'Log In',
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                            const SizedBox(height: 8),
                            TextButton(
                              onPressed: _logInAsGuest,
                              child: const Text(
                                'Log in as Guest',
                                style: TextStyle(color: Colors.blue),
                              ),
                            ),
                          ],
                        ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _isSignUp = !_isSignUp;
                      });
                    },
                    child: Text(
                      _isSignUp
                          ? 'Already have an account? Log In'
                          : "Don't have an account? Sign Up",
                      style: const TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
