// import 'package:flutter/material.dart';
// import 'blog_post_detail_page.dart';
//
// class BlogPostContainer extends StatelessWidget {
//   final String title;
//   final String description;
//   final String imageUrl;
//   final bool isWeb;
//
//   const BlogPostContainer({
//     super.key,
//     required this.title,
//     required this.description,
//     required this.imageUrl,
//     required this.isWeb,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return AspectRatio(
//       aspectRatio: 0.75, // Adjust aspect ratio as needed
//       child: Card(
//         elevation: 4.0,
//         color: Colors.white,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(12.0), // Rounded corners
//         ),
//         margin: const EdgeInsets.all(8.0),
//         child: InkWell(
//           borderRadius: BorderRadius.circular(12.0),
//           onTap: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => BlogPostDetailPage(
//                   title: title,
//                   description: description,
//                   imageUrl: imageUrl,
//                 ),
//               ),
//             );
//           },
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               ClipRRect(
//                 borderRadius: const BorderRadius.vertical(top: Radius.circular(12.0)), // Rounded corners for image
//                 child: Image.asset(
//                   imageUrl,
//                   width: double.infinity,
//                   height: 150.0, // Adjust height as needed
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       title,
//                       style: const TextStyle(
//                         fontSize: 16.0,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black,
//                       ),
//                     ),
//                     const SizedBox(height: 4.0),
//                     Text(
//                       description,
//                       maxLines: 2,
//                       overflow: TextOverflow.ellipsis,
//                       style: const TextStyle(
//                         fontSize: 14.0,
//                         color: Colors.black87,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
