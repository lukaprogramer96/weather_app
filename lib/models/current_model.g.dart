// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentModel _$CurrentModelFromJson(Map<String, dynamic> json) => CurrentModel(
      json['last_updated_epoch'] as int,
      json['last_updated'] as String?,
      (json['temp_c'] as num?)?.toDouble(),
      (json['temp_f'] as num?)?.toDouble(),
      json['is_day'] as int,
      ConditionModel.fromJson(json['condition'] as Map<String, dynamic>),
      (json['wind_mph'] as num).toDouble(),
      (json['wind_kph'] as num).toDouble(),
      json['wind_degree'] as int,
      json['wind_dir'] as String,
      (json['pressure_mb'] as num).toDouble(),
      (json['pressure_in'] as num).toDouble(),
      (json['precip_mm'] as num).toDouble(),
      (json['precip_in'] as num).toDouble(),
      json['humidity'] as int,
      json['cloud'] as int,
      (json['feelslike_c'] as num).toDouble(),
      (json['feelslike_f'] as num).toDouble(),
      (json['vis_km'] as num).toDouble(),
      (json['vis_miles'] as num).toDouble(),
      (json['uv'] as num).toDouble(),
      (json['gust_mph'] as num).toDouble(),
      (json['gust_kph'] as num).toDouble(),
    );

Map<String, dynamic> _$CurrentModelToJson(CurrentModel instance) =>
    <String, dynamic>{
      'last_updated_epoch': instance.lastUpdatedEpoch,
      'last_updated': instance.lastUpdated,
      'temp_c': instance.tempC,
      'temp_f': instance.tempF,
      'is_day': instance.isDay,
      'condition': instance.condition,
      'wind_mph': instance.windMph,
      'wind_kph': instance.windKph,
      'wind_degree': instance.windDegree,
      'wind_dir': instance.windDir,
      'pressure_mb': instance.pressureMb,
      'pressure_in': instance.pressureIn,
      'precip_mm': instance.precipMm,
      'precip_in': instance.precipIn,
      'humidity': instance.humidity,
      'cloud': instance.cloud,
      'feelslike_c': instance.feelsLikeC,
      'feelslike_f': instance.feelsLikeF,
      'vis_km': instance.visKm,
      'vis_miles': instance.visMiles,
      'uv': instance.uv,
      'gust_mph': instance.gustMph,
      'gust_kph': instance.gustKph,
    };
