import 'package:flutter/material.dart';

class MainMobileScreen extends StatefulWidget {
  const MainMobileScreen({Key? key}) : super(key: key);

  @override
  State<MainMobileScreen> createState() => _MainMobileScreenState();
}

class _MainMobileScreenState extends State<MainMobileScreen> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Mobile'),
    );
  }
}
