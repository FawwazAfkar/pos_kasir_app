import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final String hintText;
  final bool isPassword;
  final Function(String) onChanged;

  const CustomInputField({
    Key? key,
    required this.hintText,
    this.isPassword = false,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(),
      ),
      obscureText: isPassword,
      onChanged: onChanged,
    );
  }
}