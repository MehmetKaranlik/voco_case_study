import 'package:flutter/material.dart';

class ProductTextField extends StatelessWidget {
  const ProductTextField({
    required this.validator,
    required this.controller,
    super.key,
    required this.hint,
  });

  final TextEditingController controller;
  final String hint;
  final String? Function(String?) validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      decoration:
          InputDecoration(border: const OutlineInputBorder(), hintText: hint),
    );
  }
}
