import 'package:flutter/material.dart';
import 'blog_post_detail_page.dart'; // Import the detailed page

class BlogPostContainerMobile extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;
  final double cardHeight;

  const BlogPostContainerMobile({
    super.key,
    required this.title,
    required this.description,
    required this.imageUrl,
    this.cardHeight = 200.0, // Default height for mobile card
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BlogPostDetailPage(
              title: title,
              description: description,
              imageUrl: imageUrl,
            ),
          ),
        );
      },
      child: SizedBox(
        height: cardHeight,
        child: Card(
          margin: const EdgeInsets.all(5.0),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
          child: SingleChildScrollView( // Scrollable content for overflow protection
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Image container
                Container(
                  width: double.infinity,
                  height: cardHeight * 0.6,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Text container
                Container(
                  padding: const EdgeInsets.all(8.0),
                  color: Colors.white,
                  height: cardHeight * 0.4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Playfair',

                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 4.0),
                      Text(
                        description,
                        style: const TextStyle(
                          fontSize: 12.0,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
