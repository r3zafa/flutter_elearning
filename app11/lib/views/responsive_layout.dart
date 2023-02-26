import 'package:flutter/material.dart';
import '../constants/constants.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout(
      {super.key,
      required this.mobileBody,
      required this.tabletBody,
      required this.largeScreenBody});

  final Widget mobileBody;
  final Widget tabletBody;
  final Widget largeScreenBody;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < mobileScreenSize) {
          return mobileBody;
        } else if (constraints.maxWidth < tabletScreenSize) {
          return tabletBody;
        } else {
          return largeScreenBody;
        }
      },
    );
  }
}
