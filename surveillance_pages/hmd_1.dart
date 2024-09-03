import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/back.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../drawer/drawer.dart';
import '../bars/bottom_nav.dart';
import '../product_pages/surveillance.dart';
import '../widgets/quote.dart';
import '../tabs/contact_us.dart';

class Hmd1 extends StatefulWidget {
  const Hmd1({super.key});

  @override
  Hmd1State createState() => Hmd1State();
}

class Hmd1State extends State<Hmd1> with TickerProviderStateMixin {
  bool isHovered = false;
  Color textColor = Colors.black;
  String _selectedImage = 'assets/FAODIND.JPG';
  bool showMore = false;
  bool showDetails = false;
  bool showSpecifications = false;
  bool _showGreyApplicability = false;
  bool _showGreySpecifications = false;
  final List<String> _carouselImages = [
    'assets/FAOD.jpg',
    'assets/FAOD_2.JPG',
    'assets/FAOD_3.JPG',
    'assets/FAOD_4.JPG',
  ];
  int _currentIndex = 0;
  late PageController _pageController;
  late ScrollController _scrollController;

  final TextStyle tableTextStyle = const TextStyle(
    fontFamily: 'Playfair',
    fontSize: 16,
    color: Colors.blueGrey,
  );

  // Animation controllers
  late AnimationController _descriptionAnimationController;
  late AnimationController _carouselAnimationController;
  late AnimationController _applicabilityAnimationController;
  late AnimationController _specificationsAnimationController;
  late AnimationController _greyAnimationController;



  // Animations
  late Animation<double> _descriptionAnimation;
  late Animation<Offset> _carouselAnimation;
  late Animation<Offset> _applicabilityAnimation;
  late Animation<Offset> _specificationsAnimation;
  late Animation<double> _descriptionScaleAnimation;
  late Animation<Color?> _greyAnimation;

  @override
  void initState() {
    super.initState();

    _pageController = PageController(initialPage: _currentIndex);



    // Initialize ScrollController
    _scrollController = ScrollController()
      ..addListener(() {
        // Add scroll listener logic if needed
      });

    // Initialize animation controllers and animations
    _descriptionAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _carouselAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _applicabilityAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _specificationsAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _greyAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );



