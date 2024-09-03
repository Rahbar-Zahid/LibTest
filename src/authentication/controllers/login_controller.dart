// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../repository/authentication_repository.dart';
//
// class LoginController extends GetxController {
//   // Provides a singleton instance of LoginController
//   static LoginController get instance => Get.find();
//
//   // Controllers for email and password fields
//   final email = TextEditingController();
//   final password = TextEditingController();
//
//   // Observable for toggling password visibility
//   var isPasswordVisible = false.obs;
//
//   void loginUser(String email, String password) {
//     AuthenticationRepository.instance.loginWithEmailAndPassword(email, password);
//   }
//
//   void loginWithGoogle() {
//     AuthenticationRepository.instance.googleSignin();
//   }
//
//   // Method to toggle password visibility
//   void togglePasswordVisibility() {
//     isPasswordVisible.value = !isPasswordVisible.value;
//   }
//
//   // Clean up controllers when the controller is disposed
//   @override
//   void onClose() {
//     email.dispose();
//     password.dispose();
//     super.onClose();
//   }
// }
