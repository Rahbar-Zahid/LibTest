// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// // import '../../constants/colors.dart';
// import '../controllers/signup_controller.dart';
// import '../models/user.dart';
//
// import 'login_screen.dart';
//
// class SignUpScreen extends StatelessWidget {
//   const SignUpScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
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
//                   children: const [
//                     SignUpHeaderWidget(),
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
// class SignUpHeaderWidget extends StatelessWidget {
//   const SignUpHeaderWidget({Key? key}) : super(key: key);
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
//         SignUpFormWidget(),
//       ],
//     );
//   }
// }
//
// class SignUpFormWidget extends StatelessWidget {
//   const SignUpFormWidget({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(SignupController());
//     final _formKey = GlobalKey<FormState>();
//     return Form(
//       key: _formKey,
//       child: Container(
//         padding: const EdgeInsets.symmetric(vertical: 20.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             TextFormField(
//               controller: controller.fullname,
//               decoration: const InputDecoration(
//                 label: Text('Full Name'),
//                 prefixIcon: Icon(Icons.person_outline_rounded),
//               ),
//             ),
//             const SizedBox(height: 15.0),
//             TextFormField(
//               controller: controller.email,
//               decoration: const InputDecoration(
//                 label: Text('Email'),
//                 prefixIcon: Icon(Icons.email_outlined),
//               ),
//             ),
//             const SizedBox(height: 15.0),
//             TextFormField(
//               controller: controller.number,
//               decoration: const InputDecoration(
//                 label: Text('Phone Number'),
//                 prefixIcon: Icon(Icons.numbers),
//               ),
//             ),
//             const SizedBox(height: 15.0),
//             TextFormField(
//               controller: controller.password,
//               decoration: const InputDecoration(
//                 label: Text('Password'),
//                 prefixIcon: Icon(Icons.key),
//               ),
//             ),
//             const SizedBox(height: 20.0),
//             SizedBox(
//               width: double.infinity,
//               child: ElevatedButton(
//                 onPressed: () async {
//                   if (_formKey.currentState!.validate()) {
//                     final userCredential = await SignupController.instance.registerUser(
//                       controller.email.text.trim(),
//                       controller.password.text.trim(),
//                     );
//                     final user = userModel(
//                       fullName: controller.fullname.text.trim(),
//                       email: controller.email.text.trim(),
//                       password: controller.password.text.trim(),
//                       phoneNo: controller.number.text.trim(),
//                       lastSignIn: DateTime.now(),
//                     );
//
//                     SignupController.instance.createUser(userCredential, user);
//                   }
//                 },
//                 child: Text('Sign Up'.toUpperCase()),
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
//             const SizedBox(height: 10.0),
//             Align(
//               alignment: Alignment.center,
//               child: TextButton(
//                 onPressed: () => Get.to(() => const LoginScreen()),
//                 child: Text.rich(
//                   TextSpan(
//                     children: [
//                       TextSpan(
//                         text: 'Already have an account? ',
//                         style: TextStyle(color: Colors.black),
//                       ),
//                       TextSpan(
//                         text: 'LogIn',
//                         style: TextStyle(color: Colors.blue),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }