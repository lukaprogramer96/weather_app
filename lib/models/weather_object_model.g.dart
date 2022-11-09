// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_object_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherObjectModel _$WeatherObjectModelFromJson(Map<String, dynamic> json) =>
    WeatherObjectModel(
      LocationModel.fromJson(json['location'] as Map<String, dynamic>),
      CurrentModel.fromJson(json['current'] as Map<String, dynamic>),
      json['forecast'] == null
          ? null
          : ForecastObjectModel.fromJson(
              json['forecast'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WeatherObjectModelToJson(WeatherObjectModel instance) =>
    <String, dynamic>{
      'location': instance.location,
      'current': instance.current,
      'forecast': instance.forecast,
    };
