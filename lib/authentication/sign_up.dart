import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
        backgroundColor: Colors.grey[850],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Create an Account',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle email/password sign up
                final email = emailController.text;
                final password = passwordController.text;

                if (email.isNotEmpty && password.isNotEmpty) {
                  // Add sign-up logic here
                  print('Signed up with Email: $email, Password: $password');
                  Navigator.pushReplacementNamed(context, '/');
                } else {
                  // Show error
                  print('Please fill in all fields.');
                }
              },
              child: const Text('Sign Up'),
            ),
            const SizedBox(height: 20),
            const Text('OR', style: TextStyle(fontSize: 16)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle guest login
                print('Continued as Guest');
                Navigator.pushReplacementNamed(context, '/');
              },
              child: const Text('Continue as Guest'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
