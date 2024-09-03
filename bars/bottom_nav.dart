import 'package:flutter/material.dart';

class FixedBottomNavigationBar extends StatelessWidget {
  final bool canPop; // To determine if the back button should be active

  const FixedBottomNavigationBar({
    super.key,
    required this.canPop,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: const Color.fromARGB(255, 12, 88, 150),
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (canPop)
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              },
              color: Colors.white,
            ),
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {
              Navigator.of(context).popUntil((route) => route.isFirst);
            },
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
