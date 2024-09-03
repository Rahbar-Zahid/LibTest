import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ContactForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final TextEditingController organizationController;
  final TextEditingController quotationController;
  final String purpose;
  final List<String> purposes;
  final ValueChanged<String?> onPurposeChanged;
  final VoidCallback onSubmit;

  const ContactForm({
    super.key,
    required this.formKey,
    required this.nameController,
    required this.emailController,
    required this.phoneController,
    required this.organizationController,
    required this.quotationController,
    required this.purpose,
    required this.purposes,
    required this.onPurposeChanged,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: const Color(0xB5FFFFFF),
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildDropdownField(),
            const SizedBox(height: 24), // Increased padding between fields
            _buildTextField(
              controller: nameController,
              label: 'Name',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
            ),
            const SizedBox(height: 24), // Increased padding between fields
            _buildTextField(
              controller: emailController,
              label: 'Email',
              hintText: 'e.g., name@example.com',
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.isEmpty || !RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                  return 'Please enter a valid email address';
                }
                return null;
              },
            ),
            const SizedBox(height: 24), // Increased padding between fields
            _buildTextField(
              controller: phoneController,
              label: 'Phone',
              hintText: 'e.g., +1234567890',
              keyboardType: TextInputType.phone,
              maxLength: 11, // Set a maximum length for the phone number
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your phone number';
                }
                if (!RegExp(r'^\+?\d{1,11}$').hasMatch(value)) {
                  return 'Please enter a valid phone number';
                }
                return null;
              },
            ),
            const SizedBox(height: 24), // Increased padding between fields
            _buildTextField(
              controller: organizationController,
              label: 'Organization',
            ),
            const SizedBox(height: 24), // Increased padding between fields
            _buildTextField(
              controller: quotationController,
              label: 'Quotation',
              maxLines: 3,
              validator: (value) {
                if (value != null && _countWords(value) > 250) {
                  return 'Quotation cannot exceed 250 words';
                }
                return null;
              },
            ),
            const SizedBox(height: 8), // Slight padding before hint text
            const Text(
              'Word limit: 250 words',
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
            const SizedBox(height: 24), // Increased padding before the button
            ElevatedButton(
              onPressed: onSubmit,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF28619A),
                foregroundColor: const Color(0xFFFFFFFF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                elevation: 0, // Remove button shadow
              ),
              child: const Text(
                'Submit',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdownField() {
    return SizedBox(
      width: 150, // Make the dropdown button smaller
      child: DropdownButtonFormField<String>(
        dropdownColor: const Color(0xEF829EAF),
        value: purpose,
        items: purposes.map((String purpose) {
          return DropdownMenuItem<String>(
            value: purpose,
            child: Text(purpose, style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14)),
          );
        }).toList(),
        onChanged: onPurposeChanged,
        decoration: InputDecoration(
          labelText: 'Purpose',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0), // Adjust padding
        ),
        style: const TextStyle(color: Colors.black, fontSize: 14),
        isExpanded: true,
        icon: const Icon(Icons.arrow_drop_down),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    String? hintText,
    int? maxLines,
    TextInputType? keyboardType,
    int? maxLength,
    List<TextInputFormatter>? inputFormatters,
    FormFieldValidator<String>? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            labelText: label,
            hintText: hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
          ),
          maxLines: maxLines,
          keyboardType: keyboardType,
          maxLength: maxLength,
          inputFormatters: inputFormatters,
          validator: validator,
        ),
      ],
    );
  }

  int _countWords(String text) {
    return text.split(RegExp(r'\s+')).length;
  }
}
