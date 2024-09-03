// NOT IN USE
// import 'package:flutter/material.dart';
// import 'package:latlong2/latlong.dart';
// import 'package:url_launcher/url_launcher.dart';
// import '../../widgets/contactUs/address_card_with_map.dart';
// import '../../widgets/contactUs/contact_card.dart';
// import '../../widgets/contactUs/contact_form.dart';
// import '../../widgets/custom_header.dart';
//
// class ContactUsWeb extends StatelessWidget {
//   final GlobalKey<FormState> formKey;
//   final TextEditingController nameController;
//   final TextEditingController emailController;
//   final TextEditingController phoneController;
//   final TextEditingController organizationController;
//   final TextEditingController quotationController;
//   final String purpose;
//   final List<String> purposes;
//   final ValueChanged<String?> onPurposeChanged;
//   final VoidCallback onSubmit;
//
//   const ContactUsWeb({
//     super.key,
//     required this.formKey,
//     required this.nameController,
//     required this.emailController,
//     required this.phoneController,
//     required this.organizationController,
//     required this.quotationController,
//     required this.purpose,
//     required this.purposes,
//     required this.onPurposeChanged,
//     required this.onSubmit,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;
//     double screenHeight = MediaQuery.of(context).size.height;
//    // double padding = screenWidth * 0.05;
//
//     return Scaffold(
//       backgroundColor: const Color(0xBFFFFFF),
//       body: SingleChildScrollView(
//         // child: Padding(
//         //   padding: EdgeInsets.symmetric(horizontal: padding),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//                         CustomHeader(
//                           title: 'Contact Us',
//                           breadcrumb: 'Home / Contact us',
//                           onBreadcrumbTap: () {
//                             Navigator.of(context).popUntil((route) => route.isFirst);
//                           },
//                           titleColor: Colors.black,
//                           breadcrumbColor: Colors.black,
//                           backgroundColor: Colors.transparent,
//                           ),
//               const SizedBox(height: 16),
//               ContactForm(
//                 formKey: formKey,
//                 nameController: nameController,
//                 emailController: emailController,
//                 phoneController: phoneController,
//                 organizationController: organizationController,
//                 quotationController: quotationController,
//                 purpose: purpose,
//                 purposes: purposes,
//                 onPurposeChanged: onPurposeChanged,
//                 onSubmit: onSubmit,
//               ),
//               const SizedBox(height: 16),
//               AddressCardWithMap(
//                 icon: Icons.location_city_outlined,
//                 title: 'Locate us',
//                 address: 'Office # 901-907,\nAlpha Techno Square,\nOld Airport Road,\nRawalpindi.',
//                 visitTitle: 'Visit us',
//                 visitHours: 'Monday - Friday: \n9:00 AM - 6:00 PM\nSaturday: \n10:00 AM - 4:00 PM',
//                 officeLocation: LatLng(33.60739, 73.10056),
//               ),
//               const SizedBox(height: 16),
//               LayoutBuilder(
//                 builder: (context, constraints) {
//                   if (constraints.maxWidth > 1200) {
//                     // Large screen (e.g., desktop)
//                     return Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         Expanded(
//                           child: ContactCard(
//                             icon: Icons.phone_in_talk,
//                             title: 'Phone',
//                             content: '+1 234 567 890',
//                             isHovered: false,
//                             onTap: () => launch('tel:+1234567890'),
//                             onHover: (_) {},
//                           ),
//                         ),
//                         Expanded(
//                           child: ContactCard(
//                             icon: Icons.email_rounded,
//                             title: 'Email',
//                             content: 'sales@leos.pk',
//                             isHovered: false,
//                             onTap: () => launch('mailto:sales@leos.pk'),
//                             onHover: (_) {},
//                           ),
//                         ),
//                         Expanded(
//                           child: ContactCard(
//                             icon: Icons.facebook,
//                             title: 'Facebook',
//                             content: 'facebook.com/leos.pk',
//                             isHovered: false,
//                             onTap: () => launch('https://facebook.com/leos.pk'),
//                             onHover: (_) {},
//                           ),
//                         ),
//                         Expanded(
//                           child: ContactCard(
//                             icon: Icons.fax,
//                             title: 'Fax',
//                             content: '+1 234 567 891',
//                             isHovered: false,
//                             onTap: () => launch('fax:+1234567891'),
//                             onHover: (_) {},
//                           ),
//                         ),
//                       ],
//                     );
//                   } else if (constraints.maxWidth > 800) {
//                     // Medium screen (e.g., tablet)
//                     return Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         Expanded(
//                           child: ContactCard(
//                             icon: Icons.phone_in_talk,
//                             title: 'Phone',
//                             content: '+1 234 567 890',
//                             isHovered: false,
//                             onTap: () => launch('tel:+1234567890'),
//                             onHover: (_) {},
//                           ),
//                         ),
//                         Expanded(
//                           child: ContactCard(
//                             icon: Icons.email_rounded,
//                             title: 'Email',
//                             content: 'sales@leos.pk',
//                             isHovered: false,
//                             onTap: () => launch('mailto:sales@leos.pk'),
//                             onHover: (_) {},
//                           ),
//                         ),
//                         Expanded(
//                           child: ContactCard(
//                             icon: Icons.facebook,
//                             title: 'Facebook',
//                             content: 'facebook.com/leos.pk',
//                             isHovered: false,
//                             onTap: () => launch('https://facebook.com/leos.pk'),
//                             onHover: (_) {},
//                           ),
//                         ),
//                       ],
//                     );
//                   } else {
//                     // Small screen (e.g., mobile)
//                     return Column(
//                       children: [
//                         ContactCard(
//                           icon: Icons.phone_in_talk,
//                           title: 'Phone',
//                           content: '+1 234 567 890',
//                           isHovered: false,
//                           onTap: () => launch('tel:+1234567890'),
//                           onHover: (_) {},
//                         ),
//                         ContactCard(
//                           icon: Icons.email_rounded,
//                           title: 'Email',
//                           content: 'sales@leos.pk',
//                           isHovered: false,
//                           onTap: () => launch('mailto:sales@leos.pk'),
//                           onHover: (_) {},
//                         ),
//                         ContactCard(
//                           icon: Icons.facebook,
//                           title: 'Facebook',
//                           content: 'facebook.com/leos.pk',
//                           isHovered: false,
//                           onTap: () => launch('https://facebook.com/leos.pk'),
//                           onHover: (_) {},
//                         ),
//                         ContactCard(
//                           icon: Icons.fax,
//                           title: 'Fax',
//                           content: '+1 234 567 891',
//                           isHovered: false,
//                           onTap: () => launch('fax:+1234567891'),
//                           onHover: (_) {},
//                         ),
//                       ],
//                     );
//                   }
//                 },
//               ),
//               const SizedBox(height: 16),
//             ],
//           ),
//       ),
//     );
//   }
// }
