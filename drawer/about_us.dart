//Imports
import 'package:flutter/material.dart';
import '../drawer/drawer.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import '../bars/bottom_nav.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:flutter_application_1/widgets/webinfotab.dart';
import '../widgets/custom_header.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({super.key});

  @override
  AboutUsPageState createState() => AboutUsPageState();
}

class AboutUsPageState extends State<AboutUsPage> {
  bool isHovered = false;
  bool isImageHovered = false;
  Color textColor = Colors.black;
  final List<bool> _isVisible = [false, false, false];

  @override
  Widget build(BuildContext context) {
    //Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      drawer: FixedDrawer(
        onItemSelected: (context, itemTitle) {
          // The navigation is handled by FixedDrawer itself.
        },
      ),
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomHeader(
                    title: 'About Us',
                    breadcrumb: 'Home / About us',
                    onBreadcrumbTap: () {
                      Navigator.of(context).popUntil((route) => route.isFirst);
                    },
                  ),
                  const SizedBox(height: 8),
                  const SizedBox(height: 16),
                  VisibilityDetector(
                    key: const Key('about-image'),
                    onVisibilityChanged: (visibilityInfo) {
                      bool visible = visibilityInfo.visibleFraction > 0;
                      setState(() {
                        // Only animate if the image is visible
                        if (visible) {
                          // This ensures the image opacity changes correctly when visible
                          _isVisible[0] = true;
                        } else {
                          _isVisible[0] = false;
                        }
                      });
                    },
                    child: AnimatedOpacity(
                      opacity: _isVisible[0] ? 1.0 : 0.0, // Adjust this value as needed
                      duration: const Duration(milliseconds: 600),
                      child: Image.asset(
                        'assets/images/about/leos1.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                _buildVisionSection(context),
                const SizedBox(height:50),
                const SizedBox(height: 16),
                _buildMissionSection(context),
                _buildHoverableImage(context),
                _buildCoreValuesSection(context),
                const SizedBox(height:30),
                _buildTeamSection(context),
                const SizedBox(height:50),
                const webinfotab(),
                const SizedBox(height:50),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: !kIsWeb ? const FixedBottomNavigationBar(canPop: true) : null,
    );
  }

  // Vision section with responsive design and animation
  Widget _buildVisionSection(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double fontSize = screenWidth < 600
        ? 15:
    screenWidth < 600
        ? 17  // Small screen, like mobile
        : screenWidth < 1200
        ? 20  // Medium screen, like tablet
        : 25; // Large screen, like desktop
    return kIsWeb
        ? VisibilityDetector(
      key: const Key('vision-section'),
      onVisibilityChanged: (visibilityInfo) {
        bool visible = visibilityInfo.visibleFraction > 0;
        setState(() {
          _isVisible[0] = visible;
        });
      },
      child: AnimatedOpacity(
        opacity: _isVisible[0] ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 800),
        child: AnimatedSlide(
          offset: _isVisible[0] ? const Offset(0, 0) : const Offset(0, 1),
          duration: const Duration(milliseconds: 500),
          child: Container(
            color: Colors.white10,
            height: 400,
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const Text(
                  '\n\nOur Vision - Innovation through Excellence',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontFamily: 'Playfair',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      '\nEmpowering innovation through precision craftsmanship \n Our company pioneers products that redefine\nexcellence and elevate experiences.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: fontSize,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    )
        : VisibilityDetector(
      key: const Key('vision-section'),
      onVisibilityChanged: (visibilityInfo) {
        bool visible = visibilityInfo.visibleFraction > 0;
        setState(() {
          _isVisible[0] = visible;
        });
      },
      child: AnimatedOpacity(
        opacity: _isVisible[0] ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 300),
        child: AnimatedSlide(
          offset: _isVisible[0] ? const Offset(0, 0) : const Offset(0, 1),
          duration: kIsWeb? const Duration(milliseconds: 5000):const Duration(milliseconds: 700),
          child: Container(
            color: Colors.white10,
            padding: const EdgeInsets.all(16.0),
            child: const Column(
              children: [
                Text(
                  '\nOur Vision - Innovation through Excellence',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'Playfair',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),
                Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      "\"Empowering innovation through precision craftsmanship \n Our company pioneers products that redefine excellence and elevate experiences.\"",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Mission section with responsive design
  Widget _buildMissionSection(BuildContext context) {
    return kIsWeb
        ? Container(
      color: const Color(0xFDE9EFFB),
      padding: const EdgeInsets.all(16.0),
      child: const Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 8),
              Text(
                'Mission\t',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Playfair',
                ),
              ),
              Icon(
                Icons.auto_graph,
                size: 30,
                color: Colors.black,
              ),
            ],
          ),
          SizedBox(height: 16),
          Center(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'LEOS - Laser & Electro Optical Solutions is dedicated to pioneering mission-critical\n laser and electro-optical solutions that enhance public safety,\n promote energy efficiency, and foster community well-being.',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Lato',

                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    )
        : Container(
      color: const Color(0xFDE9EFFB),
      padding: const EdgeInsets.all(16.0),
      child: const Column(
        children: [
          SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 8),
              Text(
                'Mission',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Playfair',
                ),
              ),
              Icon(
                Icons.auto_graph,
                size: 30,
                color: Colors.black,
              ),
            ],
          ),
          SizedBox(height: 16),
          Center(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'LEOS - Laser & Electro Optical Solutions is dedicated to pioneering mission-critical laser and electro-optical solutions that enhance public safety, promote energy efficiency, and foster community well-being.',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                  //fontFamily: 'Montserrat',
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Core Values Section with Responsive Design
  Widget _buildCoreValuesSection(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.4,
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF0D47A1), Color(0xFF6D94BF)], // Define your gradient colors here
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(10.0)
                ),
                child: const Text(
                  'We make the Best! Integrity, Innovation, Customer Focus, and Teamwork are at the core of our values. We believe in doing the right thing, constantly seeking improvement, putting our customers first, and working together to achieve great results.',
                  style: TextStyle(
                    fontFamily: 'Playfair',
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Flexible(
              child: Image.asset(
                'assets/images/about/leos3.png',
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  //Hoverable Image Widget
  Widget _buildHoverableImage(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          isImageHovered = true;
        });
      },
      onTapUp: (_) {
        setState(() {
          isImageHovered = false;
        });
      },
      child: MouseRegion(
        onEnter: (_) {
          setState(() {
            isImageHovered = true;
          });
        },
        onExit: (_) {
          setState(() {
            isImageHovered = false;
          });
        },
        child: AnimatedOpacity(
          opacity: isImageHovered ? 0.755 : 1.0,
          duration: const Duration(milliseconds: 300),
          child: Image.asset(
            'assets/images/about/deliver.png',
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }

  //Team Section
  Widget _buildTeamSection(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return VisibilityDetector(
      key: const Key('team-section'),
      onVisibilityChanged: (visibilityInfo) {
        bool visible = visibilityInfo.visibleFraction > 0;
        setState(() {
          _isVisible[2] = visible;
        });
      },
      child: AnimatedOpacity(
        opacity: _isVisible[2] ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 500),
        child: AnimatedSlide(
          offset: _isVisible[2] ? const Offset(0, 0) : const Offset(0, 0.1),
          duration: const Duration(milliseconds: 500),
          child: Container(
            color: Colors.grey[200],
            child: GestureDetector(
              onTapDown: (_) {
                setState(() {
                  isHovered = true;
                });
              },
              onTapUp: (_) {
                setState(() {
                  isHovered = false;
                });
              },
              child: MouseRegion(
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
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  padding: kIsWeb? const EdgeInsets.all(35.0): const EdgeInsets.all(16.0),
                  height: kIsWeb ? 500 : 300,
                  decoration: BoxDecoration(
                    color: const Color(0xFDE9F1FA),
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: isHovered
                        ? [
                      BoxShadow(
                        color: Colors.blueAccent.withOpacity(0.2),
                        spreadRadius: 3,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                      BoxShadow(
                        color: Colors.blueAccent.withOpacity(0.2),
                        spreadRadius: 3,
                        blurRadius: 5,
                        offset: const Offset(0, -3),
                      ),
                    ]
                        : [],
                  ),
                  child: Column(
                    children: [
                      const AnimatedOpacity(

                        opacity: 1.0,
                        duration: Duration(milliseconds: 500),
                        child: Text(
                          'Our Team',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Playfair',
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(height: 50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildTeamMember(
                            context,
                            'assets/images/about/ceo.png',
                            'Mr. ',
                            'CFO',
                            ' CH ABDULREHMAN',
                            screenWidth,
                          ),
                          _buildTeamMember(
                            context,
                            'assets/images/about/ceo.png',
                            'CH KHALID ',
                            'CEO',
                            ' CELL NUMBER 03225060793',
                            screenWidth,
                          ),
                          _buildTeamMember(
                            context,
                            'assets/images/about/ceo.png',
                            'CH ABDULLAH KHALID',
                            'Director',
                            '03325427552',
                            screenWidth,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }


//Team Members Widget inside Our Team
  Widget _buildTeamMember(BuildContext context, String imagePath, String name, String role, String description, double screenWidth) {
    double minWidth = screenWidth * 0.3 < 150 ? screenWidth * 0.3 : 150;
    double maxWidth = screenWidth * 0.3 > 180 ? screenWidth * 0.3 : 180;

    return MouseRegion(
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
      child: AnimatedScale(
        scale: isHovered ? 1.05 : 1.0,
        duration: const Duration(milliseconds: 300),
        child: Container(
          constraints: BoxConstraints(
            minWidth: minWidth,
            maxWidth: maxWidth,
          ),
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(imagePath),
                radius: 40,
              ),
              const SizedBox(height: 10),
              Text(
                name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                role,
                style: const TextStyle(
                  fontSize: 14,
                  fontStyle: FontStyle.normal,
                ),
              ),
              Text(
                description,
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}