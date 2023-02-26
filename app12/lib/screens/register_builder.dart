import 'package:app12/screens/mobile/mobile_registration.dart';
import 'package:app12/screens/responsive_layout_builder.dart';
import 'package:flutter/material.dart';

class RegisterBuilder extends StatelessWidget {
  static String route = '/register';
  const RegisterBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayoutBuilder(
      mobileBody: MobileRegistration(),
      tabletBody: MobileRegistration(),
      largeScreenBody: MobileRegistration(),
    );
  }
}
