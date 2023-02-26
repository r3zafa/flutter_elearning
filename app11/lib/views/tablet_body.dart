import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:sidebarx/sidebarx.dart';
import 'package:sizer/sizer.dart';

class TabletBody extends StatelessWidget {
  const TabletBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BitCOIN TICKER',
          style: GoogleFonts.acme(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            letterSpacing: 2,
          ),
        ),
        backgroundColor: Colors.deepPurple.shade400,
      ),
      backgroundColor: Colors.deepPurple.shade200,
      body: Row(children: [
        /*
        SidebarX(
          controller: SidebarXController(selectedIndex: 0, extended: false),
          extendedTheme: SidebarXTheme(
            width: 30.w,
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
                    color: Colors.deepPurple.shade400,
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
                        color: Colors.deepPurple.shade300,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
