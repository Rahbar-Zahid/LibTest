// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../models/user.dart';
// import '../repository/authentication_repository.dart';
// import '../repository/user_repository.dart';
//
//
// class SignupController extends GetxController{
//   static SignupController get instance => Get.find();
//
//   final userRepo = Get.put(UserRepository());
//
//   final email = TextEditingController();
//   final password = TextEditingController();
//   final fullname = TextEditingController();
//   final number = TextEditingController();
//
//   Future<UserCredential> registerUser(String email, String password) async {
//     try {
//       final UserCredential userCredential = await AuthenticationRepository.instance.createUserWithEmailAndPassword(email, password);
//       return userCredential;
//     } catch (e) {
//       print('Error during user registration: $e');
//       rethrow; // Re-throw the caught error
//     }
//   }
//
//
//   void signinWithNumber(String number){
//     AuthenticationRepository.instance.signinWithNumber(number);
//   }
//
//   Future<void> createUser(UserCredential userCredential ,userModel user) async{
//     await userRepo.createUser(userCredential , user);
//     //Get.to(()=> const OtpScreen());
//   }
//
//   void signupWithGoogle(){
//     AuthenticationRepository.instance.googleSignin();
//   }
// }