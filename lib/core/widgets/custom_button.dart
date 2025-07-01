import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({required this.title, required this.onPressed, super.key});
  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(title),
      ),
    );
  }
}
