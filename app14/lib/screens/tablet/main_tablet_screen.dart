import 'package:flutter/material.dart';

class MainTabletScreen extends StatefulWidget {
  const MainTabletScreen({Key? key}) : super(key: key);

  @override
  State<MainTabletScreen> createState() => _MainTabletScreenState();
}

class _MainTabletScreenState extends State<MainTabletScreen> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Tablet'),
    );
  }
}
