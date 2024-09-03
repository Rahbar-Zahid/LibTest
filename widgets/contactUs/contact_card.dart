// lib/widgets/contact_card.dart

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class ContactCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String content;
  final bool isHovered;
  final VoidCallback? onTap;
  final Function(bool) onHover;

  const ContactCard({
    super.key,
    required this.icon,
    required this.title,
    required this.content,
    required this.isHovered,
    this.onTap,
    required this.onHover,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => onHover(true),
      onExit: (_) => onHover(false),
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          color: const Color(0xD23B647C),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(icon, size: 40, color: isHovered ? Colors.blue : Colors.white),
                    const SizedBox(width: 16),
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Lato',
                        color: isHovered ? Colors.blue : Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  content,
                  style: TextStyle(
                    fontFamily: 'Lato',
                    color: isHovered ? Colors.blue : Colors.white,
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

class ResponsiveContactCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String content;
  final bool isHovered;
  final VoidCallback? onTap;
  final Function(bool) onHover;

  const ResponsiveContactCard({
    super.key,
    required this.icon,
    required this.title,
    required this.content,
    required this.isHovered,
    this.onTap,
    required this.onHover,
  });

  @override
  Widget build(BuildContext context) {
    const isWeb = kIsWeb;
    return Container(
      width: isWeb ? 200 : null,
      margin: const EdgeInsets.symmetric(vertical: isWeb ? 8 : 16),
      child: ContactCard(
        icon: icon,
        title: title,
        content: content,
        isHovered: isHovered,
        onTap: onTap,
        onHover: onHover,
      ),
    );
  }
}
