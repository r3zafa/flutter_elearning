import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/custom_colors.dart';

class ActionBtn extends StatelessWidget {
  const ActionBtn({
    Key? key,
    required this.actionTitle,
    required this.onPressed,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String actionTitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: secondaryColor,
      child: TextButton(
        onPressed: onPressed,
        child: Container(
          width: double.infinity,
          height: 90,
          alignment: Alignment.center,
          padding: const EdgeInsets.only(
            bottom: 10,
          ),
          child: Text(
            actionTitle,
            style: GoogleFonts.poppins(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
