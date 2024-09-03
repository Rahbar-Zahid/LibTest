import 'package:flutter/material.dart';
// Import for kIsWeb
import '../search.dart'; // Import SearchPage
import '../tabs/tabs_config.dart';
import '../product_pages/surveillance.dart';
import '../product_pages/weaponsights.dart';
import '../product_pages/lrf.dart';
import '../product_pages/tankapc.dart';
import '../customer_support/learning.dart';
import '../customer_support/webinars/webinars.dart';
//import '../customer_support/help_articles.dart';
import '../tabs/contact_us.dart';

class WebAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isSearching;
  final Function(String) onSearchChanged;
  final VoidCallback onSearchClear;
  final String searchQuery;
  final TabController tabController;

  const WebAppBar({
    super.key,
    this.isSearching = false,
    required this.onSearchChanged,
    required this.onSearchClear,
    required this.searchQuery,
    required this.tabController,
  });

  void _onMenuSelected(BuildContext context, String value) {
    switch (value) {
      case 'Surveillance Products':
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Surveillance()));
        break;
      case 'Weapon\'s Sights':
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Weaponsights()));
        break;
      case 'Tank/APC\'s Sights':
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Tankapc()));
        break;
      case 'LRF & LTDR':
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Lrf()));
        break;
      case 'E-learning':
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ELearningPage()));
        break;
      case 'Webinars':
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const WebinarsPage()));
        break;
    // case 'Help Articles':
    //   Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HelpArticlesPage()));
    //   break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromARGB(255, 7, 63, 89),
      elevation: 4.0,
      centerTitle: false, // Center title only on mobile
      leading: null, // No drawer icon on web
      title: isSearching
          ? TextField(
        onChanged: onSearchChanged,
        decoration: InputDecoration(
          hintText: 'Search Categories',
          suffixIcon: IconButton(
            icon: const Icon(Icons.clear, color: Colors.white),
            onPressed: onSearchClear,
          ),
        ),
      )
          : Row(
        mainAxisAlignment: MainAxisAlignment.start, // Align start
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).popUntil((route) => route.isFirst);
            },
            child: SizedBox(
              width: 100,
              height: 38,
              child: Image.asset(
                'assets/ak.jpg',
                width: 40,height: 40,
                fit: BoxFit.fill,
              ),
            ),
          ),
          const SizedBox(width: 20), // Add spacing between logo and tabs
          Expanded(
            child: TabBar(
              controller: tabController,
              tabs: tabs.map((tab) {
                if (tab.text == "Products") {
                  return Tab(
                    child: PopupMenuButton<String>(
                      onSelected: (value) => _onMenuSelected(context, value),
                      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                        const PopupMenuItem<String>(
                          value: 'Surveillance Products',
                          child: Text('Surveillance Products', style: TextStyle(color: Colors.white,fontFamily: 'Roboto')),
                        ),
                        const PopupMenuItem<String>(
                          value: 'Weapon\'s Sights',
                          child: Text('Weapon Sights', style: TextStyle(color: Colors.white,fontFamily: 'Roboto')),
                        ),
                        const PopupMenuItem<String>(
                          value: 'Tank/APC\'s Sights',
                          child: Text('Tank/APC\'s Sights', style: TextStyle(color: Colors.white,fontFamily: 'Roboto')),
                        ),
                        const PopupMenuItem<String>(
                          value: 'LRF & LTDR',
                          child: Text('LRF & LTDR', style:
                          TextStyle(color: Colors.white, fontFamily: 'Roboto')),
                        ),
                      ],
                      color:  const Color.fromARGB(219, 7, 63, 89),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(tab.text ?? ''),
                          const Icon(Icons.arrow_drop_down),
                        ],
                      ),
                    ),
                  );
                } else if (tab.text == "Customer Support") {
                  return Tab(
                    child: PopupMenuButton<String>(
                      onSelected: (value) => _onMenuSelected(context, value),
                      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                        const PopupMenuItem<String>(
                          value: 'E-learning',
                          child: Text('E-learning', style: TextStyle(color: Colors.white, fontFamily: 'Roboto')),
                        ),
                        const PopupMenuItem<String>(
                          value: 'Webinars',
                          child: Text('Webinars', style: TextStyle(color: Colors.white, fontFamily: 'Roboto')),
                        ),
                        // const PopupMenuItem<String>(
                        //   value: 'Help Articles',
                        //   child: Text('Help Articles', style: TextStyle(fontFamily: 'Roboto')),
                        // ),
                      ],
                      color: const Color.fromARGB(219, 7, 63, 89),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(tab.text ?? ''),
                          const Icon(Icons.arrow_drop_down),
                        ],
                      ),
                    ),
                  );
                } else {
                  return tab;
                }
              }).toList(),
              indicator: const BoxDecoration(
                color: Color.fromARGB(26, 170, 170, 170),
                borderRadius: BorderRadius.zero,
              ),
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorPadding: const EdgeInsets.symmetric(horizontal: 4), // Adjust horizontal padding
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white,
              isScrollable: true,
              indicatorColor: Colors.white, // Match indicator color to AppBar
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const ContactUsPage(),
              ),
            );
          },
          child: const Text(
            'Contact Us',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.normal,
              fontSize: 16,
            ),
          ),
        ),
        IconButton(
          icon: Icon(
            isSearching ? Icons.close : Icons.search,
            color: Colors.white,
          ),
          onPressed: () {
            if (isSearching) {
              onSearchClear();
            } else {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => SearchPage(
                    initialQuery: searchQuery,
                  ),
                ),
              );
            }
          },
        ),
      ],
      bottom: null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(49); // Height for web
}
