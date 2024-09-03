import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../models/webinar.dart';
import '../../widgets/WebInfoTab.dart';
import '../../widgets/custom_header.dart';
import '../../widgets/Webinars/webinar_card.dart';

class WebinarsPage extends StatelessWidget {
  const WebinarsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Webinar> webinars = [
      Webinar(
        title: 'Aerospace ',
        description: 'Aerospace technologies raising.',
        imageUrl: 'assets/images/customer_support/webinars/webinar.png',
        category: 'Category A',
        date: DateTime(2024, 1, 1),
      ),
      Webinar(
        title: 'Security Products',
        description: 'Increase in need of Security Products',
        imageUrl: kIsWeb? 'assets/images/customer_support/webinars/webinar.png': 'assets/images/customer_support/webinars/elec.jpg',
        category: 'Category B',
        date: DateTime(2024, 2, 1),
      ),
      Webinar(
        title: 'Webinar 3',
        description: 'Description of Webinar 3',
        imageUrl:'assets/images/customer_support/webinars/webinar.png',
        category: 'Category A',
        date: DateTime(2024, 3, 1),
      ),
      Webinar(
        title: 'Webinar 4',
        description: 'Description of Webinar 4',
        imageUrl: 'assets/images/customer_support/webinars/webinar.png',
        category: 'Category A',
        date: DateTime(2024, 3, 1),
      ),
    ];

    double screenWidth = MediaQuery.of(context).size.width;

    // Determine the number of columns based on screen width
    int crossAxisCount = screenWidth < 900
        ? 2 // For smaller screens, show 2 columns
        : 3; // For larger screens, show 3 columns

    // Adjust the aspect ratio based on the screen width
    double aspectRatio = screenWidth < 900 ? 1.95 / 3 : 4 / 3;

    return Scaffold(
      backgroundColor: const Color(0xFFFDFDFB),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                const SizedBox(height: 16.0), // Space above header
                CustomHeader(
                  title: 'Webinars',
                  breadcrumb: 'Home/Customer support > Webinars',
                  onBreadcrumbTap: () {
                    Navigator.of(context).popUntil((route) => route.isFirst);
                  },
                  titleColor: kIsWeb? const Color(0xFFFFFFFF):const Color(
                      0xFF101010), // Title color
                  breadcrumbColor:kIsWeb? const Color(0xFFFFFFFF):const Color(
                      0xFF101010),// Breadcrumb color
                  hoverColor: Colors.blue, // Breadcrumb hover color
                  backgroundColor: kIsWeb? const Color(0xFF133B61): const Color(
                      0xFFFFFFFF), // Header background color
                ),
                const SizedBox(height: 100.0), // Space below header
              ],
            ),
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              childAspectRatio: aspectRatio,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
            ),
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                return WebinarCard(webinar: webinars[index]);
              },
              childCount: webinars.length,
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 50.0), // Adjust height as needed
          ),
          const SliverToBoxAdapter(
            child: WebInfoTab(),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 50.0), // Adjust height as needed
          ),
        ],
      ),
    );
  }
}