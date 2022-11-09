// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast_object_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForecastObjectModel _$ForecastObjectModelFromJson(Map<String, dynamic> json) =>
    ForecastObjectModel(
      (json['forecastday'] as List<dynamic>)
          .map((e) => ForecastDayModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ForecastObjectModelToJson(
        ForecastObjectModel instance) =>
    <String, dynamic>{
      'forecastday': instance.forecastDay,
    };
