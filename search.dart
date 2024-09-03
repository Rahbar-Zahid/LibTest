import 'package:flutter/material.dart';
import '../surveillance_pages/hmd_1.dart';
import '../surveillance_pages/abtiq_640.dart';
import '../surveillance_pages/alharis_75.dart';
import '../surveillance_pages/faod.dart';
import '../surveillance_pages/tib786_1.dart';
import '../surveillance_pages/tib786_3.dart';
import '../tankapc_pages/absar_d.dart';
import '../tankapc_pages/absar_c.dart';
import '../weaponsights_pages/tisa_506a.dart';
import '../weaponsights_pages/tisa_506b.dart';
import '../weaponsights_pages/qanis_1.dart';
import '../lrf_pages/ldr_4n.dart';
import '../lrf_pages/abldr_2.dart';
import '../lrf_pages/aa3.dart';
import '../lrf_pages/laserpointer.dart';
import '../lrf_pages/ar_3.dart';

class SearchPage extends StatefulWidget {
  final String initialQuery;

  const SearchPage({
    super.key,
    this.initialQuery = '',
  });

  @override
  SearchPageState createState() => SearchPageState();
}

class SearchPageState extends State<SearchPage> {
  late TextEditingController _searchController;
  List<Product> _filteredProducts = [];

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController(text: widget.initialQuery);
    _searchController.addListener(_onSearchChanged);
    _filterProducts(widget.initialQuery);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    _filterProducts(_searchController.text);
  }

  void _filterProducts(String query) {
    setState(() {
      _filteredProducts = _allProducts
          .where((product) =>
              product.title.toLowerCase().contains(query.toLowerCase()) ||
              product.keywords.any((keyword) =>
                  keyword.toLowerCase().contains(query.toLowerCase())))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Main content of the page
        Scaffold(
          appBar: AppBar(
            title: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search Products',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    _searchController.clear();
                    _filterProducts('');
                  },
                ),
              ),
            ),
          ),
          body: const Center(
            child: Text('Search Page'), // Placeholder for main content
          ),
          backgroundColor: Colors.white,
        ),
        // Dropdown search suggestions
        if (_searchController.text.isNotEmpty && _filteredProducts.isNotEmpty)
          Positioned(
            top: kToolbarHeight, // Below the AppBar
            left: 0,
            right: 0,
            child: Material(
              elevation: 2.0,
              child: Container(
                color: Colors.white,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: _filteredProducts.length,
                  itemBuilder: (context, index) {
                    final product = _filteredProducts[index];
                    return ListTile(
                      leading: Image.asset(
                        product.imagePath,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                      title: Text(product.title),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => product.page,
                          ),
                        );
                        _searchController.clear(); // Clear search after selection
                      },
                    );
                  },
                ),
              ),
            ),
          ),
      ],
    );
  }

  List<Product> get _allProducts => [
        Product(
          'ABTIQ-256', 
          'assets/ABTIQ_640.JPG', 
          const Abtiq640(),
          ['surveillance', 'light weight thermal Imager', 'Quadcopter', 'AIRBORNE TI IMAGING FOR SMALL UAV'],
        ),
        Product(
          'ALHARIS-75', 
          'assets/ALHARIS_75.JPG', 
          const Alharis75(),
          ['surveillance', 'Long range', 'night vision surveillance sight', 'Perimeter Security', 'SURVEILLANCE TI'],
        ),
        Product(
          'FAOD', 
          'assets/FAOD.JPG', 
          const Faod(),
          ['surveillance', 'multi-sensor observation device', 'target GPS coordinates calculation', 'forward area surveillance', 'Perimeter Security', 'FORWARD ARTILLERY OBSERVATION DEVICE'],
        ),
        Product(
          'HMD-1', 
          'assets/FAOD.JPG', 
          const Hmd1(),
          ['surveillance', 'long range', 'night vision goggle', 'hand held', 'Helmet Mount Display'],
        ),
        Product(
          'TIB786-1', 
          'assets/TIB786_1.jpg', 
          const Tib7861(),
          ['surveillance', 'short range', 'night vision goggle', 'hand held', 'TI BINOCULAR'],
        ),
        Product(
          'TIB786-3', 
          'assets/TIB786_3.jpg', 
          const Tib7863(),
          ['surveillance', 'long range', 'night vision goggle', 'hand held', 'TI BINOCULAR'],
        ),
        Product(
          'ABSAR-C', 
          'assets/ABSAR_C.JPG', 
          const AbsarC(),
          ['long range', 'sight', 'armoured vehicles', 'APC COMMANDER TI SIGHT', 'tank apc sights'],
        ),
        Product(
          'ABSAR-D', 
          'assets/ABSAR_D.JPG', 
          const AbsarD(),
          ['short range', 'thermal imager based night vision', 'armoured vehicles', 'APC DRIVER TI SIGHT', 'tank apc sights'],
        ),
        Product(
          'QANIS', 
          'assets/TISA_506B.jpg', 
          const Qanis1(),
          ['short range', 'Sniper Shooting', 'Target Aiming', 'Thunderbolt Rifle', 'CLIP ON TI SIGHT'],
        ),
        Product(
          'TISA-506B', 
          'assets/TISA_506B.jpg', 
          const Tisa506B(),
          ['short range', 'compact light weight', 'Target Aiming', 'Helmet mountable', 'THERMAL WEAPON SIGHT', 'weapon sights'],
        ),
        Product(
          'TISA-506A', 
          'assets/TISA_506B.jpg', 
          const Tisa506A(),
          ['short range', 'compact light weight', 'Target Aiming', 'Helmet mountable', 'THERMAL WEAPON SIGHT', 'weapon sights'],
        ),
        Product(
          'AA3', 
          'assets/AR_3.JPG', 
          const Aa3(),
          ['LRF and LTDR', 'laser range finder', 'LASER ALTIMETER', 'weapon sights'],
        ),
        Product(
          'ABLDR-2A', 
          'assets/ABLDR_2.JPG', 
          const Abldr2(),
          ['LRF and LTDR', 'AIRBORNE LASER DESIGNATOR & RANGER'],
        ),
        Product(
          'AR-3', 
          'assets/AR_3.JPG', 
          const Ar3(),
          ['LRF and LTDR', 'compact', 'LASER RANGE FINDER', 'Handheld'],
        ),
        Product(
          'LASER POINTER', 
          'assets/AR_3.JPG', 
          const Laserpointer(),
          ['LRF and LTDR', 'Target illumination', 'Day / Night Vision'],
        ),
        Product(
          'LDR-4', 
          'assets/AR_3.JPG', 
          const Ldr4n(),
          ['LRF and LTDR', 'compact', 'LASER DESIGNATOR'],
        ),
        // Add more products here
      ];
}

class Product {
  final String title;
  final String imagePath;
  final Widget page;
  final List<String> keywords;

  Product(this.title, this.imagePath, this.page, this.keywords);
}
