import 'package:flutter/material.dart';
import '../drawer/drawer.dart';
import '../bars/bottom_nav.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import '../widgets/webinfotab.dart';

class ReviewsPage extends StatelessWidget {
  const ReviewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: FixedAppBar(
      //   isSearching: false, // Example parameters
      //   onSearchChanged: (query) {
      //     // Handle search text changes
      //   },
      //   onSearchClear: () {
      //     // Handle search clear
      //   },
      //   searchQuery: '', // Initial search query
      //   tabController: DefaultTabController.of(context)!, // Make sure to provide a TabController
      // ),
      drawer: FixedDrawer(
        onItemSelected: (context, itemTitle) {
          // The navigation is handled by FixedDrawer itself.
        },
      ),
      backgroundColor: Colors.white,

      // Add WebInfoTab at the bottom if on the web
      body: const Column(
        children: [
          Expanded(
            child: Center(
              child: Text('Reviews Page Content Here'),
            ),
          ),
          if (kIsWeb) WebInfoTab(), // Only include this if on the web
          SizedBox(height:50),
        ],
      ),

      bottomNavigationBar: !kIsWeb ? const FixedBottomNavigationBar(canPop: true) : null,
    );
  }
}
