import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AppController extends GetxController {
  final bottomNavigationIndex = 0.obs;

  final searchInputController = TextEditingController();

  final countryName = 'NA'.obs;
  final cityName = 'NA'.obs;
  final sunRise = 0.obs;
  final sunSet = 0.obs;
  final weatherMain = 'NA'.obs;
  final weatherDesc = 'NA'.obs;
  final timeZone = 0.obs;
  final visibility = 0.obs;
  final temp = 0.0.obs;
  final minTemp = 0.0.obs;
  final maxTemp = 0.0.obs;
  final humidity = 0.obs;
  final windSpeed = 0.0.obs;

  void changeNavigationIndex({required int bottomNavigationIndex}) {
    this.bottomNavigationIndex(bottomNavigationIndex);
  }

  updateCountryName({required String countryName}) {
    this.countryName(countryName);
  }

  updateCityName({required String cityName}) {
    this.cityName(cityName);
  }

  updateSunRise({required int sunRise}) {
    this.sunRise(sunRise);
  }

  updateSunSet({required int sunSet}) {
    this.sunSet(sunSet);
  }

  updateWeatherMain({required String weatherMain}) {
    this.weatherMain(weatherMain);
  }

  updateWeatherDesc({required String weatherDesc}) {
    this.weatherDesc(weatherDesc);
  }

  updateTimeZone({required int timeZone}) {
    this.timeZone(timeZone);
  }

  updateVisibility({required int visibility}) {
    this.visibility(visibility);
  }

  updateTemp({required double temp}) {
    this.temp(temp);
  }

  updateMinTemp({required double minTemp}) {
    this.minTemp(minTemp);
  }

  updateMaxTemp({required double maxTemp}) {
    this.maxTemp(maxTemp);
  }

  updateHumidity({required int humidity}) {
    this.humidity(humidity);
  }

  updateWindSpeed({required double windSpeed}) {
    this.windSpeed(windSpeed);
  }

  @override
  void dispose() {
    searchInputController.dispose();
    super.dispose();
  }
}
