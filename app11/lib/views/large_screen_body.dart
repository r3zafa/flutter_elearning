import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:sidebarx/sidebarx.dart';
import 'package:sizer/sizer.dart';

class LargeScreenBody extends StatelessWidget {
  const LargeScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BitCOIN TICKER',
          style: GoogleFonts.acme(
            fontSize: 28,
            fontWeight: FontWeight.w700,
            letterSpacing: 2,
          ),
        ),
      ),
      backgroundColor: Colors.blue,
      body: Row(
        children: [
          /*
          SidebarX(
            controller: SidebarXController(selectedIndex: 0, extended: false),
            showToggleButton: true,
            extendedTheme: SidebarXTheme(
              width: 20.w,
            ),
            items: const [
              SidebarXItem(icon: Icons.home, label: 'Home'),
              SidebarXItem(icon: Icons.search, label: 'Search'),
            ],
          ),
           */
          Expanded(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Container(
                      color: Colors.blue.shade400,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    child: ListView.builder(
                      itemCount: 8,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 15.h,
                          margin: const EdgeInsets.only(bottom: 8),
                          color: Colors.blue.shade300,
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.blue.shade600,
            width: 25.w,
          ),
        ],
      ),
    );
  }
}
