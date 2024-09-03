// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/src/authentication/repository/user_repository.dart';
// import 'package:flutter_application_1/tabs/home.dart';
// import 'package:get/get.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import '../exceptions/signup_email_password_failure.dart';
// import '../screens/Login_screen.dart';
// import '../screens/login_screen.dart';
//
// class AuthenticationRepository extends GetxController {
//   static AuthenticationRepository get instance => Get.find();
//
//   final _auth = FirebaseAuth.instance;
//   late final Rx<User?> firebaseUser;
//   var verificationId = "".obs;
//
//   @override
//   void onReady() {
//     firebaseUser = Rx<User?>(_auth.currentUser);
//     firebaseUser.bindStream(_auth.userChanges());
//     ever(firebaseUser, _setInitialScreen);
//   }
//
//   _setInitialScreen(User? user) async {
//     if (user == null) {
//       Get.offAll(() => const LoginScreen());
//     } else {
//       final userRepo = Get.put(UserRepository());
//       String uid = user.uid;
//
//       bool isAdmin = await userRepo.isAdmin(uid);
//       bool isUser = await userRepo.isUser(uid);
//
//       // if (isAdmin) {
//       //   Get.offAll(() => const AdminDashboard());
//       // } else if (isUser) {
//       //   Get.offAll(() =>  const UserDashboard());
//       // } else {
//       //   // Handle any other roles or cases
//       //   Get.snackbar(
//       //     "Role Error",
//       //     "No appropriate role found for this user.",
//       //     snackPosition: SnackPosition.BOTTOM,
//       //     backgroundColor: Colors.redAccent.withOpacity(0.1),
//       //     colorText: Colors.red,
//       //   );
//       // }
//     }
//   }
//
//
//   Future<UserCredential> createUserWithEmailAndPassword(String email,
//       String password) async {
//     try {
//       // Create the user with email and password
//       UserCredential userCredential =
//       await _auth.createUserWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//
//       // Optionally, navigate to different screens based on the user's status
//       if (firebaseUser.value != null) {
//         Get.offAll(() => const Tab1Content());
//       } else {
//         Get.offAll(() => const LoginScreen());
//       }
//
//       // Return the UserCredential object
//       return userCredential;
//     } on FirebaseAuthException catch (e) {
//       // Handle Firebase Auth exceptions
//       final error = SignupEmailPasswordFailure(e.code);
//       print('FIREBASE AUTH EXCEPTION - ${error.message}');
//       throw error;
//     } catch (_) {
//       // Handle other exceptions
//       const error = SignupEmailPasswordFailure();
//       print('EXCEPTION - ${error.message}');
//       throw error;
//     }
//   }
//
//   Future<void> loginWithEmailAndPassword(String email, String password) async {
//     try {
//       UserCredential userCredential = await _auth.signInWithEmailAndPassword(
//           email: email, password: password);
//       await updateLastSignin();
//
//       Get.snackbar(
//         'Login Successful',
//         '',
//         snackPosition: SnackPosition.BOTTOM,
//         backgroundColor: Colors.black54,
//         colorText: Colors.white,
//         borderRadius: 8,
//         margin: EdgeInsets.all(8),
//         snackStyle: SnackStyle.GROUNDED,
//       );
//     } on FirebaseAuthException catch (e) {
//       final error = SignupEmailPasswordFailure(e.code);
//       print('FIREBASE AUTH EXCEPTION - ${error.message}');
//       throw error;
//     } catch (_) {
//       const error = SignupEmailPasswordFailure();
//       print('EXCEPTION - ${error.message}');
//       throw error;
//     }
//   }
//
//
//
//   Future<void> logout() async {
//     _auth.signOut();
//     await GoogleSignIn().signOut();
//   }
//
//   Future<void> signinWithNumber(String phoneNo) async {
//     await _auth.verifyPhoneNumber(
//         phoneNumber: phoneNo,
//         verificationCompleted: (credential) async {
//           await _auth.signInWithCredential(credential);
//         },
//         verificationFailed: (e) {
//           if (e.code == 'invalid-phone-number') {
//             Get.snackbar('Error', 'The Provided Phone number is not valid');
//           } else {
//             Get.snackbar('Error', 'Something went wrong try again');
//           }
//         },
//         codeSent: (verificationId, resendToken) {
//           this.verificationId.value = verificationId;
//         },
//         codeAutoRetrievalTimeout: (verificationId) {
//           this.verificationId.value = verificationId;
//         });
//   }
//
//   Future<bool> VerifyOTP(String otp) async {
//     var credentials = await _auth.signInWithCredential(
//         PhoneAuthProvider.credential(
//             verificationId: this.verificationId.value, smsCode: otp));
//     return credentials.user != null ? true : false;
//   }
//
//   Future<UserCredential> googleSignin() async {
//     final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
//
//     if (googleUser != null) {
//       final GoogleSignInAuthentication? googleAuth =
//       await googleUser.authentication;
//       final credential = GoogleAuthProvider.credential(
//         accessToken: googleAuth?.accessToken,
//         idToken: googleAuth?.idToken,
//       );
//
//       try {
//         final userCredential =
//         await FirebaseAuth.instance.signInWithCredential(credential);
//         await updateLastSignin(); // Call updateLastSignin() here
//         return userCredential;
//       } catch (e) {
//         print('Error signing in with Google: $e');
//         throw e;
//       }
//     } else {
//       throw Exception('Google sign-in aborted');
//     }
//   }
//
//   Future<void> updateLastSignin() async {
//     try {
//       var user = _auth.currentUser;
//       if (user != null) {
//         var userDocRef =
//         FirebaseFirestore.instance.collection('users').doc(user.uid);
//         await userDocRef.update({'lastSignIn': FieldValue.serverTimestamp()});
//         print("Last sign-in time updated successfully");
//       }
//     } catch (error) {
//       print("Error updating last sign-in time: $error");
//     }
//   }
// }
