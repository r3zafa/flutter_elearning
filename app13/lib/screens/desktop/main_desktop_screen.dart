import 'package:flutter/material.dart';

class MainDesktopScreen extends StatefulWidget {
  const MainDesktopScreen({Key? key}) : super(key: key);

  @override
  State<MainDesktopScreen> createState() => _MainDesktopScreenState();
}

class _MainDesktopScreenState extends State<MainDesktopScreen> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Desktop'),
    );
  }
}
