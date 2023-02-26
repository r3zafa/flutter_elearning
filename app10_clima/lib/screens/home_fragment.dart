import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/app_controller.dart';
import '../services/weather.dart';
import '../utils/color_mode.dart';
import '../utils/map_values.dart';
import '../widget/bottom_temp_card.dart';
import '../widget/icon_text_badge.dart';
import '../widget/one_line_text.dart';
import '../widget/status_image.dart';
import '../widget/temp_widget.dart';

class HomeFragment extends StatelessWidget {
  HomeFragment({Key? key}) : super(key: key);

  final appController = Get.put(AppController());
  void update() async {
    Weather weather = Weather();
    await weather.initData();
    await weather.getWeatherData();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient:
              kLinearGradiantMap[colorMode(appController.weatherMain.value)],
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconTextBadge(
                    text1: appController.cityName.value,
                    icon: Icons.location_on,
                    isLocationBadge: true,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15, top: 20),
                    child: TextButton(
                      style: ButtonStyle(
                        backgroundColor:
                            const MaterialStatePropertyAll(Colors.white12),
                        shape: MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        padding: const MaterialStatePropertyAll(
                          EdgeInsets.all(12),
                        ),
                      ),
                      onPressed: () {
                        update();
                      },
                      child: const Icon(
                        Icons.my_location,
                        size: 36,
                      ),
                    ),
                  ),
                ],
              ),
              StatusImage(
                forecast: colorMode(appController.weatherMain.value),
                size: 190,
                height: 190,
              ),
              OneLineText(inputText: appController.weatherDesc.value),
              TempWidget(temp: appController.temp.value),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconTextBadge(
                    text1: (appController.windSpeed * 3.6).toStringAsFixed(2),
                    text2: 'km/h',
                    icon: Icons.wind_power,
                    isLocationBadge: false,
                  ),
                  const SizedBox(width: 30),
                  IconTextBadge(
                    text1: appController.humidity.toString(),
                    text2: '%',
                    icon: Icons.water_drop_outlined,
                    isLocationBadge: false,
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 10, right: 10, top: 0),
                  padding: const EdgeInsets.only(top: 20),
                  width: double.infinity,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BottomTempCard(
                        cardTitle: 'Sunrise',
                        cardForecast: 'sunrise',
                        cardTimeStamp: appController.sunRise.toInt(),
                      ),
                      BottomTempCard(
                        cardTitle: 'Sunset',
                        cardForecast: 'sunset',
                        cardTimeStamp: appController.sunSet.toInt(),
                      ),
                      BottomTempCard(
                        cardTitle: 'Visibility',
                        cardForecast: 'visibility',
                        cardVisibility: appController.visibility.toInt(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
