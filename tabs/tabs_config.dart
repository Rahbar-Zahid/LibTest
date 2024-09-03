import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart'; // Import for kIsWeb
import 'package:flutter_application_1/tabs/career.dart';

import 'home.dart'; // Import Tab1Content
import 'products.dart';

import 'news_events.dart';
import 'customer_support_tab.dart';
import '../drawer/about_us.dart';
import '../drawer/reviews.dart';
import '../drawer/services.dart';
import 'internship_program.dart';


// Define the tabs
const List<Tab> tabs = [
  Tab(text: 'Home'),
  Tab(text: 'Products'),
  if (kIsWeb) Tab(text: 'About Us'),
  if (kIsWeb) Tab(text: 'Services'),
  if (kIsWeb) Tab(text: 'Reviews'),
  Tab(text: 'Career'),
  Tab(text: 'Customer Support'),
  Tab(text: 'News & Events'),
  Tab(text: 'Internship Programs'),
];

// Define the contents for each tab
List<Widget> tabContents = [
  const Tab1Content(), // Use Tab1Content for Tab 1
  const Tab2Content(), // Placeholder for Tab 2
  if (kIsWeb) const AboutUsPage(), // Add About Us page
  if (kIsWeb)  const ServicesPage(), // Add Services page
  if (kIsWeb) const ReviewsPage(), // Add Reviews page
  const CareerPage(), // Placeholder for Career
  const CustomerSupportPage(), // Placeholder for Customer Support
  const NewsEventsPage(), // Placeholder for News & Events
  const InternsScreen(),
];

