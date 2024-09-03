import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../widgets/back.dart';
import '../tankapc_pages/absar_d.dart';
import '../tankapc_pages/absar_c.dart';
import '../drawer/drawer.dart';
import '../bars/bottom_nav.dart';

class Tankapc extends StatefulWidget {
  const Tankapc({super.key});

  @override
  State<Tankapc> createState() => _TankapcState();
}

class _TankapcState extends State<Tankapc> {
  void _onImageClickedABSAR_D() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AbsarD()));
  }

  void _onImageClickedABSAR_C() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AbsarC()));
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

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
                    'assets/tank_apc_banner.png',
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
                      'Tanks/APC\'s Sights',
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
              child: kIsWeb
                  ? _buildWebLayout(context)
                  : _buildMobileLayout(context),
            ),
          ],
        ),
      ),
      bottomNavigationBar: !kIsWeb ? const FixedBottomNavigationBar(canPop: true) : null,
    );
  }

  Widget _buildWebLayout(BuildContext context) {
    return Column(
      children: <Widget>[
        _buildProductRow(
          context,
          products: [
            ProductItem(
              onTap: _onImageClickedABSAR_D,
              image: 'assets/ABSAR_D.JPG',
              title: 'ABSAR-D',
            ),
            ProductItem(
              onTap: _onImageClickedABSAR_C,
              image: 'assets/ABSAR_C.JPG',
              title: 'ABSAR-C',
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      children: <Widget>[
        _buildProductRow(
          context,
          products: [
            ProductItem(
              onTap: _onImageClickedABSAR_D,
              image: 'assets/ABSAR_D.JPG',
              title: 'ABSAR-D',
            ),
            ProductItem(
              onTap: _onImageClickedABSAR_C,
              image: 'assets/ABSAR_C.JPG',
              title: 'ABSAR-C',
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildProductRow(BuildContext context, {required List<ProductItem> products}) {
    double screenWidth = MediaQuery.of(context).size.width;
    double imageWidth = kIsWeb ? screenWidth * 0.3 : screenWidth * 0.4; // Adjust width based on platform
    double imageHeight = kIsWeb ? screenWidth * 0.25 : screenWidth * 0.4; // Adjust height based on platform

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: products
          .map((product) => _buildProductItem(context, product, imageWidth, imageHeight))
          .toList(),
    );
  }

  Widget _buildProductItem(BuildContext context, ProductItem product, double width, double height) {
    return Column(
      children: <Widget>[
        InkWell(
          onTap: product.onTap,
          splashColor: Colors.blue,
          borderRadius: BorderRadius.circular(10),
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 10.0),
            width: width,
            height: height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(product.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Text(
          product.title,
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

class ProductItem {
  final VoidCallback onTap;
  final String image;
  final String title;

  ProductItem({
    required this.onTap,
    required this.image,
    required this.title,
  });
}
