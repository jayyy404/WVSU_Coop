import 'package:flutter/material.dart';
import 'package:wvsu_coop/authentication/auth_service.dart';
import 'package:wvsu_coop/authentication/log_in.dart';
import 'package:wvsu_coop/screens/custom_app_bar.dart';  

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<String> unrestrictedRoutes = [
    '/about_us',
    '/contact_us',
    '/home',
  ];

  Future<void> _navigateOrLogin(BuildContext context, String route) async {
    final user = AuthService().getCurrentUser();

    // Check if user needs to log in for restricted routes
    if (!unrestrictedRoutes.contains(route) && user == null) {
      // Show login modal for unauthenticated users
      await showDialog(
        context: context,
        builder: (context) => const LogInPage(isSignUp: false),
      );
    }

    // Proceed to the route if the user is authenticated or unrestricted
    if (unrestrictedRoutes.contains(route) ||
        AuthService().getCurrentUser() != null) {
      // ignore: use_build_context_synchronously
      Navigator.pushNamed(context, route);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.grey[850],
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/coop.jpg'),
                  radius: 20,
                ),
                SizedBox(width: 8),
                Text(
                  'WVSU Canteen',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                _buildNavButton(context, 'Home', '/home'),
                _buildNavButton(context, 'Stalls', '/stalls'),
                _buildNavButton(context, 'About Us', '/about_us'),
                _buildNavButton(context, 'Contact Us', '/contact_us'),
                _buildLogoutButton(context),
              ],
            ),
          ],
        ),
      appBar: CustomAppBar(
        currentPage: 'Home', // Highlights the Home tab
        onNavigate: (route) => _navigateOrLogin(context, route), // Passes navigation logic

      ),
      body: Stack(
        children: [
          // Background Image
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage('assets/homepage.jpg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.5),
                  BlendMode.darken,
                ),
              ),
            ),
          ),
     
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'WELCOME TO WVSU CANTEEN',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => _navigateOrLogin(context, '/stalls'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                  ),
                  child: const Text(
                    'Explore Stalls',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildLogoutButton(BuildContext context) {
  return TextButton(
    onPressed: () async {
      try {
        await AuthService().signOut();
        Navigator.pushReplacementNamed(context, '/login');
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Logout failed: $e')),
        );
      }
    },
    child: const Text(
      'Logout',
      style: TextStyle(
        color: Colors.red,
        fontSize: 16,
      ),
    ),
  );
}
