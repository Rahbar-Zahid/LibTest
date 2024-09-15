import 'package:flutter/material.dart';

import '../models/intern.dart';
// import '../widgets/webinfotab.dart'; // Adjust the import path as needed

import '../widgets/webinfotab.dart';


class InternsScreen extends StatefulWidget {
  const InternsScreen({super.key});

  @override
  InternsScreenState createState() => InternsScreenState();
}

class InternsScreenState extends State<InternsScreen> {
  // List of interns with sample data
  final List<Intern> interns = [
    Intern(name: 'FAST NUCES', major: 'Software Engineers \nComputer Scientists', description: 'IT is the backbone for any company. We assigned our interns tasks like Email- Server, own Cloud Service'),
    Intern(name: 'AIR UNIVERSITY', major: 'Computer Scientists', description: 'Making a strong impact and creating the first important is essential. We gave our interns the task of developing our website and app.'),
    Intern(name: 'PIEAS', major: 'Electrical Engineering Students', description: ''),
    Intern(name: 'CUST', major: 'Software Engineering Students', description: ''),
    Intern(name: 'CUST', major: 'Data Science Students', description: ''),
  ];

  // List of images for the collage
  final List<String> collageImages = [
    'assets/images/interns/wd_ceo.png',
    'assets/images/interns/ceo1.jpg',
    'assets/images/interns/ceo2.jpg',
    'assets/images/interns/ceo3.jpg',
    'assets/images/interns/ceo4.jpg',
  ];

  // Track hover state
  final Map<int, bool> _hovered = {};
  final Map<int, bool> _tapped = {};

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const SizedBox(height: 70),
            SizedBox(
              height: screenWidth * 0.2,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  width: screenWidth,
                  alignment: Alignment.topCenter,
                  child: Image.asset(
                    'assets/videos/internship/image.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Center(
              child: Column(
                children: [
                  const SizedBox(height: 60),
                  Text(
                    'Our Interns',
                    style: TextStyle(
                      fontSize: isPortrait ? 24 : 30, // Adjust font size based on orientation
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 12, 88, 150),
                    ),
                  ),
                  const SizedBox(height: 10), // Add some space between the title and the paragraph
                  Text(
                    '\t We are proud to introduce our talented interns who are making significant contributions in various fields. \t'
                        '\n\t Their dedication and enthusiasm are driving innovation and excellence across our organization. \t'
                        '\n\t We believe in potential of each and every student and provide the best environment to explore it to its full capacity.\t'
                        '\n\t Our interns belong to difference universities across the city, giving us a versatile taste of their own skills.',
                    style: TextStyle(
                      fontSize: isPortrait ? 13 : 18, // Adjust font size based on orientation
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.center, // Center-align the paragraph text
                  ),
                  const SizedBox(height: 60),
                ],
              ),
            ),
            if (interns.isEmpty) // Display a message if there are no interns
              Center(
                child: Text(
                  'No interns available.',
                  style: TextStyle(
                    fontSize: isPortrait ? 18 : 22,
                    color: Colors.grey,
                  ),
                ),
              )
            else
              Column(
                children: List.generate(
                  interns.length,
                      (index) {
                    final intern = interns[index];
                    final isLeft = index % 2 == 0; // Alternates position of the containers

                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: isLeft ? MainAxisAlignment.start : MainAxisAlignment.end,
                        children: [
                          Expanded(child: _buildInternItem(intern, index)),
                        ],
                      ),
                    );
                  },
                ),
              ),
            const SizedBox(height: 50),

            // Add the collage of images
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GridView.builder(
                shrinkWrap: true, // Ensures GridView takes only as much space as needed
                physics: const NeverScrollableScrollPhysics(), // Prevents scrolling inside the GridView
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: isPortrait ? 2 : 3, // Number of columns based on orientation
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
                itemCount: collageImages.length,
                itemBuilder: (context, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      collageImages[index],
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 50),
            const webinfotab(),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  Widget _buildInternItem(Intern intern, int index) {
    final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    final isHovered = _hovered[index] ?? false; // Use a default value if null
    final isTapped = _tapped[index] ?? false; // Track tapped state

    return GestureDetector(
      onTap: () {
        setState(() {
          _tapped[index] = !isTapped; // Toggle tapped state
        });
      },
      child: MouseRegion(
        onEnter: (_) => setState(() => _hovered[index] = true),
        onExit: (_) => setState(() => _hovered[index] = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: (isHovered || isTapped) ? (isPortrait ? 350 : 500) : (isPortrait ? 150 : 200), // Increased width on hover or tap
          height: isPortrait ? 150 : 200, // Keep height fixed
          decoration: BoxDecoration(
            color: (isHovered || isTapped) ? Colors.lightBlue : Colors.blueGrey, // Change color on hover or tap
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                flex: (isHovered || isTapped) ? 2 : 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        intern.name,
                        style: TextStyle(
                          fontSize: isPortrait ? 16 : 20, // Adjust font size based on orientation
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        '',
                        style: TextStyle(
                          fontSize: isPortrait ? 14 : 18, // Adjust font size based on orientation
                          color: Colors.white70,
                        ),
                      ),
                      Text(
                        intern.major,
                        style: TextStyle(
                          fontSize: isPortrait ? 14 : 18, // Adjust font size based on orientation
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (isHovered || isTapped)
                Expanded(
                  flex: 3,
                  child: Container(
                    color: Colors.black.withOpacity(0.7),
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 8.0),
                        Text(
                          '${intern.description}', // Placeholder description
                          style: TextStyle(color: Colors.white, fontSize: isPortrait ? 14 : 18),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
