import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const int mobileScreenSize = 600;
const int tabletScreenSize = 1000;

class ResponsiveLayoutBuilder extends StatelessWidget {
  const ResponsiveLayoutBuilder(
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
          SystemChrome.setPreferredOrientations([
            DeviceOrientation.portraitUp,
            DeviceOrientation.portraitDown,
          ]);
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
