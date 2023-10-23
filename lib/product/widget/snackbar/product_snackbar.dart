import 'package:flutter/material.dart';

class ProductSnackbar extends SnackBar {
  const ProductSnackbar({super.key, required super.content});

  ProductSnackbar.error(
      {super.key, required String error, required VoidCallback onVisible})
      : super(
            content: Text(error),
            backgroundColor: Colors.red,
            onVisible: onVisible);
}
