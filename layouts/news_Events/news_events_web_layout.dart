import 'package:flutter/material.dart';
import '../../widgets/custom_header.dart';
import '../../widgets/newsEvents/blog_post_container_web.dart';
import '../../widgets/webinfotab.dart';

class NewsEventsWebLayout extends StatelessWidget {
  final List<Map<String, String>> displayedPosts;
  final String sortBy;
  final ValueChanged<String?> onSortChanged;

  const NewsEventsWebLayout({
    super.key,
    required this.displayedPosts,
    required this.sortBy,
    required this.onSortChanged,
  });



  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: SizedBox(
            //height: screenWidth * 0.5, // Adjust the height as needed
            child: Stack(
              children: [
                // The image is the base layer
                Container(
                  width: screenWidth,
                  child: Image.asset(
                    'assets/images/news_events_media/news_events.png',
                    fit: BoxFit.cover,
                  ),
                ),
                //const SizedBox(height: 100,),
                // The CustomHeader is layered on top of the image
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.center, // Center the text over the image
                    child: CustomHeader(
                      title: 'News & Events',
                      breadcrumb: 'Home / News & Events',
                      onBreadcrumbTap: () {
                        Navigator.of(context).popUntil((route) => route.isFirst);
                      },
                      titleColor: Colors.black, // Ensure the title is visible on the image
                      breadcrumbColor: Colors.black, // Ensure the breadcrumb is visible on the image
                      backgroundColor: Colors.transparent, // Make the header background transparent
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        SliverPadding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
          sliver: SliverToBoxAdapter(
            child: Align(
              alignment: Alignment.centerRight,
              child: Container(
                width: 200,
                height: 50,
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.zero,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: const Offset(3, 3),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    const Icon(Icons.filter_list, color: Colors.black, size: 20.0),
                    const SizedBox(width: 8.0),
                    const Text(
                      'Sort By',
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    Expanded(
                      child: DropdownButton<String>(
                        value: sortBy,
                        onChanged: onSortChanged,
                        items: ['date']
                            .map((sort) => DropdownMenuItem(
                          value: sort,
                          child: Text(sort, style: const TextStyle(fontSize: 14.0)),
                        ))
                            .toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.all(30.0),
          sliver: SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 22.0,
              mainAxisSpacing: 35.0,
              childAspectRatio: 2/ 1, // Adjust aspect ratio to fit content
            ),
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                final post = displayedPosts[index];
                return BlogPostContainerWeb(
                  title: post['title']!,
                  description: post['description']!,
                  imageUrl: post['imageUrl']!,
                );
              },
              childCount: displayedPosts.length,
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(height: 50.0), // Adjust height as needed
        ),
        // Add webinfotab
        const SliverToBoxAdapter(
          child: webinfotab(),
        ),
        // Add SizedBox below webinfotab
        const SliverToBoxAdapter(
          child: SizedBox(height: 50.0), // Adjust height as needed
        ),
      ],
    );
  }
}
