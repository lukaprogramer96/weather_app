// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'day_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DayModel _$DayModelFromJson(Map<String, dynamic> json) => DayModel(
      (json['maxtemp_c'] as num).toDouble(),
      (json['mintemp_c'] as num).toDouble(),
      ConditionDayModel.fromJson(json['condition'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DayModelToJson(DayModel instance) => <String, dynamic>{
      'maxtemp_c': instance.maxTempC,
      'mintemp_c': instance.minTempC,
      'condition': instance.conditionDay,
    };
