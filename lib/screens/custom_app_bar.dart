import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String currentPage;
  final Function(String route)? onNavigate;

  const CustomAppBar({
    super.key,
    required this.currentPage,
    this.onNavigate,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.grey[850],
      elevation: 8,
      title: LayoutBuilder(
        builder: (context, constraints) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/coop.jpg'),
                    radius: 20,
                  ),
                  SizedBox(width: 15),
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
              constraints.maxWidth > 600
                  ? Row(
                      children: [
                        _buildNavButton(context, 'Home', '/home', currentPage),
                        _buildNavButton(context, 'Stalls', '/stalls', currentPage),
                        _buildNavButton(
                            context, 'About Us', '/about_us', currentPage),
                        _buildNavButton(
                            context, 'Contact Us', '/contact_us', currentPage),
                      ],
                    )
                  : IconButton(
                      icon: const Icon(Icons.menu, color: Colors.white),
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                _buildSheetItem(context, 'Home', '/home'),
                                _buildSheetItem(context, 'Stalls', '/stalls'),
                                _buildSheetItem(context, 'About Us', '/about_us'),
                                _buildSheetItem(
                                    context, 'Contact Us', '/contact_us'),
                              ],
                            );
                          },
                        );
                      },
                    ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildNavButton(
      BuildContext context, String label, String route, String currentPage) {
    final isActive = currentPage == label;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: TextButton(
        onPressed: () => onNavigate != null
            ? onNavigate!(route)
            : Navigator.pushNamed(context, route),
        child: Text(
          label,
          style: TextStyle(
            color: isActive ? Colors.white : Colors.grey,
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  Widget _buildSheetItem(BuildContext context, String label, String route) {
    return ListTile(
      title: Text(label),
      onTap: () => onNavigate != null
          ? onNavigate!(route)
          : Navigator.pushNamed(context, route),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}
