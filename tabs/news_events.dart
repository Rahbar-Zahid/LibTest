import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../layouts/news_Events/news_events_mobile_layout.dart';
import '../layouts/news_Events/news_events_web_layout.dart';


class NewsEventsPage extends StatefulWidget {
  const NewsEventsPage({super.key});

  @override
  NewsEventsPageState createState() => NewsEventsPageState();
}

class NewsEventsPageState extends State<NewsEventsPage> {
  List<Map<String, String>> blogPosts = [
    {
      'title': 'Interactive Session',
      'description': 'Interactive session held by the GM with the Employees of LEOS',
      'imageUrl': 'assets/images/news_events_media/workshop_1/wa-3.jpg',
      'category': 'Category A',
      'date': '2024-01-01',
    },
    {
      'title': 'FPGA',
      'description': 'Engaging workshop on FPGA for LEOS Employees.',
      'imageUrl': 'assets/images/news_events_media/workshop_1/wa-2.jpg',
      'category': "Workshop",
      'date': '2024-07-05',
    },
    {
      'title': 'Intern Demo',
      'description': 'Interns at LEOS explore their potential to the fullest.',
      'imageUrl': 'assets/images/news_events_media/interns/abd-1.jpg',
      'category': "Workshop",
      'date': '2024-07-08',
    },
    {
      'title': 'Independence Day Celebration at LEOS',
      'description': 'Celebrating the day with full Energy',
      'imageUrl': 'assets/images/news_events_media/independence_Day/indepday.jpg',
      'category': 'Category A',
      'date': '2024-08-14',
    },
    // Additional blog posts here...
  ];

  List<Map<String, String>> displayedPosts = [];
  String sortBy = 'date';

  @override
  void initState() {
    super.initState();
    displayedPosts = List.from(blogPosts);
  }

  void sortPosts() {
    if (sortBy == 'date') {
      displayedPosts.sort((a, b) => DateTime.parse(b['date']!).compareTo(DateTime.parse(a['date']!)));
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: kIsWeb
          ? NewsEventsWebLayout(
        displayedPosts: displayedPosts,
        sortBy: sortBy,
        onSortChanged: (value) {
          setState(() {
            sortBy = value!;
            sortPosts();
          });
        },
      )
          : NewsEventsMobileLayout(
        displayedPosts: displayedPosts,
        sortBy: sortBy,
        onSortChanged: (value) {
          setState(() {
            sortBy = value!;
            sortPosts();
          });
        },
      ),
    );
  }
}