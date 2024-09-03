// import 'package:flutter/material.dart';
//
// abstract class ContactFormBase extends StatelessWidget {
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
//   const ContactFormBase({
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
//   Widget build(BuildContext context);
//
//   List<Widget> _buildTextFields() {
//     return [
//       _buildTextField(
//         controller: nameController,
//         label: 'Name',
//         validator: (value) {
//           if (value == null || value.isEmpty) {
//             return 'Please enter your name';
//           }
//           return null;
//         },
//       ),
//       _buildTextField(
//         controller: emailController,
//         label: 'Email',
//         validator: (value) {
//           if (value == null || value.isEmpty || !RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
//             return 'Please enter a valid email address';
//           }
//           return null;
//         },
//       ),
//       _buildTextField(
//         controller: phoneController,
//         label: 'Phone',
//         keyboardType: TextInputType.phone,
//         validator: (value) {
//           if (value == null || value.isEmpty) {
//             return 'Please enter your phone number';
//           }
//           return null;
//         },
//       ),
//       _buildTextField(
//         controller: organizationController,
//         label: 'Organization',
//       ),
//       _buildTextField(
//         controller: quotationController,
//         label: 'Quotation',
//         maxLines: 3,
//       ),
//     ];
//   }
//
//   Widget _buildTextField({
//     required TextEditingController controller,
//     required String label,
//     int? maxLines,
//     TextInputType? keyboardType,
//     FormFieldValidator<String>? validator,
//   }) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 16.0),
//       padding: const EdgeInsets.symmetric(horizontal: 12.0),
//       decoration: BoxDecoration(
//         color: const Color(0xFFFDFDF8),
//         borderRadius: BorderRadius.circular(8.0),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.2),
//             spreadRadius: 1,
//             blurRadius: 2,
//             offset: const Offset(0, 1),
//           ),
//         ],
//       ),
//       child: TextFormField(
//         controller: controller,
//         decoration: InputDecoration(
//           labelText: label,
//           border: InputBorder.none,
//         ),
//         maxLines: maxLines,
//         keyboardType: keyboardType,
//         validator: validator,
//       ),
//     );
//   }
// }
