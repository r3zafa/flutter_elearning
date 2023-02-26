import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
    required this.title,
    super.key,
    required this.route,
  });

  final String route;
  final String title;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        //Navigator.of(context).pop();
        Navigator.pushNamed(context, route);
      },
      child: Text(
        title,
        style: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          letterSpacing: 1.5,
          color: Colors.grey.shade50,
        ),
      ),
    );
  }
}