    _descriptionAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _descriptionAnimationController, curve: Curves.easeIn),
    );

    _descriptionScaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _descriptionAnimationController, curve: Curves.easeIn),
    );

    _carouselAnimation = Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero).animate(
      CurvedAnimation(parent: _carouselAnimationController, curve: Curves.easeIn),
    );

    _applicabilityAnimation = Tween<Offset>(begin: const Offset(-1, 0), end: Offset.zero).animate(
      CurvedAnimation(parent: _applicabilityAnimationController, curve: Curves.easeIn),
    );

    _specificationsAnimation = Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero).animate(
      CurvedAnimation(parent: _specificationsAnimationController, curve: Curves.easeIn),
    );

    _greyAnimation = ColorTween(begin: Colors.white, end: Colors.grey[300]).animate(
      CurvedAnimation(parent: _greyAnimationController, curve: Curves.easeIn),
    );

  }

  @override
  void dispose() {
    _scrollController.dispose();
    _descriptionAnimationController.dispose();
    _carouselAnimationController.dispose();
    _applicabilityAnimationController.dispose();
    _specificationsAnimationController.dispose();
    _greyAnimationController.dispose();
    _pageController.dispose();
    super.dispose();
  }


  void _toggleDetails() {
    setState(() {
      showDetails = !showDetails;
    });
  }

  void _toggleSpecifications() {
    setState(() {
      showSpecifications = !showSpecifications;
    });
  }

  void _showGreyBackground(String section) {
    setState(() {
      if (section == 'applicability') {
        _showGreyApplicability = true;
      } else if (section == 'specifications') {
        _showGreySpecifications = true;
      }
    });
    _greyAnimationController.forward();
    // Reset grey background after 1 second
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        if (section == 'applicability') {
          _showGreyApplicability = false;
        } else if (section == 'specifications') {
          _showGreySpecifications = false;
        }
      });
      _greyAnimationController.reverse();
    });
  }




  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    final carouselHeight = orientation == Orientation.landscape
        ? MediaQuery.of(context).size.height * 0.8
        : MediaQuery.of(context).size.height * 0.8;

    return Scaffold(
      drawer: FixedDrawer(
        onItemSelected: (context, itemTitle) {
          // The navigation is handled by FixedDrawer itself.
        },
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        controller: _scrollController,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 16),
            const BackButtonWidget(),
            const Text(
              'Helmet Mount Display (HMD-1)',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 12, 88, 150),
              ),
            ),
            const SizedBox(height: 8),
            _buildHoverText(),
            const SizedBox(height: 8),
            const Divider(),
            const SizedBox(height: 16),
            _buildImageRow(),
            const SizedBox(height: 50),
            VisibilityDetector(
              key: const Key('description'),
              onVisibilityChanged: (visibilityInfo) {
                if (visibilityInfo.visibleFraction > 0.1) {
                  _descriptionAnimationController.forward();

                }
              },
              child: FadeTransition(
                opacity: _descriptionAnimation,
                child: ScaleTransition(
                  scale: _descriptionScaleAnimation,
                  child: const Text(
                    'Additional details or description to be added,',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 17,
                      fontFamily: 'Playfair',
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'Sample Output Images',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Playfair',
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey,
              ),
            ),
            const SizedBox(height: 16),
            VisibilityDetector(
              key: const Key('carousel'),
              onVisibilityChanged: (visibilityInfo) {
                if (visibilityInfo.visibleFraction > 0.1) {
                  _carouselAnimationController.forward();
                }
              },
              child: SlideTransition(
                position: _carouselAnimation,
                child: _buildCarouselSlider(carouselHeight),
              ),
            ),
            const SizedBox(height: 40),
            const Divider(),
            GestureDetector(
              onTap: () => _showGreyBackground('applicability'),
              child: VisibilityDetector(
                key: const Key('applicability'),
                onVisibilityChanged: (visibilityInfo) {
                  if (visibilityInfo.visibleFraction > 0.1) {
                    _applicabilityAnimationController.forward();
                  }
                },
                child: Stack(
                  children: [
                    SlideTransition(
                      position: _applicabilityAnimation,
                      child: Container(
                        padding: const EdgeInsets.all(16.0),
                        child: _buildApplicability(),
                      ),
                    ),
                    AnimatedBuilder(
                      animation: _greyAnimationController,
                      builder: (context, child) {
                        return Container(
                          color: _showGreyApplicability
                              ? _greyAnimation.value?.withOpacity(0.5)
                              : Colors.transparent,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            const Divider(),
            GestureDetector(
              onTap: () => _showGreyBackground('specifications'),
              child: VisibilityDetector(
                key: const Key('specifications'),
                onVisibilityChanged: (visibilityInfo) {
                  if (visibilityInfo.visibleFraction > 0.1) {
                    _specificationsAnimationController.forward();
                  }
                },
                child: Stack(
                  children: [
                    SlideTransition(
                      position: _specificationsAnimation,
                      child: Container(
                        padding: const EdgeInsets.all(16.0),
                        child: Center(
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: _buildSpecifications(),
                          ),
                        ),
                      ),
                    ),
                    AnimatedBuilder(
                      animation: _greyAnimationController,
                      builder: (context, child) {
                        return Container(
                          color: _showGreySpecifications
                              ? _greyAnimation.value?.withOpacity(0.5)
                              : Colors.transparent,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: QuoteFAB(
        onPressed: () {
          Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const ContactUsPage()),
          );
        },
      ),
      bottomNavigationBar: !kIsWeb ? const FixedBottomNavigationBar(canPop: true) : null,
    );
  }

  Widget _buildHoverText() {
    return MouseRegion(
      onEnter: (_) => setState(() {
        isHovered = true;
        textColor = const Color.fromARGB(255, 12, 88, 150);
      }),
      onExit: (_) => setState(() {
        isHovered = false;
        textColor = Colors.black;
      }),
      child: GestureDetector(
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const Surveillance()),
        ),
        child: Text(
          'Surveillance/Hmd-1',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 11,
            fontFamily: 'Roboto',
            color: textColor,
          ),
        ),
      ),
    );
  }

  Widget _buildImageRow() {
    final imageHeight = MediaQuery.of(context).orientation == Orientation.landscape
        ? MediaQuery.of(context).size.height * 0.6
        : MediaQuery.of(context).size.height * 0.4;

    return SizedBox(
      height: imageHeight,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildThumbnail('assets/FAODIND.JPG'),
              const SizedBox(height: 8),
              _buildThumbnail('assets/FAODIND_2.JPG'),
            ],
          ),
          const SizedBox(width: 16),
          const VerticalDivider(width: 1, color: Colors.grey),
          const SizedBox(width: 16),
          Expanded(
            child: Image.asset(_selectedImage, fit: BoxFit.contain),
          ),
        ],
      ),
    );
  }

  Widget _buildThumbnail(String imagePath) {
    final isSelected = _selectedImage == imagePath;

    return GestureDetector(
      onTap: () => setState(() => _selectedImage = imagePath),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(
                color: isSelected ? Colors.lightBlueAccent : Colors.transparent,
                width: 2,
              ),
            ),
            child: Image.asset(imagePath, fit: BoxFit.cover),
          ),
          if (isSelected)
            Positioned(
              left: -10,
              top: 30,
              child: Container(
                width: 15,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.lightBlue,
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildCarouselSlider(double carouselHeight) {
    return SizedBox(
      height: carouselHeight,
      child: PageView.builder(
        controller: _pageController,
        itemCount: _carouselImages.length,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        itemBuilder: (context, index) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            transform: Matrix4.identity()..scale(1.005), // Adjust the scale if needed
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                _carouselImages[index],
                fit: BoxFit.fitHeight,
                width: double.infinity,
                height: carouselHeight,
              ),
            ),
          );
        },
      ),
    );
  }



  Widget _buildApplicability() {
    return Column(
      children: [
        GestureDetector(
          onTap: _toggleDetails,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Applications',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Playfair',
                  fontWeight: FontWeight.bold,
                  color: showDetails ? Colors.blue : Colors.blueGrey,
                ),
                textAlign: TextAlign.left,
              ),
              Icon(
                showDetails ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                color: showDetails ? Colors.blue : Colors.blueGrey,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSpecifications() {
    return Column(
      children: [
        GestureDetector(
          onTap: _toggleSpecifications,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Technical Specifications',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Playfair',
                  fontWeight: FontWeight.bold,
                  color: showSpecifications ? Colors.blue : Colors.blueGrey,
                ),
                textAlign: TextAlign.left,
              ),
              Icon(
                showSpecifications ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                color: showSpecifications ? Colors.blue : Colors.blueGrey,
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        if (showSpecifications)
          Table(
            columnWidths: const {
              0: FlexColumnWidth(1),
              1: FlexColumnWidth(2),
            },
            border: TableBorder.all(color: Colors.grey),
            children: [
        _buildTableRow('Display', 'Color AMOLED Display (800×600)'),
        _buildTableRow('Eye Relief', '20mm'),
        _buildTableRow('Diopter', '+2D to -2D'),
        _buildTableRow('Cable Length', '1m (flexible)'),
        _buildTableRow('Mechanical Interface', 'Engage with mounting screw of helmet'),
        _buildTableRow('Operating Temperature', '-35°C to +55°C'),
        _buildTableRow('Storage Temperature', '-40°C to +70°C'),
        _buildTableRow('Encapsulation', 'IP67'),
        _buildTableRow('Vibration & Shock', 'MIL-STD-810G'),
            ],
          ),
      ],
    );
  }

  TableRow _buildTableRow(String parameter, String value) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(parameter, style: tableTextStyle),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(value, style: tableTextStyle),
        ),
      ],
    );
  }
}

class GreyAnimationOverlay extends StatelessWidget {
  final Animation<double> animation;
  final Widget child;

  const GreyAnimationOverlay({
    super.key,
    required this.animation,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animation,
      child: ColorFiltered(
        colorFilter: ColorFilter.mode(
          Colors.grey.withOpacity(0.5),
          BlendMode.srcATop,
        ),
        child: child,
      ),
    );
  }
}