// ignore: depend_on_referenced_packages
import 'package:dio/dio.dart';
// ignore: depend_on_referenced_packages
import 'package:retrofit/retrofit.dart';
// ignore: unused_import
import 'package:weather_app/models/forecast_object_model.dart';

import '../../models/weather_object_model.dart';

part 'weather_client.g.dart';

@RestApi(baseUrl: 'http://api.weatherapi.com')
abstract class WeatherClient {
  factory WeatherClient(Dio dio, {String baseUrl}) = _WeatherClient;

  @GET('/v1/current.json')
  Future<WeatherObjectModel?> getWeather(
    @Query('key') String key,
    @Query('q') String q,
  );

  @GET('/v1/forecast.json')
  Future<WeatherObjectModel?> getFiveDaysForecast(
    @Query('key') String key,
    @Query('q') String q,
    @Query('days') int days,
    @Query('aqi') String aqi,
    @Query('alerts') String alerts,
  );
}
