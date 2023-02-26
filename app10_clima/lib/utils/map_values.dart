import 'package:flutter/material.dart';

Map<String, String> kImgPath = {
  'clear': 'assets/clear.jpg',
  'cloud': 'assets/cloud.jpg',
  'rain': 'assets/rain.jpg',
  'snow': 'assets/snow.jpg',
  'wind': 'assets/wind.jpg',
};

Map<String, String> kSvgPath = {
  'cloud': 'assets/svg/cloud.svg',
  'partlyCloud': 'assets/svg/partly_cloud.svg',
  'rain': 'assets/svg/rain.svg',
  'snow': 'assets/svg/snow.svg',
  'storm': 'assets/svg/storm.svg',
  'sun': 'assets/svg/sun.svg',
  'thunder': 'assets/svg/thunder.svg',
  'tornado': 'assets/svg/tornado.svg',
  'wind': 'assets/svg/wind.svg',
  'sunrise': 'assets/svg/sunrise.svg',
  'sunset': 'assets/svg/sunset.svg',
  'temp': 'assets/svg/temp.svg',
  'visibility': 'assets/svg/visibility.svg',
};

Map<String, LinearGradient> kLinearGradiantMap = {
  'sun': generateLinearGradiant(colorList: [
    Colors.yellow.shade200,
    Colors.orange.shade700,
  ]),
  'clear': generateLinearGradiant(colorList: [
    Colors.yellow.shade200,
    Colors.orange.shade700,
  ]),
  'cloud': generateLinearGradiant(colorList: [
    Colors.teal.shade300,
    Colors.teal.shade600,
  ]),
  'rain': generateLinearGradiant(colorList: [
    Colors.blue.shade300,
    Colors.blue.shade700,
  ]),
  'snow': generateLinearGradiant(colorList: [
    Colors.lightBlue.shade100,
    Colors.blue.shade400,
    Colors.blue.shade900,
  ]),
  'wind': generateLinearGradiant(colorList: [
    Colors.teal.shade200,
    Colors.teal.shade500,
  ]),
};

Map<String, Color> kColorMap = {
  'sun': Colors.orange.shade700,
  'clear': Colors.orange.shade700,
  'cloud': Colors.teal.shade600,
  'rain': Colors.blue.shade700,
  'snow': Colors.blue.shade900,
  'wind': Colors.teal.shade500,
};

LinearGradient generateLinearGradiant({required List<Color> colorList}) {
  return LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: colorList,
  );
}
