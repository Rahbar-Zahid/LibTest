import 'package:flutter/material.dart';
import '../../widgets/custom_header.dart';
import '../../widgets/newsEvents/blog_post_container_mobile.dart';

class NewsEventsMobileLayout extends StatelessWidget {
  final List<Map<String, String>> displayedPosts;
  final String sortBy;
  final ValueChanged<String?> onSortChanged;

  const NewsEventsMobileLayout({
    super.key,
    required this.displayedPosts,
    required this.sortBy,
    required this.onSortChanged,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: CustomHeader(
            title: 'News & Events',
            breadcrumb: 'Home / News & Events',
            onBreadcrumbTap: () {
              Navigator.of(context).popUntil((route) => route.isFirst);
            },
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
          sliver: SliverToBoxAdapter(
            child: Align(
              alignment: Alignment.centerRight,
              child: Container(
                width: 170,
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
          padding: const EdgeInsets.all(20.0),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                final post = displayedPosts[index];
                return BlogPostContainerMobile(
                  title: post['title']!,
                  description: post['description']!,
                  imageUrl: post['imageUrl']!,
                );
              },
              childCount: displayedPosts.length,
            ),
          ),
        ),
      ],
    );
  }
}