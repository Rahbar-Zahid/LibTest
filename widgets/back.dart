import 'package:flutter/material.dart';

class BackButtonWidget extends StatelessWidget {
  final VoidCallback? onPressed;
  final double size;

  const BackButtonWidget({super.key, this.onPressed, this.size = 24.0}); // Default size to 24.0

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft, // Align the button to the left
      child: IconButton(
        icon: Icon(
          Icons.arrow_back,
          size: size, // Set the size of the icon
        ),
        onPressed: onPressed ?? () => Navigator.of(context).pop(),
      ),
    );
  }
}

