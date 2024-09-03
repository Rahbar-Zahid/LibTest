// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class userModel {
//   final String? id;
//   final String fullName;
//   final String email;
//   final String phoneNo;
//   final String password;
//   DateTime lastSignIn;
//   final String role;
//
//   userModel({
//     this.id,
//     this.role = 'user',
//     required this.fullName,
//     required this.email,
//     required this.password,
//     required this.phoneNo,
//     required this.lastSignIn,
//   });
//
//   Map<String, dynamic> toJson() => {
//     "FullName": fullName,
//     "Email": email,
//     "Password": password,
//     "Phone": phoneNo,
//     "lastSignIn": lastSignIn,
//     "Role": role,
//   };
//
//   factory userModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
//     final data = document.data()!;
//     return userModel(
//       id: document.id,
//       email: data["Email"],
//       fullName: data["FullName"],
//       password: data["Password"],
//       phoneNo: data["Phone"],
//       lastSignIn: (data['lastSignIn'] as Timestamp).toDate(),
//       role: data["Role"],
//     );
//   }
// }
