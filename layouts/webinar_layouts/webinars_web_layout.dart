// import 'package:flutter/material.dart';
// import '../../models/webinar.dart';
// import '../../widgets/WebInfoTab.dart';
// import '../../widgets/custom_header.dart';
// import '../../widgets/Webinars/webinar_card.dart'; // Import the correct WebinarCard
//
// class WebinarsWebPage extends StatelessWidget {
//   final List<Webinar> webinars;
//
//   const WebinarsWebPage({super.key, required this.webinars});
//
//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;
//
//     // Determine the number of columns based on screen width
//     int crossAxisCount = screenWidth < 900
//         ? 2 // For smaller screens, show 2 columns
//         : 3; // For larger screens, show 3 columns
//
//     // Adjust the aspect ratio based on the screen width
//     double aspectRatio = screenWidth < 900 ? 3 / 2 : 4 / 3;
//
//     return Scaffold(
//       backgroundColor: const Color(0xFFFDFDF8),
//       body: CustomScrollView(
//         slivers: [
//           SliverToBoxAdapter(
//             child: Column(
//               children: [
//                 const SizedBox(height: 16.0), // Space above header
//                 CustomHeader(
//                   title: 'Webinars',
//                   breadcrumb: 'Home/Customer support > Webinars',
//                   onBreadcrumbTap: () {
//                     Navigator.of(context).popUntil((route) => route.isFirst);
//                   },
//                   titleColor: const Color(0xFF191717), // Title color
//                   breadcrumbColor: const Color(0xFF191717), // Breadcrumb color
//                   hoverColor: Colors.blue, // Breadcrumb hover color
//                   backgroundColor: Colors.transparent, // Header background color
//                 ),
//                 const SizedBox(height: 16.0), // Space below header
//               ],
//             ),
//           ),
//           SliverGrid(
//             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: crossAxisCount,
//               childAspectRatio: aspectRatio,
//               crossAxisSpacing: 8.0,
//               mainAxisSpacing: 8.0,
//             ),
//             delegate: SliverChildBuilderDelegate(
//                   (context, index) {
//                 return WebinarCard(webinar: webinars[index]);
//               },
//               childCount: webinars.length,
//             ),
//           ),
//           const SliverToBoxAdapter(
//             child: SizedBox(height: 50.0), // Adjust height as needed
//           ),
//           const SliverToBoxAdapter(
//             child: WebInfoTab(),
//           ),
//           const SliverToBoxAdapter(
//             child: SizedBox(height: 50.0), // Adjust height as needed
//           ),
//         ],
//       ),
//     );
//   }
// }
