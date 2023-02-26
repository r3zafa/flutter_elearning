import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const locationBadgeTextColor = Color(0xff292E69);
final TextStyle tsLocation = GoogleFonts.poppins(
  fontSize: 28,
  fontWeight: FontWeight.w700,
  color: locationBadgeTextColor,
);
final TextStyle tsSubInformation = GoogleFonts.poppins(
  fontSize: 20,
  fontWeight: FontWeight.w500,
  color: locationBadgeTextColor,
);

class IconTextBadge extends StatelessWidget {
  const IconTextBadge({
    Key? key,
    required this.text1,
    this.text2,
    required this.icon,
    required this.isLocationBadge,
  }) : super(key: key);

  final String text1;
  final String? text2;
  final IconData icon;
  final bool isLocationBadge;
  @override
  Widget build(BuildContext context) {
    late String text;
    if (text2 != null) {
      text = '$text1 $text2';
    } else {
      text = text1;
    }
    return Padding(
      padding: isLocationBadge
          ? const EdgeInsets.only(left: 15, right: 0, top: 20, bottom: 0)
          : const EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: locationBadgeTextColor,
            size: isLocationBadge ? 32 : 24,
          ),
          const SizedBox(width: 5),
          Text(
            text,
            style: isLocationBadge ? tsLocation : tsSubInformation,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
