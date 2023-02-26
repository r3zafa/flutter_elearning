import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/app_controller.dart';
import '../services/weather.dart';
import '../utils/color_mode.dart';
import '../utils/map_values.dart';

class SearchFragment extends StatelessWidget {
  SearchFragment({Key? key}) : super(key: key);
  final appController = Get.put(AppController());

  updateWithName(String name) async {
    if (name.isNotEmpty) {
      Weather weather = Weather();
      await weather.initDataFromName(locationName: name);
      await weather.getWeatherData();
      appController.changeNavigationIndex(bottomNavigationIndex: 0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient:
              kLinearGradiantMap[colorMode(appController.weatherMain.value)],
        ),
        child: SafeArea(
          child: Container(
            margin: const EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white24,
                          icon: const Icon(
                            Icons.location_city,
                            size: 35,
                            color: Colors.white,
                          ),
                          hintText: 'Enter City Name',
                          border: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        controller: appController.searchInputController,
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    updateWithName(appController.searchInputController.text);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 150,
                    height: 50,
                    child: Text(
                      'Search',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ),
                const Expanded(
                  flex: 1,
                  child: SizedBox(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
