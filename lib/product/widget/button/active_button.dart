import 'package:flutter/material.dart';

class ActiveButton extends StatelessWidget {
  const ActiveButton({
    super.key,
    required this.label,
    this.onPressed,
  });
  final VoidCallback? onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(label),
    );
  }
}
