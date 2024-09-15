import 'package:flutter/material.dart'; // Import the new AppBar without TabBar
import '../drawer/drawer.dart';
import '../bars/bottom_nav.dart'; // Import your FixedBottomNavigationBar widget
import 'package:flutter/foundation.dart' show kIsWeb;

import '../widgets/webinfotab.dart';

class ServicesPage extends StatefulWidget {
  const ServicesPage({super.key});

  @override
  State<ServicesPage> createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  final ScrollController _scrollController = ScrollController();

  int selectedSectionIndex = -1; 
 // No section is selected initially

  void _scrollToSection(double offset, int index) {
    setState(() {
      selectedSectionIndex = index; // Set the selected section index
    });
    _scrollController.animateTo(
      offset,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      drawer: FixedDrawer(
        onItemSelected: (context, itemTitle) {
          // The navigation is handled by FixedDrawer itself.
        },
      ),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.2,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Image.asset(
                  'assets/services_banner.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 10), // Dynamic height for the banner image
            const SizedBox(height: 16), // Adjusted gap between title and content
            _buildFirstContainer(context), // Container with "We Provide ..." and buttons
            const SizedBox(height: 5), // Adjusted gap between containers
            _buildServiceSection(
              context,
              'OPTICAL COMPONENT PRODUCTION',
              'assets/optical_component_circle.png',
              'Lenses\nPrisms\nMirrors\nWindows\nBeam Splitters\nCollimation Testers',
              550,
              index: 0, // Pass the index to determine layout order
            ),
            const SizedBox(height: 5), // Gap between sections
            _buildServiceSection(
              context,
              'MULTILAYER COATINGS',
              'assets/dielectric_mirrors-modified.png',
              'Antireflection coating \nPartial reflection mirrors \nNarrow ban filters \nNatural beam splitters \nPolarizing filters \nDichroic coating',
              750,
              index: 1,
            ),
            const SizedBox(height: 5), // Gap between sections
            _buildServiceSection(
              context,
              'ENVIRONMENTAL TESTING',
              'assets/Environmental-testing-modified.png',
              'Force upto 10KN \nMechanical vibration 10-4, 000Hz \nShock of 40g for duration of 6msec \nShock of 20g for duration of 12msec \nTemperature -80C to 180C \nRelative humidity 10% -95%',
              1150,
              index: 2,
            ),
            const SizedBox(height: 5), // Gap between sections
            _buildServiceSection(
              context,
              'SURFACE MOUNT ASSEMBLY',
              'assets/Surface-mount-modified.png',
              'We Handle fine pitch components and BGAs for high density boards coupled with a proven ability to manufacture high reliability electronics assemblies.\n \n Salient capabilities of assembly line are: \nBGAa, QFPs (upto 025mm pitch) \nPassive Components down to 0402',
              1450,
              index: 3,
            ),
            const SizedBox(height: 5), // Gap between sections
            _buildServiceSection(
              context,
              'CRYSTAL GROWTH',
              'assets/crystal-growth-modified.png',
              'High temperature furnaces \nAuto-Collimators \nCrystal puller \nLow temperature crystal growth \nOptical microscope \nCutting and polishing facility \nX-Rays diffractometer \nExtinction measurement system',
              1650,
              index: 4,
            ),
            const SizedBox(height: 5), // Gap between sections
            _buildServiceSection(
              context,
              'MECHANICAL SHOP',
              'assets/mechanical-modified.png',
              'Multi-axis milling (5-axis milling machine )/ turning \nElectrical Discharge Machining (EDM) \nPecision deburring and Vibratory and rotary finishing and extrude handling \nGrinding',
              1950,
              index: 5,
            ),
            const SizedBox(height: 5), // Gap between sections
            _buildServiceSection(
              context,
              'WIRE HARNESS FABRICATION AND TESTING',
              'assets/Wire-Harness-modified.png',
              'Manufacturing of MIL-std electrical wire harnesses for military applications & complete testing as per MIL specifications for such harnesses.',
              2250,
              index: 6,
            ),
            const SizedBox(height:50),
            const webinfotab(),
            const SizedBox(height:50),
          ],
        ),
      ),
      bottomNavigationBar: !kIsWeb ? const FixedBottomNavigationBar(canPop: true) : null,

    );
  }

  Widget _buildFirstContainer(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 600;

    return LayoutBuilder(
      builder: (context, constraints) {
        return isMobile
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/service.jpg', // Replace with your image asset path
                    fit: BoxFit.cover,
                    height: MediaQuery.of(context).size.width * 0.4, // Adjust height as needed
                    width: double.infinity,
                  ),
                  const SizedBox(height: 8),
                  _buildButtonContainer(),
                ],
              )
            : Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Image.asset(
                      'assets/service.jpg', // Replace with your image asset path
                      fit: BoxFit.cover,
                      height: MediaQuery.of(context).size.width * 0.4, // Keep the same height as the card
                    ),
                  ),
                  const SizedBox(width: 8), // Add some spacing between the image and the card
                  Expanded(
                    flex: 1,
                    child: _buildButtonContainer(),
                  ),
                ],
              );
      },
    );
  }

  Widget _buildButtonContainer() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3), // Reduced opacity of shadow
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          RoundedButton(
            label: 'Optical Component Production',
            imagePath: 'assets/optical_component_circle.png',
            onPressed: () {
              _scrollToSection(550, 0); // Scroll to Optical Components section
            },
          ),
          const SizedBox(height: 8), // Adjusted height for spacing
          RoundedButton(
            label: 'Multilayer Coatings',
            imagePath: 'assets/dielectric_mirrors-modified.png',
            onPressed: () {
              _scrollToSection(850, 1); // Scroll to Multilayer Coatings section
            },
          ),
          const SizedBox(height: 8), // Adjusted height for spacing
          RoundedButton(
            label: 'Environmental Testing',
            imagePath: 'assets/Environmental-testing-modified.png',
            onPressed: () {
              _scrollToSection(1150, 2); // Scroll to Environmental Testing section
            },
          ),
          const SizedBox(height: 8), // Adjusted height for spacing
          RoundedButton(
            label: 'Surface Mount Assembly',
            imagePath: 'assets/Surface-mount-modified.png',
            onPressed: () {
              _scrollToSection(1450, 3); // Scroll to Surface Mount Assembly section
            },
          ),
          const SizedBox(height: 8), // Adjusted height for spacing
          RoundedButton(
            label: 'Crystal Growth',
            imagePath: 'assets/crystal-growth-modified.png',
            onPressed: () {
              _scrollToSection(1650, 4); // Scroll to Crystal Growth section
            },
          ),
          const SizedBox(height: 8), // Adjusted height for spacing
          RoundedButton(
            label: 'Mechanical Shop',
            imagePath: 'assets/mechanical-modified.png',
            onPressed: () {
              _scrollToSection(1950, 5); // Scroll to Mechanical Shop section
            },
          ),
          const SizedBox(height: 8), // Adjusted height for spacing
          RoundedButton(
            label: 'Wire Harness Fabrication and Testing',
            imagePath: 'assets/Wire-Harness-modified.png',
            onPressed: () {
              _scrollToSection(2250, 6); // Scroll to Wire Harness Fabrication and Testing section
            },
          ),
        ],
      ),
    );
  }

  Widget _buildServiceSection(
    BuildContext context,
    String title,
    String imagePath,
    String bulletPoints,
    double scrollOffset, {
    required int index,
  }) {
    // Determine if the image should be on the left or right based on the index
    final bool isImageOnLeft = index % 2 == 0;
    final bool isSelected = selectedSectionIndex == index;

    return GestureDetector(
      onTap: () {
        _scrollToSection(scrollOffset, index);
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected
              ? const Color.fromARGB(80, 146, 159, 230) // Slight dark blue translucent color
              : const Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(0),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  flex: isImageOnLeft ? 1 : 0,
                  child: isImageOnLeft
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Image.asset(
                              imagePath,
                              height: 190, // Adjust image height as needed
                              width: 250,
                              fit: BoxFit.fitHeight,
                            ),
                            const SizedBox(height: 8),
                            Container(
                              height: 1,
                              color: Colors.black.withOpacity(0.3), // Thin line divider color
                            ),
                          ],
                        )
                      : Container(), // Empty container if image is on the right
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            fontSize: 20,
                            fontFamily: 'Roboto', // Use Roboto font
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                          textAlign: TextAlign.left,
                        ),
                        if (bulletPoints.isNotEmpty) ...[
                          const SizedBox(height: 16),
                          Text(
                            bulletPoints,
                            style: const TextStyle(
                              fontSize: 16,
                              fontFamily: 'Roboto', // Use Roboto font
                              color: Color.fromARGB(255, 55, 54, 54),
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: isImageOnLeft ? 0 : 1,
                  child: !isImageOnLeft
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Image.asset(
                              imagePath,
                              height: 190, // Adjust image height as needed
                              width: 250,
                              fit: BoxFit.fitHeight,
                            ),
                            const SizedBox(height: 8),
                            Container(
                              height: 1,
                              color: Colors.black.withOpacity(0.3), // Thin line divider color
                            ),
                          ],
                        )
                      : Container(), // Empty container if image is on the left
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class RoundedButton extends StatefulWidget {
  final String label;
  final String imagePath;
  final VoidCallback? onPressed;

  const RoundedButton({
    super.key,
    required this.label,
    required this.imagePath,
    this.onPressed,
  });

  @override
  _RoundedButtonState createState() => _RoundedButtonState();
}

class _RoundedButtonState extends State<RoundedButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => _onHover(true),
      onExit: (event) => _onHover(false),
      child: AnimatedScale(
        scale: _isHovered ? 1.05 : 1.0, // Scale button when hovered
        duration: const Duration(milliseconds: 200), // Animation duration
        curve: Curves.easeInOut,
        child: GestureDetector(
          onTap: widget.onPressed,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20), // Adjusted padding for button size
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10), // Reduced border radius
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey, // Reduced opacity of shadow
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                Image.asset(
                  widget.imagePath,
                  width: 30, // Adjusted image size
                  height: 30, // Adjusted image size
                  fit: BoxFit.contain,
                ),
                const SizedBox(width: 4), // Adjusted width for spacing between image and text
                Expanded(
                  child: Text(
                    widget.label,
                    style: const TextStyle(
                      fontSize: 12, // Reduced font size
                      fontFamily: 'Roboto',
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onHover(bool isHovered) {
    setState(() {
      _isHovered = isHovered;
    });
  }
}
