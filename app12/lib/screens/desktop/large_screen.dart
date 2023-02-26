import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:sizer/sizer.dart';
import '../../controllers/app_controller.dart';
import '../../controllers/firebase_controller.dart';

class LargeScreen extends StatelessWidget {
  LargeScreen({Key? key}) : super(key: key);
  final AppController appController = Get.put(AppController());
  final FirebaseController firebaseController = Get.put(FirebaseController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade200,
      appBar: AppBar(
        elevation: 5,
        title: const Text('home'),
        backgroundColor: Colors.deepPurple.shade600,
        toolbarHeight: 70,
        titleTextStyle: GoogleFonts.poppins(
          fontSize: 10.sp,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                firebaseController.logout();
              },
              child: const Icon(Icons.power_settings_new),
            ),
          ),
        ],
      ),
      body: Row(
        children: [
          SidebarX(
            controller: SidebarXController(selectedIndex: 0, extended: true),
            showToggleButton: false,
            theme: SidebarXTheme(
              width: 12.w,
              decoration: BoxDecoration(
                color: Colors.deepPurple.shade100,
              ),
              padding: const EdgeInsets.only(
                top: 24,
                bottom: 24,
                left: 4,
                right: 4,
              ),
              textStyle: GoogleFonts.poppins(
                fontSize: 6.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
              selectedTextStyle: GoogleFonts.poppins(
                fontSize: 6.sp,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
              iconTheme: IconThemeData(
                color: Colors.black,
                size: 10.sp,
              ),
              selectedIconTheme: IconThemeData(
                color: Colors.white,
                size: 10.sp,
              ),
              itemPadding: const EdgeInsets.only(top: 16, bottom: 16),
              selectedItemPadding: const EdgeInsets.only(top: 16, bottom: 16),
              selectedItemDecoration: BoxDecoration(
                color: Colors.deepPurple.shade400,
                borderRadius: BorderRadius.circular(10),
              ),
              itemTextPadding: const EdgeInsets.only(left: 8),
              selectedItemTextPadding: const EdgeInsets.only(left: 8),
            ),
            extendedTheme: SidebarXTheme(
              selectedItemPadding: const EdgeInsets.all(16),
              itemPadding: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(16),
              width: 35.w,
            ),
            items: const [
              SidebarXItem(icon: Icons.home, label: 'Home'),
              SidebarXItem(icon: Icons.search, label: 'Search'),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: AspectRatio(
                      aspectRatio: 16 / 9,
                      child: Container(
                        color: Colors.deepPurple.shade400,
                      ),
                    ),
                  ),
                  Container(
                    height: 15.h,
                    margin: const EdgeInsets.only(bottom: 8),
                    color: Colors.deepPurple.shade300,
                  ),
                  Container(
                    height: 15.h,
                    margin: const EdgeInsets.only(bottom: 8),
                    color: Colors.deepPurple.shade300,
                  ),
                  Container(
                    height: 15.h,
                    margin: const EdgeInsets.only(bottom: 8),
                    color: Colors.deepPurple.shade300,
                  ),
                  Container(
                    height: 15.h,
                    margin: const EdgeInsets.only(bottom: 8),
                    color: Colors.deepPurple.shade300,
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: Colors.deepPurple.shade300,
            width: 30.w,
          ),
        ],
      ),
    );
  }
}
