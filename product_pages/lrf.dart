import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../widgets/back.dart';
import '../lrf_pages/ldr_4n.dart';
import '../lrf_pages/abldr_2.dart';
import '../lrf_pages/aa3.dart';
import '../lrf_pages/laserpointer.dart';
import '../lrf_pages/ar_3.dart';
import '../drawer/drawer.dart';
import '../bars/bottom_nav.dart';

class Lrf extends StatefulWidget {
  const Lrf({super.key});

  @override
  State<Lrf> createState() => _LrfState();
}

class _LrfState extends State<Lrf> {
  void _onImageClickedLDR_4N() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Ldr4n()));
  }

  void _onImageClickedABLDR_2() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Abldr2()));
  }

  void _onImageClickedAA3() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Aa3()));
  }

  void _onImageClickedLaserpointer() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Laserpointer()));
  }

  void _onImageClickedAR_3() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Ar3()));
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double imageHeight = screenWidth * (kIsWeb ? 0.25 : 0.4); // Reduced height for web

    return Scaffold(
      drawer: FixedDrawer(
        onItemSelected: (context, itemTitle) {
          // The navigation is handled by FixedDrawer itself.
        },
      ),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: screenWidth * 0.2,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  width: screenWidth,
                  alignment: Alignment.topCenter,
                  child: Image.asset(
                    'assets/lrf_banner.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const BackButtonWidget(), // Positioned on the left side
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 16.0),
                    child: const Text(
                      'LRF & LDTR',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 12, 88, 150),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10.0),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: _buildGridItems(context, imageHeight),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: !kIsWeb ? const FixedBottomNavigationBar(canPop: true) : null,
    );
  }

  List<Widget> _buildGridItems(BuildContext context, double height) {
    if (kIsWeb) {
      // Web layout: 3 items per row
      return [
        _buildRow(
          context,
          [
            _buildCategoryItem('assets/surveillance-product.JPG', 'LDR-4', _onImageClickedLDR_4N, height),
            _buildCategoryItem('assets/ABLDR_2.JPG', 'ABLDR-2A', _onImageClickedABLDR_2, height),
            _buildCategoryItem('assets/DSC00013.jpg', 'AA3', _onImageClickedAA3, height),
          ],
        ),
        _buildRow(
          context,
          [
            _buildCategoryItem('assets/laserpointer.JPG', 'Laser Pointer', _onImageClickedLaserpointer, height),
            _buildCategoryItem('assets/AR_3.JPG', 'AR-3', _onImageClickedAR_3, height),
          ],
        ),
      ];
    } else {
      // Mobile layout: 2 items per row
      return [
        _buildRow(
          context,
          [
            _buildCategoryItem('assets/surveillance-product.JPG', 'LDR-4', _onImageClickedLDR_4N, height),
            _buildCategoryItem('assets/ABLDR_2.JPG', 'ABLDR-2A', _onImageClickedABLDR_2, height),
          ],
        ),
        _buildRow(
          context,
          [
            _buildCategoryItem('assets/DSC00013.jpg', 'AA3', _onImageClickedAA3, height),
            _buildCategoryItem('assets/laserpointer.JPG', 'Laser Pointer', _onImageClickedLaserpointer, height),
          ],
        ),
        _buildRow(
          context,
          [
            _buildCategoryItem('assets/AR_3.JPG', 'AR-3', _onImageClickedAR_3, height),
          ],
        ),
      ];
    }
  }

  Widget _buildRow(BuildContext context, List<Widget> items) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: items,
    );
  }

  Widget _buildCategoryItem(String imagePath, String title, VoidCallback onTap, double height) {
    return Column(
      children: <Widget>[
        InkWell(
          onTap: onTap,
          splashColor: Colors.blue,
          borderRadius: BorderRadius.circular(10),
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 10.0),
            width: MediaQuery.of(context).size.width * (kIsWeb ? 0.3 : 0.4), // Increased width for web
            height: height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Text(
          title,
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 12, 88, 150),
          ),
        ),
      ],
    );
  }
}
