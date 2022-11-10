// ignore: depend_on_referenced_packages

// ignore: depend_on_referenced_packages
import 'package:dio/dio.dart';

import '../../models/weather_object_model.dart';
import '../remote/weather_client.dart';

class WeatherRepository {
  static Future<WeatherObjectModel?> getWeather(String cityName) async {
    WeatherObjectModel? weatherObjectModel;
    WeatherClient weatherClient = WeatherClient(Dio());
    await weatherClient
        .getWeather('aa5c8a71bfd24440abf105743220811', cityName)
        .then((response) {
      weatherObjectModel = response;
    }).onError((error, stackTrace) {});
    return weatherObjectModel;
  }

  static Future<WeatherObjectModel?> getFiveDaysForecast(
      String cityName, int numberOfDays) async {
    WeatherObjectModel? weatherObjectModel;
    WeatherClient weatherForecastClient = WeatherClient(Dio());
    await weatherForecastClient
        .getFiveDaysForecast('aa5c8a71bfd24440abf105743220811', cityName,
            numberOfDays, 'no', 'no')
        .then((response) {
      weatherObjectModel = response;
    }).onError((error, stackTrace) {});
    return weatherObjectModel;
  }
}
