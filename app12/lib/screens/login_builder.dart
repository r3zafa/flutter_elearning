import 'package:app12/screens/mobile/mobile_login.dart';
import 'package:app12/screens/responsive_layout_builder.dart';
import 'package:flutter/material.dart';

class LoginBuilder extends StatelessWidget {
  static String route = '/login';
  const LoginBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayoutBuilder(
      mobileBody: MobileLogin(),
      tabletBody: MobileLogin(),
      largeScreenBody: MobileLogin(),
    );
  }
}
