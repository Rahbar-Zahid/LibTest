import 'package:flutter/material.dart';
import '../search.dart'; // Import SearchPage
import '../widgets/webinfotab.dart';
import 'about_us.dart'; // Import About Us page
import 'services.dart'; // Import Services page
import 'reviews.dart'; // Import Reviews page

class FixedDrawer extends StatelessWidget {
  final void Function(BuildContext, String) onItemSelected;

  const FixedDrawer({super.key, required this.onItemSelected});

  void _handleNavigation(BuildContext context, String itemTitle) {
    Widget page;

    switch (itemTitle) {
      case 'Search':
        page = const SearchPage(); // Ensure this is the correct page
        break;
      case 'About Us':
        page = const AboutUsPage();
        break;
      case 'Services':
        page = const ServicesPage();
        break;
      case 'Reviews':
        page = const ReviewsPage();
        break;
      default:
        page = const Scaffold(body: Center(child: Text('Page not found')));
        break;
    }

   Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => page,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 12, 88, 150),
            ),
            child: SizedBox(
              width: 50,
              height: 25,
              child: Image.asset(
                'assets/images/LEOS-Original-Logo-1.png',
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.search, color: Color.fromARGB(255, 12, 88, 150)), // Search icon
            title: const Text('Search'),
            onTap: () => _handleNavigation(context, 'Search'), // Navigate to SearchPage
          ),
          ListTile(
            title: const Text('About Us'),
            onTap: () => _handleNavigation(context, 'About Us'),
          ),
          ListTile(
            title: const Text('Services'),
            onTap: () => _handleNavigation(context, 'Services'),
          ),
          ListTile(
            title: const Text('Reviews'),
            onTap: () => _handleNavigation(context, 'Reviews'),
          ),
          const SizedBox(height:50),
          const WebInfoTab(),
        ],
      ),
    );
  }
}
