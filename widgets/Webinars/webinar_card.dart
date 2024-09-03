import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../models/webinar.dart';

class WebinarCard extends StatelessWidget {
  final Webinar webinar;
  const WebinarCard({
    super.key,
    required this.webinar,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero, // Square corners
      ),
      color: kIsWeb? const Color(0xFF133B61): const Color(
          0xFF28619A), // Custom green color
      margin: const EdgeInsets.all(8.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(12.0), // Square corners
        onTap: () {
          // Navigate to detailed page or show more info
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.zero, // Square corners
              child: Image.asset(
                webinar.imageUrl,
                width: double.infinity,
                height: 170, // Reduced height
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    webinar.title,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFF8F3F3),
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    webinar.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 14.0,
                      color: Color(0xFFE3E0E0),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}