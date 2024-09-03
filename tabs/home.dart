import 'package:flutter/material.dart';
import 'dart:async';
import 'package:video_player/video_player.dart';

import '../drawer/about_us.dart';
import '../product_pages/surveillance.dart';
import '../product_pages/weaponsights.dart';
import '../product_pages/lrf.dart';
import '../product_pages/tankapc.dart';
import '../drawer/services.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../widgets/WebInfoTab.dart';

class Tab1Content extends StatefulWidget {
  const Tab1Content({super.key});

  @override
  Tab1ContentState createState() => Tab1ContentState();
}

class Tab1ContentState extends State<Tab1Content>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late PageController _pageController;
  late PageController _productPageController;
  int _currentPage = 0;
  int _currentProductPage = 0;

  late AnimationController _animationController;

  late VideoPlayerController _videoController; // Video player controller
  late VideoPlayerController _videoController1; // Video player controller

  final List<String> _imagePaths = [
    'assets/ak.jpg',
    'assets/images/homepage/photg.jpg',
    'assets/images/homepage/photo-3a.jpg',
    'assets/images/about/leos1.png',
  ];

  final List<String> _productImages = [
    'assets/slideshow_surv_home.png',
    'assets/slideshow_weap_home.png',
    'assets/slideshow_tank_home.png',
    'assets/slideshow_lrf_home.png',
  ];

  final Map<int, bool> _isVisible = {}; // Map to track visibility of sections

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _productPageController = PageController();
    _startSlideshow();
    _startProductSlideshow();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _videoController = VideoPlayerController.asset('assets/0.mp4') // Initialize the video player
      ..initialize().then((_) {
        setState(() {}); // Ensure the first frame is shown after the video is initialized
      });

    _videoController1 = VideoPlayerController.asset('assets/Tuition.mp4') // Initialize the video player
      ..initialize().then((_) {
        setState(() {}); // Ensure the first frame is shown after the video is initialized
      });


  }

  @override
  void dispose() {
    _pageController.dispose();
    _productPageController.dispose();
    _animationController.dispose();
    _slideshowTimer?.cancel(); // Cancel the timer when the widget is disposed
    _productSlideshowTimer?.cancel();
    _videoController.dispose(); // Dispose of the video controller
    _videoController1.dispose(); // Dispose of the video controller
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;

  Timer? _slideshowTimer;
  Timer? _productSlideshowTimer;

  void _startSlideshow() {
    if (_slideshowTimer == null || !_slideshowTimer!.isActive) {
      _slideshowTimer =
          Timer.periodic(const Duration(seconds: 3), (Timer timer) {
            if (_pageController.hasClients && mounted) {
              // Check if the widget is still mounted
              int nextPage = _currentPage + 1;
              if (nextPage >= _imagePaths.length) {
                nextPage = 0;
              }
              _pageController.animateToPage(
                nextPage,
                duration: const Duration(seconds: 1),
                curve: Curves.easeInOut,
              );
              setState(() {
                _currentPage = nextPage;
              });
            }
          });
    }
  }

  void _startProductSlideshow() {
    if (_productSlideshowTimer == null || !_productSlideshowTimer!.isActive) {
      _productSlideshowTimer =
          Timer.periodic(const Duration(seconds: 3), (Timer timer) {
            if (_productPageController.hasClients && mounted) {
              int nextPage = _currentProductPage + 1;
              if (nextPage >= _productImages.length) {
                nextPage = 0;
              }
              _productPageController.animateToPage(
                nextPage,
                duration: const Duration(seconds: 1),
                curve: Curves.easeInOut,
              );
              setState(() {
                _currentProductPage = nextPage;
              });
            }
          });
    }
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  void _onProductPageChanged(int index) {
    setState(() {
      _currentProductPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context); // Important: call super.build when using AutomaticKeepAliveClientMixin
    final bool isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    final double screenHeight = MediaQuery.of(context).size.height;
    final double slideshowHeight = isPortrait ? screenHeight * 0.9 : screenHeight * 0.9;
    final double contentHeight = isPortrait ? screenHeight * 0.9 : screenHeight * 0.9;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const SizedBox(height: 10),
          SizedBox(
            height: slideshowHeight,
            child: Stack(
              children: [
                PageView.builder(
                  controller: _pageController,
                  itemCount: _imagePaths.length,
                  onPageChanged: _onPageChanged,
                  itemBuilder: (context, index) {
                    return FittedBox(
                      fit: BoxFit.cover,
                      child: Image.asset(
                        _imagePaths[index],
                      ),
                    );
                  },
                ),
                Positioned(
                  bottom: 10,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      _imagePaths.length,
                          (index) => _buildBar(index),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          VisibilityDetector(
            key: const Key('vision-section'),
            onVisibilityChanged: (visibilityInfo) {
              bool visible = visibilityInfo.visibleFraction > 0;
              if (visible) {
                setState(() {
                  _isVisible[0] = true;
                });
              } else {
                setState(() {
                  _isVisible[0] = false;
                });
              }
            },
            child: AnimatedOpacity(
              opacity: _isVisible[0] == true ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 500),
              child: AnimatedSlide(
                offset: _isVisible[0] == true ? const Offset(0, 0) : const Offset(-1, 0),
                duration: const Duration(milliseconds: 500),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final bool isWeb = constraints.maxWidth > 600;
                    return SizedBox(
                      height: contentHeight,
                      child: isWeb
                          ? Row(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                'assets/vision_home.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  const Text(
                                    'Our Vision - Innovation through Excellence',
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontFamily: 'Playfair',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const AboutUsPage(),
                                        ),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color.fromARGB(255, 12, 88, 150),
                                      foregroundColor: Colors.white,
                                    ),
                                    child: const Text('Learn More About Us'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                          : Column(
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              'assets/vision_home.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                const Text(
                                  'Our Vision - Innovation through Excellence',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontFamily: 'Playfair',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const AboutUsPage(),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color.fromARGB(255, 12, 88, 150),
                                    foregroundColor: Colors.white,
                                  ),
                                  child: const Text('Learn More About Us'),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          VisibilityDetector(
            key: const Key('product-section'),
            onVisibilityChanged: (visibilityInfo) {
              bool visible = visibilityInfo.visibleFraction > 0;
              if (visible) {
                setState(() {
                  _isVisible[1] = true;
                });
              } else {
                setState(() {
                  _isVisible[1] = false;
                });
              }
            },
            child: AnimatedOpacity(
              opacity: _isVisible[1] == true ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 500),
              child: AnimatedSlide(
                offset: _isVisible[1] == true ? const Offset(0, 0) : const Offset(-1, 0),
                duration: const Duration(milliseconds: 500),
                child: SizedBox(
                  height: contentHeight,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        'Our Product Range',
                        style: TextStyle(
                          fontSize: 24,
                          fontFamily: 'Playfair',
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Expanded(
                        child: PageView.builder(
                          controller: _productPageController,
                          itemCount: _productImages.length,
                          onPageChanged: _onProductPageChanged,
                          itemBuilder: (context, index) {
                            return FittedBox(
                              fit: BoxFit.cover,
                              child: Image.asset(
                                _productImages[index],
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          _productImages.length,
                              (index) => _buildProductBar(index),
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Surveillance(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 12, 88, 150),
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('Explore Surveillance'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Weaponsights(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 12, 88, 150),
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('Explore Weapon Sights'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Lrf(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 12, 88, 150),
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('Explore Laser Range Finders'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Tankapc(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 12, 88, 150),
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('Explore Tank/ APC'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          VisibilityDetector(
            key: const Key('services-section'),
            onVisibilityChanged: (visibilityInfo) {
              bool visible = visibilityInfo.visibleFraction > 0;
              if (visible) {
                setState(() {
                  _isVisible[2] = true;
                });
              } else {
                setState(() {
                  _isVisible[2] = false;
                });
              }
            },
            child: AnimatedOpacity(
              opacity: _isVisible[2] == true ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 500),
              child: AnimatedSlide(
                offset: _isVisible[2] == true ? const Offset(0, 0) : const Offset(-1, 0),
                duration: const Duration(milliseconds: 500),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ServicesPage(),
                      ),
                    );
                  },
                  child: Container(
                    height: contentHeight,
                    color: Colors.blue[50],
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Icon(
                            Icons.build,
                            size: 100,
                            color: Colors.blue,
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            'Our Services',
                            style: TextStyle(
                              fontSize: 24,
                              fontFamily: 'Playfair',
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Tap to Learn More',
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Playfair',
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),






















          const SizedBox(height: 20),
          Container(
            height: contentHeight,
            color: Colors.blueGrey[50],
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'Home Tuition services \n Cell NO:03325427552 \n https://www.facebook.com/profile.php?id=100092401413539&mibextid=ZbWKwL',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Playfair',
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 10),
                  _videoController1.value.isInitialized
                      ? SizedBox(
                    width:600 ,// Set the desired width
                    height: 500,// Set the desired height
                    child: VideoPlayer(_videoController1),
                  )
                      : const CircularProgressIndicator(),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _videoController1.value.isPlaying
                            ? _videoController1.pause()
                            : _videoController1.play();
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 12, 88, 150),
                      foregroundColor: Colors.white,
                    ),
                    child: Text(
                      _videoController1.value.isPlaying ? 'Pause Video' : 'Play Video',
                    ),
                  ),
                ],
              ),
            ),
          ),











          const SizedBox(height: 20),
          Container(
            height: contentHeight,
            color: Colors.blueGrey[50],
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'AI Short Courses \n Cell NO:03325427552',
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'Playfair',
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 10),
                  _videoController.value.isInitialized
                      ? SizedBox(
                    width:600 ,// Set the desired width
                    height: 500,// Set the desired height
                    child: VideoPlayer(_videoController),
                  )
                      : const CircularProgressIndicator(),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _videoController.value.isPlaying
                            ? _videoController.pause()
                            : _videoController.play();
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 12, 88, 150),
                      foregroundColor: Colors.white,
                    ),
                    child: Text(
                      _videoController.value.isPlaying ? 'Pause Video' : 'Play Video',
                    ),
                  ),
                ],
              ),
            ),
          ),









        ],
      ),
    );
  }

  Widget _buildBar(int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 2.0),
      height: 8.0,
      width: _currentPage == index ? 24.0 : 16.0,
      decoration: BoxDecoration(
        color: _currentPage == index ? Colors.blue : Colors.grey,
        borderRadius: BorderRadius.circular(4.0),
      ),
    );
  }

  Widget _buildProductBar(int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 2.0),
      height: 8.0,
      width: _currentProductPage == index ? 24.0 : 16.0,
      decoration: BoxDecoration(
        color: _currentProductPage == index ? Colors.blue : Colors.grey,
        borderRadius: BorderRadius.circular(4.0),
      ),
    );
  }
}
