//NOT IN USE


// import 'package:flutter/material.dart';
// import '../../models/webinar.dart';
//
// class WebinarCardMobile extends StatelessWidget {
//   final Webinar webinar;
//   final double imageHeight;
//   final double cardHeight;
//   final Color cardColor;
//   final Color imageBorderColor;
//   final Color titleColor;
//   final Color descriptionColor;
//
//   const WebinarCardMobile({
//     super.key,
//     required this.webinar,
//     this.imageHeight = 120.0,
//     this.cardHeight = 200.0,
//     this.cardColor = const Color(0xFF28619A),
//     this.imageBorderColor = Colors.transparent,
//     this.titleColor = const Color(0xFFFDFDF8),
//     this.descriptionColor = const Color(0xFFFDFDF8),
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         // Navigate to detailed page or show more info
//       },
//       child: SizedBox(
//         height: cardHeight, // Set the height of the card
//         child: Card(
//           elevation: 4.0,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(8.0),
//           ),
//           margin: const EdgeInsets.all(8.0),
//           color: cardColor, // Set the background color of the card
//           child: Container(
//             decoration: BoxDecoration(
//               color: cardColor, // Set the background color of the container
//               borderRadius: BorderRadius.circular(8.0),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Image container
//                 Container(
//                   color: imageBorderColor, // Optional color behind the image
//                   child: ClipRRect(
//                     borderRadius: const BorderRadius.vertical(top: Radius.circular(8.0)),
//                     child: Image.asset(
//                       webinar.imageUrl,
//                       width: double.infinity,
//                       height: imageHeight,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//                 // Text container
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         webinar.title,
//                         style: TextStyle(
//                           fontSize: 16.0,
//                           fontWeight: FontWeight.bold,
//                           color: titleColor, // Set the title text color
//                         ),
//                       ),
//                       const SizedBox(height: 4.0),
//                       Text(
//                         webinar.description,
//                         maxLines: 2,
//                         overflow: TextOverflow.ellipsis,
//                         style: TextStyle(
//                           fontSize: 14.0,
//                           color: descriptionColor, // Set the description text color
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
