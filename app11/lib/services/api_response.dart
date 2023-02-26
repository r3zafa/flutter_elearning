import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import '../controllers/app_controller.dart';

final String? apiKey = dotenv.env['API_KEY'];
final String? apiUrl = dotenv.env['API_URL'];

class ApiResponse {
  ApiResponse({required this.currency});
  final appController = Get.put(AppController());

  final String currency;

  Future<void> getData() async {
    Map<String, String> reqHeader = {'X-CoinAPI-Key': apiKey.toString()};

    Map<String, Uri> urls = {
      'BTC': Uri.parse('$apiUrl/BTC/$currency'),
      'ETH': Uri.parse('$apiUrl/ETH/$currency'),
      'LTC': Uri.parse('$apiUrl/LTC/$currency'),
    };

    final Map<String, double> results = {};

    for (var entry in urls.entries) {
      http.Response response = await http.get(entry.value, headers: reqHeader);
      if (response.statusCode == 200) {
        var decodedData = convert.jsonDecode(response.body);
        results[entry.key] = decodedData['rate'];
      } else {
        if (kDebugMode) {
          print(
              '.................. ${entry.key} ${response.statusCode} ................');
        }
      }
    } //for
    appController.updateBtcChangeRate(btcChangeRate: results['BTC']!);
    appController.updateEthChangeRate(ethChangeRate: results['ETH']!);
    appController.updateLtcChangeRate(ltcChangeRate: results['LTC']!);
  } // getData
} //class
