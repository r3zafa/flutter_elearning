import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

const String _apiKey = 'b52129553f90f9b6b07a68092d114f92';
const String _apiUrl = "api.openweathermap.org";
const String _apiUrlRoute = '/data/2.5/weather';

class NetworkHelper {
  NetworkHelper({this.latitude, this.longitude, this.cityName});

  final double? longitude;
  final double? latitude;
  final String? cityName;

  Future getData() async {
    Map<String, dynamic> reqHeader = {};
    if (longitude != null && latitude != null) {
      reqHeader = {
        'lat': latitude.toString(),
        'lon': longitude.toString(),
        'appid': _apiKey,
        'units': 'metric',
      };
    } else if (cityName != null && (longitude == null || latitude == null)) {
      reqHeader = {
        'q': cityName,
        'appid': _apiKey,
        'units': 'metric',
      };
    } else {
      Future.error('invalid input assignment');
    }

    var url = Uri.http(_apiUrl, _apiUrlRoute, reqHeader);

    http.Response res;
    try {
      res = await http.get(url);
      var statusCode = res.statusCode;
      Map<String, dynamic> decodedData = convert.jsonDecode(res.body);

      if (statusCode == 200) {
        return decodedData;
      } else {
        if (kDebugMode) {
          print('Request failed with status: ${res.statusCode}.');
        }
      }
    } catch (e) {
      Future.error('---> $e <---');
    }
  }
}
