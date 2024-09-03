// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../controllers/login_controller.dart';
// //import 'Forget Password/reset_via_email.dart';
// //import 'Forget Password/reset_via_phone.dart';
//
// class LoginScreen extends StatelessWidget {
//   const LoginScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(LoginController());
//     return SafeArea(
//       child: Scaffold(
//         body: Container(
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               begin: Alignment.topCenter,
//               end: Alignment.bottomCenter,
//               colors: [
//                 Color(0xFF000428), // dark blue
//                 Color(0xFF004e92), // light blue
//               ],
//             ),
//           ),
//           child: Center(
//             child: SingleChildScrollView(
//               child: Container(
//                 margin: EdgeInsets.all(16.0),
//                 padding: EdgeInsets.all(16.0),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(10.0),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black12,
//                       blurRadius: 10.0,
//                       spreadRadius: 5.0,
//                     ),
//                   ],
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children:  [
//                     LoginHeaderWidget(),
//                     // Positioned was replaced with a simple Container to avoid errors
//                     Align(
//                       alignment: Alignment.bottomRight,
//                       child: Container(
//                         padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
//                         decoration: BoxDecoration(
//                           color: Colors.green.withOpacity(0.6),
//                           borderRadius: BorderRadius.circular(8.0),
//                         ),
//                         child: Text(
//                           'Login Screen',
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 12.0,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class LoginHeaderWidget extends StatelessWidget {
//   const LoginHeaderWidget({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         Text(
//           'Leos Attendance Portal',
//           style: TextStyle(
//             fontSize: 24,
//             fontWeight: FontWeight.bold,
//             color: Colors.black,
//           ),
//         ),
//         SizedBox(height: 20),
//         LoginForm(),
//       ],
//     );
//   }
// }
//
// class LoginForm extends StatelessWidget {
//   const LoginForm({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.find<LoginController>(); // Only instantiate once
//     final _formKey = GlobalKey<FormState>();
//
//     return Form(
//       key: _formKey,
//       child: Container(
//         padding: EdgeInsets.symmetric(vertical: 20.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             TextFormField(
//               controller: controller.email,
//               decoration: InputDecoration(
//                 prefixIcon: Icon(Icons.person_outline_outlined),
//                 labelText: 'Email',
//                 hintText: 'Enter Your Email',
//               ),
//               validator: (value) {
//                 if (value == null || value.isEmpty) {
//                   return 'Please enter your email';
//                 }
//                 if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
//                   return 'Please enter a valid email address';
//                 }
//                 return null;
//               },
//             ),
//             const SizedBox(height: 15.0),
//             Obx(
//               () { return TextFormField(
//                 controller: controller.password,
//                 decoration: InputDecoration(
//                   prefixIcon: Icon(Icons.key),
//                   labelText: 'Password',
//                   hintText: 'Enter Your Password',
//                   suffixIcon: IconButton(
//                     onPressed: () {
//                       // Toggle password visibility
//                       controller.togglePasswordVisibility();
//                     },
//                     icon: Icon(controller.isPasswordVisible.value
//                         ? Icons.visibility
//                         : Icons.visibility_off),
//                   ),
//                 ),
//                 obscureText: !controller.isPasswordVisible.value,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your password';
//                   }
//                   if (value.length < 6) {
//                     return 'Password must be at least 6 characters long';
//                   }
//                   return null;
//                 },
//               );
//               }),
//
//             const SizedBox(height: 6.0),
//             Align(
//               alignment: Alignment.bottomRight,
//               child: TextButton(
//                 onPressed: () {
//                   buildShowModalBottomSheet(context);
//                 },
//                 child: Text(
//                   'Forgot Password?',
//                   style: TextStyle(color: Colors.blue),
//                 ),
//               ),
//             ),
//             SizedBox(
//               width: double.infinity,
//               child: ElevatedButton(
//                 onPressed: () {
//                   if (_formKey.currentState!.validate()) {
//                     LoginController.instance.loginUser(
//                       controller.email.text.trim(),
//                       controller.password.text.trim(),
//                     );
//                   }
//                 },
//                 child: Text('Login'.toUpperCase()),
//                 style: ElevatedButton.styleFrom(
//                   padding: EdgeInsets.symmetric(vertical: 12.0),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(8.0),
//                   ),
//                   foregroundColor: Colors.red,
//                   backgroundColor: Colors.red,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Future<dynamic> buildShowModalBottomSheet(BuildContext context) {
//     return showModalBottomSheet(
//       context: context,
//       builder: (context) => Container(
//         width: double.infinity,
//         height: 400,
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Select Method',
//               style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
//             ),
//             Text(
//               'Select one option to reset your password',
//               style: TextStyle(fontSize: 16),
//             ),
//             const SizedBox(height: 30),
//             // ForgetPassButton(
//             //   bIcon: Icons.email_outlined,
//             //   title: 'E-Mail',
//             //   subtitle: 'Reset password via Email',
//             //   // onTap: () {
//             //   //   Navigator.pop(context);
//             //   //   Get.to(() => const ResetViaEmail());
//             //   // },
//             // ),
//             // SizedBox(height: 20.0),
//             // ForgetPassButton(
//             //   bIcon: Icons.phone,
//             //   title: 'Phone',
//             //   subtitle: 'Reset via phone number',
//             //   // onTap: () {
//             //   //   Navigator.pop(context);
//             //   //   Get.to(() => const ResetViaPhone());
//             //   // },
//             // ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class ForgetPassButton extends StatelessWidget {
//   const ForgetPassButton({
//     super.key,
//     required this.bIcon,
//     required this.title,
//     required this.subtitle,
//     required this.onTap,
//   });
//
//   final IconData bIcon;
//   final String title, subtitle;
//   final VoidCallback onTap;
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(20.0),
//           color: Colors.grey.shade200,
//         ),
//         padding: EdgeInsets.all(20.0),
//         child: Row(
//           children: [
//             Icon(bIcon, size: 60.0),
//             SizedBox(width: 10),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   title,
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                 ),
//                 Text(
//                   subtitle,
//                   style: TextStyle(fontSize: 12),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
