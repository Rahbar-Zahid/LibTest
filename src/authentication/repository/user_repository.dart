// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../models/user.dart';
//
// class UserRepository extends GetxController{
//   static UserRepository get instance => Get.find();
//
//  final _db = FirebaseFirestore.instance;
//
//  Future<String?> getUserRole(String uid) async{
//    try {
//      DocumentSnapshot userDoc = await _db.collection("users").doc(uid).get();
//      if (userDoc.exists){
//        return userDoc['Role'] as String?;
//      }
//    } catch(e){
//      // Handle any unexpected errors
//      Get.snackbar(
//        "Error",
//        "Unexpected error occurred, Try Again",
//        snackPosition: SnackPosition.BOTTOM,
//        backgroundColor: Colors.redAccent.withOpacity(0.1),
//        colorText: Colors.red,
//      );
//      print(e.toString());
//    }
//    return null;
//  }
//
//   Future<bool> isAdmin(String uid) async {
//     String? role = await getUserRole(uid);
//     return role == 'admin';
//   }
//
//   Future<bool> isUser(String uid) async {
//    String? role = await getUserRole(uid);
//    return role == "user";
//   }
//
//   Future<void> createUser(UserCredential userCredential, userModel user) async {
//     try {
//       // Get the UID from the UserCredential
//       String uid = userCredential.user?.uid ?? '';
//
//       // Add the user document to the Firestore collection with the UID as the document ID
//       await _db.collection("users").doc(uid).set(user.toJson())
//           .then((_) {
//         Get.snackbar(
//           "Success",
//           "Your Account has been Created.",
//           snackPosition: SnackPosition.BOTTOM,
//           backgroundColor: Colors.green.withOpacity(0.1),
//           colorText: Colors.green,
//         );
//       })
//           .catchError((error, stackTrace) {
//         Get.snackbar(
//           "Error",
//           "Something went wrong, Try Again",
//           snackPosition: SnackPosition.BOTTOM,
//           backgroundColor: Colors.redAccent.withOpacity(0.1),
//           colorText: Colors.red,
//         );
//         print(error.toString());
//       });
//     } catch (e) {
//       // Handle any unexpected errors
//       Get.snackbar(
//         "Error",
//         "Unexpected error occurred, Try Again",
//         snackPosition: SnackPosition.BOTTOM,
//         backgroundColor: Colors.redAccent.withOpacity(0.1),
//         colorText: Colors.red,
//       );
//       print(e.toString());
//     }
//   }
//
//
//   Future<userModel?> getUserData(String email) async {
//     final snapshot = await _db.collection("users").where("Email", isEqualTo: email).get();
//       final userdata = snapshot.docs.map((e) => userModel.fromSnapshot(e)).single;
//       return userdata;
//   }
//
//  Future<List<userModel>> getAllUser() async{
//     final snapshot = await _db.collection("users").get();
//     final userdata = snapshot.docs.map((e) => userModel.fromSnapshot(e)).toList();
//     return userdata;
//   }
//
// }