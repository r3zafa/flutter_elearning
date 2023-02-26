import 'package:app11_bitcoin_ticker/services/api_response.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../constants/constants.dart';
import '../../controllers/app_controller.dart';

class MaterialPickerButton extends StatelessWidget {
  MaterialPickerButton({Key? key}) : super(key: key);

  final appController = Get.put(AppController());

  List<DropdownMenuItem<String>> _makeDropDownItems(List<String> stringList) {
    List<DropdownMenuItem<String>> temp = [];
    for (String item in stringList) {
      var menuItem = DropdownMenuItem(
        value: item,
        child: Center(
          child: Text(item),
        ),
      );
      temp.add(menuItem);
    }
    return temp;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 5.h,
          width: 100.w,
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.only(bottom: 1.h),
          child: Text(
            'Currency',
            style: GoogleFonts.poppins(color: Colors.white, fontSize: 14.sp),
          ),
        ),
        DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.deepOrange.shade800,
            borderRadius: BorderRadius.circular(5),
            boxShadow: const <BoxShadow>[
              BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.57), //shadow for button
                  blurRadius: 5) //blur radius of shadow
            ],
          ),
          child: Container(
            height: 8.h,
            padding: EdgeInsets.only(left: 5.w, right: 5.w),
            alignment: Alignment.center,
            child: Obx(
              () => DropdownButton(
                value: appController.selectedCurrency.value,
                items: _makeDropDownItems(currenciesList),
                isExpanded: true,
                underline: const SizedBox(),
                dropdownColor: Colors.deepOrange.shade400,
                iconEnabledColor: Colors.white,
                style: GoogleFonts.poppins(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1,
                  color: Colors.white,
                ),
                onChanged: (value) async {
                  appController.updateSelectedCurrency(
                      selectedCurrency: '$value');
                  ApiResponse apiRes = ApiResponse(currency: value.toString());
                  await apiRes.getData();
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
