import 'package:flutter/material.dart';

class QuoteFAB extends StatelessWidget {
  final VoidCallback onPressed;

  const QuoteFAB({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: onPressed,
      label: const Text('Request a Quote'),
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
    );
  }
}
