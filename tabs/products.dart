import 'package:flutter/material.dart';
import '../lrf_pages/ar_3.dart';
import '../surveillance_pages/abtiq_640.dart';
import '../surveillance_pages/alharis_75.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../product_pages/surveillance.dart';
import '../product_pages/weaponsights.dart';
import '../product_pages/lrf.dart';
import '../product_pages/tankapc.dart';
import '../weaponsights_pages/tisa_506b.dart';

class Tab2Content extends StatefulWidget {
  const Tab2Content({super.key});

  @override
  Tab2ContentState createState() => Tab2ContentState();
}

class Tab2ContentState extends State<Tab2Content> with SingleTickerProviderStateMixin {
  final List<String> _slideshowImages = [
    'assets/TISA_506B.jpg',
    'assets/ABTIQ_640.JPG',
    'assets/ALHARIS_75_2.JPG',
    'assets/AR_3.JPG',
  ];

  late PageController _slideshowController;
  late ScrollController _scrollController;
  final Map<int, bool> _isVisible = {};

  @override
  void initState() {
    super.initState();
    _slideshowController = PageController();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _slideshowController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    bool isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    double carouselHeight = isPortrait ? screenHeight * 0.95 : screenHeight * 0.95;
    double categoriesHeight = isPortrait ? screenHeight * 0.6 : screenHeight * 0.7; // Updated height

    return SingleChildScrollView(
      controller: _scrollController,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: carouselHeight,
            child: PageView.builder(
              controller: _slideshowController,
              itemCount: _slideshowImages.length,
              itemBuilder: (context, index) {
                return Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      _slideshowImages[index],
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: carouselHeight,
                    ),
                    Positioned(
                      bottom: 250.0,
                      left: MediaQuery.of(context).size.width * 0.45, // Adjust the position
                      child: ElevatedButton(
                        onPressed: () {
                          _navigateToPage(_slideshowImages[index]);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 12, 88, 150),
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('View Product'),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),

          const SizedBox(height: 50.0),
          Center(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 16.0),
              child: const Text(
                'Product Categories',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 12, 88, 150),
                ),
              ),
            ),
          ),
          const SizedBox(height: 50.0),
          for (int i = 0; i < _categories.length; i++)
            VisibilityDetector(
              key: Key('category-$i'),
              onVisibilityChanged: (visibilityInfo) {
                bool visible = visibilityInfo.visibleFraction > 0;
                if (visible) {
                  setState(() {
                    _isVisible[i] = true;
                  });
                } else {
                  setState(() {
                    _isVisible[i] = false;
                  });
                }
              },
              child: AnimatedOpacity(
                opacity: _isVisible[i] == true ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 500),
                child: AnimatedSlide(
                  offset: _isVisible[i] == true ? Offset.zero : (i % 2 == 1 ? const Offset(1, 0) : const Offset(-1, 0)),
                  duration: const Duration(milliseconds: 500),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => _categories[i].page,
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 5.0),
                      height: categoriesHeight,
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(_categories[i].imagePath),
                                  fit: BoxFit.cover,
                                ),
                               
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.3),
                                    spreadRadius: 1,
                                    blurRadius: 5,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Stack(
                                children: [
                                  Positioned.fill(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [Colors.black.withOpacity(0.5), Colors.transparent],
                                          begin: Alignment.bottomCenter,
                                          end: Alignment.topCenter,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      _categories[i].title,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontSize: 28,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        shadows: [
                                          Shadow(
                                            color: Colors.black,
                                            blurRadius: 8.0,
                                            offset: Offset(0, 0),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: (i % 2 == 1) ? 10.0 : null,
                                    top: (i % 2 == 0) ? 10.0 : null,
                                    left: (i % 2 == 1) ? 10.0 : null,
                                    right: (i % 2 == 1) ? null : 10.0,
                                    child: AnimatedOpacity(
                                      opacity: _isVisible[i] == true ? 1.0 : 0.0,
                                      duration: const Duration(milliseconds: 500),
                                      child: AnimatedSlide(
                                        offset: _isVisible[i] == true ? Offset.zero : (i % 2 == 1 ? const Offset(1, 0) : const Offset(-1, 0)),
                                        duration: const Duration(milliseconds: 500),
                                        child: Container(
                                          width: 200,
                                          padding: const EdgeInsets.all(8.0),
                                          color: Colors.transparent,
                                          child: Text(
                                            _categories[i].description,
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontFamily: 'Roboto',
                                              shadows: [
                                                Shadow(
                                                  color: Colors.black,
                                                  blurRadius: 4.0,
                                                  offset: Offset(0, 2),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }


  void _navigateToPage(String imagePath) {
    Widget page;
    switch (imagePath) {
      case 'assets/TISA_506B.jpg':
        page = const Tisa506B();
        break;
      case 'assets/ABTIQ_640.JPG':
        page = const Abtiq640();
        break;
      case 'assets/ALHARIS_75_2.JPG':
        page = const Alharis75();
        break;
      case 'assets/AR_3.JPG':
        page = const Ar3();
        break;
      default:
        return;
    }
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }


  final List<Category> _categories = [
    Category('Surveillance Products', 'assets/surveillance-product.JPG', const Surveillance(), 'Brief description for Surveillance Products.'),
    Category('Tank/APC\'s Sights', 'assets/DSC00177.JPG', const Tankapc(), 'Brief description for Tank/APC\'s Sights.'),
    Category('Weapon\'s Sights', 'assets/DSC00013.jpg', const Weaponsights(), 'Brief description for Weapon\'s Sights.'),
    Category('LRF & LTDR', 'assets/ABLDR_2.JPG', const Lrf(), 'Brief description for LRF & LTDR.'),
  ];
}


class Category {
  final String title;
  final String imagePath;
  final Widget page;
  final String description;


  Category(this.title, this.imagePath, this.page, this.description);
}