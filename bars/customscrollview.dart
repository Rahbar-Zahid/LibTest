//NOT IN USE

// import 'package:flutter/material.dart';
// import 'appbar.dart'; // Import your FixedAppBar
//
// class HomePage extends StatelessWidget {
//   const HomePage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final TabController tabController = TabController(length: 3, vsync: ScrollableState());
//
//     return Scaffold(
//       body: CustomScrollView(
//         slivers: [
//           FixedAppBar(
//             isSearching: false,
//             onSearchChanged: (query) {},
//             onSearchClear: () {},
//             searchQuery: '',
//             tabController: tabController,
//           ),
//           SliverList(
//             delegate: SliverChildBuilderDelegate(
//                   (BuildContext context, int index) {
//                 // Replace with your actual content
//                 return ListTile(
//                   title: Text('Item $index'),
//                 );
//               },
//               childCount: 20, // Adjust the count as needed
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
