//NOT IN USE

// import 'package:flutter/material.dart';
// import '../../models/webinar.dart';
//
// class WebinarCardWeb extends StatelessWidget {
//   final Webinar webinar;
//   final double cardHeight;
//
//   const WebinarCardWeb({
//     super.key,
//     required this.webinar,
//     this.cardHeight = 300.0,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         // Navigate to detailed page or show more info
//       },
//       child: SizedBox(
//         height: cardHeight,
//         child: Card(
//           color: const Color(0xFDFFFFFF),
//           margin: const EdgeInsets.all(8.0),
//           shape: const RoundedRectangleBorder(
//             borderRadius: BorderRadius.zero,
//           ),
//           child: SingleChildScrollView( // Wrap content in a scrollable container
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 // Image container
//                 Container(
//                   width: double.infinity,
//                   height: cardHeight * 0.6,
//                   decoration: BoxDecoration(
//                     image: DecorationImage(
//                       image: AssetImage(webinar.imageUrl),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//                 // Text container
//                 Container(
//                   padding: const EdgeInsets.all(8.0),
//                   color: const Color(0xFF28619A),
//                   height: cardHeight * 0.5,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         webinar.title,
//                         style: const TextStyle(
//                           fontSize: 18.0,
//                           fontWeight: FontWeight.bold,
//                           color: const Color(0xFDFDF9EC),
//                         ),
//                       ),
//                       const SizedBox(height: 4.0),
//                       Text(
//                         webinar.description,
//                         style: const TextStyle(
//                           fontSize: 14.0,
//                           color: const Color(0xFDFDF9EC),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
