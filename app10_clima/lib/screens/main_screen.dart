import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/app_controller.dart';
import './home_fragment.dart';
import './search_fragment.dart';
import 'package:get/get.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<Widget> _widgetOptions = [HomeFragment(), SearchFragment()];
  final appController = Get.put(AppController());

  void onItemTapped(int index) {
    setState(() {
      appController.changeNavigationIndex(bottomNavigationIndex: index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        extendBody: true,
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
          ],
          currentIndex: appController.bottomNavigationIndex.value,
          onTap: onItemTapped,
          unselectedItemColor: Colors.grey.shade800,
          selectedItemColor: Colors.black,
          selectedLabelStyle: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
          unselectedLabelStyle: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w300,
          ),
          selectedIconTheme: const IconThemeData(
            opacity: 1.0,
            size: 35.0,
          ),
          unselectedIconTheme: const IconThemeData(
            opacity: 1.0,
            size: 35.0,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Center(
          child: _widgetOptions
              .elementAt(appController.bottomNavigationIndex.value),
        ),
      ),
    );
  }
}
