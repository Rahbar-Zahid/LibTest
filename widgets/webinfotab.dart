import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';

import '../drawer/about_us.dart';
import '../drawer/services.dart';
import '../product_pages/lrf.dart';
import '../product_pages/surveillance.dart';
import '../product_pages/tankapc.dart';
import '../product_pages/weaponsights.dart';
import '../tabs/career.dart';
import '../tabs/contact_us.dart';
import '../tabs/home.dart';
import '../tabs/products.dart';

class webinfotab extends StatelessWidget {
  const webinfotab({super.key});

  @override
  Widget build(BuildContext context) {
    if (!kIsWeb) {
      return Container();
    }

    final textTheme = Theme.of(context).textTheme;
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: screenWidth < 600 ? 10.0 : 20.0,
        horizontal: screenWidth < 600 ? 20.0 : 40.0,
      ),
      color: const Color.fromARGB(255, 7, 63, 89),
      child: Column(
        children: [
          screenWidth < 600
              ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionTitle('Important Tabs', textTheme),
              const SizedBox(height: 10.0),
              _buildLinkButtons(context),
              const SizedBox(height: 20.0),
              _buildSectionTitle('Product Categories', textTheme),
              const SizedBox(height: 10.0),
              _buildProductCategories(context),
              const SizedBox(height: 20.0),
              _buildSectionTitle('Reach Out', textTheme),
              const SizedBox(height: 10.0),
              _buildAdditionalInfo(),
            ],
          )
              : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildLinksColumn(context, textTheme),
              _buildProductCategoriesColumn(context, textTheme),
              _buildAdditionalInfoColumn(textTheme),
            ],
          ),
          const SizedBox(height: 20.0),
          Divider(color: Colors.white.withOpacity(0.5)),
          const SizedBox(height: 20.0),
          _buildFooter(context),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title, TextTheme textTheme) {
    return Text(
      title,
      style: textTheme.headlineMedium?.copyWith(
        fontWeight: FontWeight.bold,
        color: const Color(0xFFEFEFEF),
      ) ??
          const TextStyle(fontWeight: FontWeight.bold, color: const Color(0xFFEFEFEF)),
    );
  }

  Widget _buildLinkButtons(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const Tab1Content()),
            );
          },
          child: const Text(
            'Home',
            style: TextStyle(color: const Color(0xFFEFEFEF)),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const AboutUsPage()),
            );
          },
          child: const Text(
            'About Us',
            style: TextStyle(color: const Color(0xFFEFEFEF)),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const ServicesPage()),
            );
          },
          child: const Text(
            'Services',
            style: TextStyle(color: Colors.white),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const CareerPage()),
            );
          },
          child: const Text(
            'Career',
            style: TextStyle(color: const Color(0xFFEFEFEF)),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const ContactUsPage()),
            );
          },
          child: const Text(
            'Contact Us',
            style: TextStyle(color: const Color(0xFFEFEFEF)),
          ),
        ),
      ],
    );
  }

  Widget _buildProductCategories(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const Tab2Content()),
            );
          },
          child: const Text(
            'All Products',
            style: TextStyle(color: const Color(0xFFEFEFEF)),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const Lrf()),
            );
          },
          child: const Text(
            'LRF & LTDR',
            style: TextStyle(color: const Color(0xFFEFEFEF)),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const Surveillance()),
            );
          },
          child: const Text(
            'Surveillance',
            style: TextStyle(color: const Color(0xFFEFEFEF)),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const Tankapc()),
            );
          },
          child: const Text(
            'Tank/APC\'s Sights',
            style: TextStyle(color: const Color(0xFFEFEFEF)),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const Weaponsights()),
            );
          },
          child: const Text(
            'Weapon\'s Sights',
            style: TextStyle(color: const Color(0xFFEFEFEF),),
          ),
        ),
      ],
    );
  }

  Widget _buildLinksColumn(BuildContext context, TextTheme textTheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('Important Tabs', textTheme),
        const SizedBox(height: 10.0),
        _buildLinkButtons(context),
      ],
    );
  }

  Widget _buildProductCategoriesColumn(BuildContext context, TextTheme textTheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('Product Categories', textTheme),
        const SizedBox(height: 10.0),
        _buildProductCategories(context),
      ],
    );
  }

  Widget _buildAdditionalInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Office # 901-907,\nAlpha Techno Square,\nOld Airport Road',
          style: TextStyle(color: const Color(0xFFEFEFEF)),
        ),
        const Text(
          'Rawalpindi, Punjab',
          style: TextStyle(color: const Color(0xFFEFEFEF)),
        ),
        const SizedBox(height: 10.0),
        Row(
          children: const [
            Icon(Icons.phone, color: const Color(0xFFEFEFEF)),
            SizedBox(width: 8.0),
            Text(
              '(123) 456-7890',
              style: TextStyle(color: const Color(0xFFEFEFEF)),
            ),
          ],
        ),
        const SizedBox(height: 5.0),
        GestureDetector(
          onTap: () async {
            final Uri emailUri = Uri(
              scheme: 'mailto',
              path: 'info@leos.pk',
              queryParameters: {'subject': 'Inquiry'},
            );
            if (await canLaunchUrl(emailUri)) {
              await launchUrl(emailUri);
            } else {
              throw 'Could not launch $emailUri';
            }
          },
          child: Row(
            children: const [
              Icon(Icons.email, color: const Color(0xFFEFEFEF)),
              SizedBox(width: 8.0),
              Text(
                'info@leos.pk',
                style: TextStyle(color: const Color(0xFFEFEFEF), decoration: TextDecoration.underline),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10.0),
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.facebook, color: const Color(0xFFEFEFEF)),
              onPressed: () async {
                const facebookUrl = 'https://www.facebook.com/leos.pkk/';
                if (await canLaunchUrl(Uri.parse(facebookUrl))) {
                  await launchUrl(Uri.parse(facebookUrl));
                } else {
                  throw 'Could not launch $facebookUrl';
                }
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildAdditionalInfoColumn(TextTheme textTheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('Reach Out', textTheme),
        const SizedBox(height: 10.0),
        _buildAdditionalInfo(),
      ],
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
    Row(
    children: [
            Image.asset(
              'assets/images/LEOS-Original-Logo-2.png', // Path to your logo image
              height: 50.0, // Adjust the height as needed
            ),
      const SizedBox(width: 8.0),
      Text(
        ' Laser & Electro Optical Solutions (Pvt) Ltd, designs,\n develops, manufactures, markets, and distributes\n technologies that enhance perception and awareness.',
        style: Theme.of(context).textTheme.bodySmall?.copyWith(color: const Color(0xFFEFEFEF)),
      ),
    ],
    ),

    Column(
    children: [
        Image.asset(
          'assets/images/certificate.png', // Path to your ISO certificate image
          height: 50.0, // Adjust the height as needed
        ),
      const SizedBox(height: 8.0),
      Text(
        'Powered by AI team',
        style: Theme.of(context).textTheme.bodySmall?.copyWith(color: const Color(0xFFEFEFEF)),
      ),
      const SizedBox(height: 8.0),
      Text(
        '© Copyright 2024 All rights reserved |',
        style: Theme.of(context).textTheme.bodySmall?.copyWith(color: const Color(0xFFEFEFEF)),
      ),
    ],
        ),
      ],
    );
  }
}
