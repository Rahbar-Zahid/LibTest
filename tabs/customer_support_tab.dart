import 'package:flutter/material.dart';
import 'package:flutter_application_1/customer_support/learning.dart';
import 'package:flutter_application_1/customer_support/webinars/webinars.dart';
//import 'package:flutter_application_1/customer_support/help_articles.dart';

class CustomerSupportPage extends StatelessWidget {
  const CustomerSupportPage({super.key});

  void _onMenuSelected(BuildContext context, String value) {
    switch (value) {
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
    return Center(
      child: DropdownButton<String>(
        hint: const Text('Customer Support'),
        items: const [
          DropdownMenuItem<String>(
            value: 'E-learning',
            child: Text('E-learning'),
          ),
          DropdownMenuItem<String>(
            value: 'Webinars',
            child: Text('Webinars'),
          ),
          // DropdownMenuItem<String>(
          //   value: 'Help Articles',
          //   child: Text('Help Articles'),
          // ),
        ],
        onChanged: (value) => _onMenuSelected(context, value!),
      ),
    );
  }
}
