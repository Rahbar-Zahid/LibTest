import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart'; // Import for kIsWeb
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_1/widgets/chatbot_widget.dart';
// import 'chatbot.dart';
import 'firebase_options.dart';
import 'bars/appbar.dart';
import 'bars/bottom_nav.dart';
import 'drawer/drawer.dart';
import 'tabs/tabs_config.dart';
import 'package:responsive_framework/responsive_framework.dart'; // Import for Responsive Framework

void main() async {
  // Ensure that plugin services are initialized before calling `initializeApp`.
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, widget) => ResponsiveWrapper.builder(
        BouncingScrollWrapper.builder(context, widget!),
      ),
      debugShowCheckedModeBanner: false,
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> with TickerProviderStateMixin {
  late TabController _tabController;
  late AnimationController _animationController;
  late Animation<Offset> _offsetAnimation;
  bool _isChatbotVisible = false;


  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);

    // Initialize animation controller for chatbot
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _offsetAnimation = Tween<Offset>(
      begin: const Offset(1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _toggleChatbot() {
    setState(() {
      _isChatbotVisible = !_isChatbotVisible;
      if (_isChatbotVisible) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FixedAppBar(
        isSearching: false,
        onSearchChanged: (query) {},
        onSearchClear: () {},
        searchQuery: '',
        tabController: _tabController,
      ),
      drawer: !kIsWeb
          ? FixedDrawer(
        onItemSelected: (context, itemTitle) {
          // The navigation is handled by FixedDrawer itself.
        },
      )
          : null, // Do not display the drawer on the web
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          TabBarView(
            controller: _tabController,
            children: tabContents,
          ),
          // Chatbot Widget with Slide Transition
          SlideTransition(
            position: _offsetAnimation,
            child: Align(
              alignment: Alignment.centerRight,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.75,
                color: Colors.white,
                child:  ChatbotWidget(), // Replace with your chatbot widget
              ),
            ),
          ),
          // Chatbot Toggle Button
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: _toggleChatbot,
              child: Container(
                width: 30,
                height: 60,
                color: const Color.fromARGB(255, 115, 239, 80),
                child: const Icon(
                  Icons.chat,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: !kIsWeb
          ? const FixedBottomNavigationBar(
        canPop: false, // Home page does not have a back button
      )
          : null, // Don't display bottom navigation bar on the web
    );
  }
}
