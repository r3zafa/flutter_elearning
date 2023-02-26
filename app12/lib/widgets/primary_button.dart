import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.title,
    required this.function,
  });

  final String title;
  final VoidCallback function;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260,
      height: 60,
      color: Colors.white,
      child: MaterialButton(
        onPressed: function,
        child: Text(
          title,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w700,
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}
