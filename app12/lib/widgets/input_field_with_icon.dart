import 'package:flutter/material.dart';

class InputFieldWithIcon extends StatelessWidget {
  const InputFieldWithIcon({
    super.key,
    required this.controller,
    required this.borderRadius,
    required this.hintText,
    required this.icon,
    required this.iconSize,
    this.iconColor = Colors.white,
    this.hideText = false,
  });

  final TextEditingController controller;
  final IconData icon;
  final double iconSize;
  final Color iconColor;
  final String hintText;
  final double borderRadius;
  final bool hideText;
  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: !hideText ? TextInputType.emailAddress : TextInputType.text,
      obscureText: hideText,
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white24,
        icon: Icon(
          icon,
          size: iconSize,
          color: iconColor,
        ),
        hintText: hintText,
        border: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }
}
