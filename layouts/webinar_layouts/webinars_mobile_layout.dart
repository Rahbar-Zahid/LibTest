// import 'package:flutter/material.dart';
// import '../../models/webinar.dart';
// import '../../widgets/Webinars/webinar_card_mobile.dart'; // Update to use WebinarCardMobile
// import '../../widgets/custom_header.dart';
// import '../../widgets/Webinars/webinar_card.dart'; // Update to use WebinarCardMobile
//
//
// class WebinarsMobilePage extends StatelessWidget {
//   final List<Webinar> webinars;
//
//   const WebinarsMobilePage({super.key, required this.webinars});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor:const Color(0xFFFDFDF8),
//       body: CustomScrollView(
//         slivers: [
//           // CustomHeader with spacing
//           SliverToBoxAdapter(
//             child: Column(
//               children: [
//                 SizedBox(height: 16.0), // Space above header
//                 CustomHeader(
//                   title: 'Webinars',
//                   breadcrumb: 'Home/Customer support > Webinars',
//                   onBreadcrumbTap: () {
//                     Navigator.of(context).popUntil((route) => route.isFirst);
//                   },
//                   titleColor: const Color(0xFF28619A), // Set the title color
//                   breadcrumbColor: const Color(0xFF28619A),// Set the breadcrumb color
//                   hoverColor: Colors.white, // Set the hover color
//                   backgroundColor: Colors.transparent, // Set the background color
//                 ),
//                 SizedBox(height: 16.0), // Space below header
//               ],
//             ),
//           ),
//           // Webinar grid for mobile
//           SliverGrid(
//             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 2,
//               childAspectRatio: 2 / 3,
//               crossAxisSpacing: 8.0,
//               mainAxisSpacing: 8.0,
//             ),
//             delegate: SliverChildBuilderDelegate(
//                   (context, index) {
//                 return WebinarCard(webinar: webinars[index]); // Use WebinarCardMobile
//               },
//               childCount: webinars.length,
//             ),
//           ),
//           const SliverToBoxAdapter(
//             child: SizedBox(height: 50.0), // Adjust height as needed
//           ),
//         ],
//       ),
//     );
//   }
// }
