import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../constants/constants.dart';
import '../../controllers/app_controller.dart';
import '../../services/api_response.dart';

class IosPickerButton extends StatelessWidget {
  IosPickerButton({Key? key}) : super(key: key);

  final appController = Get.put(AppController());

  void _showDialog(
      {required Widget childWidget, required BuildContext context}) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: 25.h,
        width: 100.w,
        padding:
            const EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        color: Colors.deepOrange.shade400,
        child: SafeArea(
          top: false,
          child: childWidget,
        ),
      ),
    );
  }

  List<Widget> _makeDropDownItems(List<String> stringList) {
    List<Widget> temp = [];
    for (String item in stringList) {
      var menuItem = Center(
        child: Text(item),
      );
      temp.add(menuItem);
    }
    return temp;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 5.h,
          width: 100.w,
          margin: EdgeInsets.only(bottom: 1.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Selected',
                style:
                    GoogleFonts.poppins(color: Colors.white, fontSize: 16.sp),
              ),
              Container(
                margin: EdgeInsets.only(left: 30.w),
                color: Colors.black26,
                width: 20.w,
                height: 4.h,
                alignment: Alignment.center,
                child: Obx(
                  () => Text(
                    appController.selectedCurrency.toUpperCase(),
                    style: GoogleFonts.poppins(
                      fontSize: 14.sp,
                      letterSpacing: 2,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        CupertinoButton(
          color: Colors.deepOrange.shade800,
          padding: EdgeInsets.zero,
          child: Container(
            width: 100.w,
            height: 8.h,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.deepOrange.shade800,
              borderRadius: BorderRadius.circular(5),
              boxShadow: const <BoxShadow>[
                BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.57), //shadow for button
                    blurRadius: 5) //blur radius of shadow
              ],
            ),
            child: Text(
              'select currency'.toUpperCase(),
              style: GoogleFonts.poppins(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                letterSpacing: 1,
                color: Colors.white,
              ),
            ),
          ),
          onPressed: () => _showDialog(
            context: context,
            childWidget: CupertinoPicker(
              itemExtent: 4.h,
              looping: false,
              magnification: 1.3,
              squeeze: 0.7,
              selectionOverlay: GlassmorphicContainer(
                width: 100.w,
                height: 3.h,
                borderRadius: 10,
                blur: 0.2,
                alignment: Alignment.bottomCenter,
                border: 0,
                linearGradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      const Color(0xFFffffff).withOpacity(0.2),
                      const Color(0xFFFFFFFF).withOpacity(0.05),
                    ],
                    stops: const [
                      0.1,
                      1,
                    ]),
                borderGradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    const Color(0xFFffffff).withOpacity(0.3),
                    const Color((0xFFFFFFFF)).withOpacity(0.3),
                  ],
                ),
              ),
              onSelectedItemChanged: (value) async {
                appController.updateSelectedCurrency(
                    selectedCurrency: currenciesList[value]);
                ApiResponse apiRes =
                    ApiResponse(currency: currenciesList[value]);
                await apiRes.getData();
              },
              children: _makeDropDownItems(currenciesList),
            ),
          ),
        ),
      ],
    );
  }
}
