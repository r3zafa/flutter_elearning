import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../controllers/app_controller.dart';
import 'location.dart';
import 'network_helper.dart';
import 'package:get/get.dart';

class Weather {
  final appController = Get.find<AppController>();
  Map<String, dynamic> _dataFromApiCal = {};

  Future initData() async {
    Location loc = Location();
    await loc.getLocation();
    NetworkHelper nt =
        NetworkHelper(latitude: loc.latitude, longitude: loc.longitude);
    _dataFromApiCal = await nt.getData();
  }

  Future initDataFromCoordination({required double long, lat}) async {
    Location loc = Location();
    await loc.getLocation();
    NetworkHelper nt = NetworkHelper(latitude: long, longitude: lat);
    await Future.delayed(const Duration(milliseconds: 500));
    _dataFromApiCal = await nt.getData();
  }

  Future initDataFromName({required String locationName}) async {
    try {
      NetworkHelper nh = NetworkHelper(cityName: locationName);
      _dataFromApiCal = await nh.getData();
    } catch (e) {
      Future.error('##### NOT FOUND ######');
    }
  }

  Future getWeatherData() async {
    try {
      appController.updateCountryName(
          countryName: _dataFromApiCal['sys']['country']);
      appController.updateCityName(cityName: _dataFromApiCal['name']);
      appController.updateSunRise(sunRise: _dataFromApiCal['sys']['sunrise']);
      appController.updateSunSet(sunSet: _dataFromApiCal['sys']['sunset']);
      appController.updateTimeZone(timeZone: _dataFromApiCal['timezone']);
      appController.updateVisibility(visibility: _dataFromApiCal['visibility']);
      appController.updateWeatherMain(
          weatherMain: _dataFromApiCal['weather'][0]['main']);
      appController.updateWeatherDesc(
          weatherDesc: _dataFromApiCal['weather'][0]['description']);
      appController.updateTemp(temp: _dataFromApiCal['main']['temp']);
      appController.updateMinTemp(minTemp: _dataFromApiCal['main']['temp_min']);
      appController.updateMaxTemp(maxTemp: _dataFromApiCal['main']['temp_max']);
      appController.updateHumidity(
          humidity: _dataFromApiCal['main']['humidity']);
      appController.updateWindSpeed(
          windSpeed: _dataFromApiCal['wind']['speed']);
      if (kDebugMode) {
        print('${appController.cityName} : ${appController.temp}');
      }
      Get.snackbar(
        'Success',
        'Weather information has been Fetched',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.white,
        animationDuration: const Duration(seconds: 1),
      );
    } catch (e) {
      Future.error(e);
    }
  }
}
