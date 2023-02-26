import 'package:app11_bitcoin_ticker/views/large_screen_body.dart';
import 'package:app11_bitcoin_ticker/views/mobile_body.dart';
import 'package:app11_bitcoin_ticker/views/responsive_layout.dart';
import 'package:app11_bitcoin_ticker/views/tablet_body.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileBody: MobileBody(),
      tabletBody: const TabletBody(),
      largeScreenBody: const LargeScreenBody(),
    );
  }
}
