import 'package:flutter/material.dart';

const double _iconSize = 26;
const Color _iconColor = Colors.white;
const double _elevation = 0;
const _constrains = BoxConstraints.tightFor(
  width: 56,
  height: 56,
);

class RoundIconBtn extends StatelessWidget {
  const RoundIconBtn({
    Key? key,
    required this.onPressed,
    required this.fillColor,
    required this.iconData,
  }) : super(key: key);

  final VoidCallback onPressed;
  final IconData iconData;
  final Color fillColor;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      shape: const CircleBorder(),
      fillColor: fillColor,
      onPressed: onPressed,
      constraints: _constrains,
      elevation: _elevation,
      child: Icon(
        iconData,
        color: _iconColor,
        size: _iconSize,
      ),
    );
  }
}
