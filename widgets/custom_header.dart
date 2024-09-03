import 'package:flutter/material.dart';

class CustomHeader extends StatefulWidget {
  final String title;
  final String breadcrumb;
  final VoidCallback onBreadcrumbTap;
  final Color titleColor;
  final Color breadcrumbColor;
  final Color hoverColor;
  final Color backgroundColor;

  const CustomHeader({
    super.key,
    required this.title,
    required this.breadcrumb,
    required this.onBreadcrumbTap,
    this.titleColor = Colors.black,
    this.breadcrumbColor = Colors.black,
    this.hoverColor = Colors.black,
    this.backgroundColor = Colors.white,
  });

  @override
  CustomHeaderState createState() => CustomHeaderState();
}

class CustomHeaderState extends State<CustomHeader> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.backgroundColor,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 16),
          Text(
            widget.title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              fontFamily: 'Playfair',
              color: widget.titleColor,
            ),
          ),
          const SizedBox(height: 8),
          MouseRegion(
            onEnter: (_) {
              setState(() {
                isHovered = true;
              });
            },
            onExit: (_) {
              setState(() {
                isHovered = false;
              });
            },
            child: GestureDetector(
              onTap: widget.onBreadcrumbTap,
              child: Text(
                widget.breadcrumb,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 11,
                  fontFamily: 'Lato',
                  color: isHovered ? widget.hoverColor : widget.breadcrumbColor,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          const Divider(),
        ],
      ),
    );
  }
}
