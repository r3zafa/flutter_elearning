import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../theme/custom_colors.dart';
import '../values/text_styles.dart';

final HexColor _iconColor = mutedTextColor;
const double _iconSize = 60;
const double _iconBottomSpacer = 12;

class IconWithText extends StatelessWidget {
  const IconWithText({
    Key? key,
    required this.icon,
    required this.title,
    required this.isActive,
  }) : super(key: key);

  final IconData icon;
  final String title;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: _iconSize,
          color: isActive ? Colors.white : _iconColor,
        ),
        const SizedBox(
          height: _iconBottomSpacer,
        ),
        Text(
          title.toUpperCase(),
          style: labelTextStyle(isActive: isActive),
        ),
      ],
    );
  }
}
