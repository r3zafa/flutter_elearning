import 'package:app11_bitcoin_ticker/controllers/app_controller.dart';
import 'package:app11_bitcoin_ticker/views/cupertino_widgets/ios_picker_button.dart';
import 'package:app11_bitcoin_ticker/views/platform_specific_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:sidebarx/sidebarx.dart';
import 'package:sizer/sizer.dart';

import 'material_widgets/material_picker_button.dart';

class MobileBody extends StatelessWidget {
  MobileBody({Key? key}) : super(key: key);

  final appController = Get.put(AppController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BitCOIN TICKER',
          style: GoogleFonts.acme(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            letterSpacing: 2,
          ),
        ),
        backgroundColor: Colors.green.shade900,
      ),
      backgroundColor: Colors.green.shade800,
      /*
      drawer: SidebarX(
        controller: SidebarXController(selectedIndex: 0, extended: true),
        theme: SidebarXTheme(
          width: 40.w,
        ),
        showToggleButton: false,
        items: const [
          SidebarXItem(icon: Icons.home, label: 'Home'),
          SidebarXItem(icon: Icons.search, label: 'Search'),
        ],
      ),

       */
      body: Column(
        children: [
          /*
          Padding(
            padding: const EdgeInsets.all(8),
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Container(
                color: Colors.deepOrange.shade400,
              ),
            ),
          ),
           */
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 3.w, right: 3.w),
              child: ListView(
                children: [
                  Obx(
                    () => Card(
                      elevation: 15,
                      color: Colors.green.shade100,
                      margin: EdgeInsets.only(bottom: 5.h, top: 5.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Container(
                        padding: EdgeInsets.all(4.w),
                        height: 10.h,
                        alignment: Alignment.center,
                        child: Text(
                          '1 BTC = ${appController.btcChangeRate.toStringAsFixed(2)} ${appController.selectedCurrency}',
                          style: GoogleFonts.poppins(
                            fontSize: 12.5.sp,
                            fontWeight: FontWeight.w800,
                            color: Colors.deepOrange.shade700,
                            wordSpacing: 5,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Obx(
                    () => Card(
                      elevation: 15,
                      color: Colors.green.shade100,
                      margin: EdgeInsets.only(bottom: 5.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Container(
                        padding: EdgeInsets.all(4.w),
                        height: 10.h,
                        alignment: Alignment.center,
                        child: Text(
                          '1 ETH = ${appController.ethChangeRate.toStringAsFixed(2)} ${appController.selectedCurrency}',
                          style: GoogleFonts.poppins(
                            fontSize: 12.5.sp,
                            fontWeight: FontWeight.w800,
                            color: Colors.deepOrange.shade700,
                            wordSpacing: 5,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Obx(
                    () => Card(
                      elevation: 15,
                      color: Colors.green.shade100,
                      margin: EdgeInsets.only(bottom: 5.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Container(
                        padding: EdgeInsets.all(4.w),
                        height: 10.h,
                        alignment: Alignment.center,
                        child: Text(
                          '1 LTC = ${appController.ltcChangeRate.toStringAsFixed(2)} ${appController.selectedCurrency}',
                          style: GoogleFonts.poppins(
                            fontSize: 12.5.sp,
                            fontWeight: FontWeight.w800,
                            color: Colors.deepOrange.shade700,
                            wordSpacing: 5,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            //color: Colors.green.shade100,
            //height: !GetPlatform.isIOS ? 15.h : 22.h,
            width: 100.w,
            padding:
                EdgeInsets.only(left: 10.w, right: 10.w, top: 3.h, bottom: 4.h),
            child: PlatformSpecificUI(
              materialWidget: MaterialPickerButton(),
              cupertinoWidget: IosPickerButton(),
            ),
          ),
        ],
      ),
    );
  }
}
