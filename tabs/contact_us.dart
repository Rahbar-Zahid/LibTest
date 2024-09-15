import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/back.dart';

import '../layouts/contact_Us/contact_us_layout.dart';
// import '../layouts/contact_us/contact_us_mobile.dart';
// import '../layouts/contact_us/contact_us_web.dart';

class ContactUsPage extends StatefulWidget {
  const ContactUsPage({super.key});

  @override
  ContactUsPageState createState() => ContactUsPageState();
}

class ContactUsPageState extends State<ContactUsPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _purpose = 'General Inquiry';
  final List<String> _purposes = ['General Inquiry', 'Feedback', 'Quotation', 'Support'];
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _organizationController = TextEditingController();
  final TextEditingController _quotationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Widget contactForm;
      contactForm = ContactUsLayout(
        formKey: _formKey,
        nameController: _nameController,
        emailController: _emailController,
        phoneController: _phoneController,
        organizationController: _organizationController,
        quotationController: _quotationController,
        purpose: _purpose,
        purposes: _purposes,
        onPurposeChanged: (newValue) {
          setState(() {
            _purpose = newValue!;
          });
        },
        onSubmit: () {
          if (_formKey.currentState!.validate()) {
            // Handle form submission
          }
        },
      );


    return Scaffold(
      backgroundColor: kIsWeb
          ? const Color.fromARGB(255, 8, 65, 92)
          : const Color.fromARGB(255, 47, 97, 154),
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/contactsection/backg.png', // Replace with your image path
              fit: BoxFit.cover,
            ),
          ),
          // The Contact Form and other widgets
          Padding(
            padding: const EdgeInsets.all(17.0),
            child: contactForm,
          ),
          // Back Button
          const Positioned(
            top: 16.0,
            left: 16.0,
            child: BackButtonWidget(),
          ),
        ],
      ),
    );
  }
}
