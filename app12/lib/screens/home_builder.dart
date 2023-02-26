import 'package:app12/screens/responsive_layout_builder.dart';
import 'package:app12/screens/desktop/large_screen.dart';
import 'package:app12/screens/mobile/mobile_home.dart';
import 'package:app12/screens/tablet/tablet_screen.dart';
import 'package:flutter/material.dart';

class HomeBuilder extends StatelessWidget {
  static String route = '/home';
  const HomeBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayoutBuilder(
      mobileBody: MobileHome(),
      tabletBody: TabletScreen(),
      largeScreenBody: LargeScreen(),
    );
  }
}
