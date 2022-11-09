import 'package:json_annotation/json_annotation.dart';

import 'current_model.dart';
import 'forecast_object_model.dart';
import 'location_model.dart';

part 'weather_object_model.g.dart';

@JsonSerializable()
class WeatherObjectModel {
  final LocationModel location;
  final CurrentModel current;
  final ForecastObjectModel? forecast;

  WeatherObjectModel(this.location, this.current, this.forecast);

  factory WeatherObjectModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherObjectModelFromJson(json);

  /// Connect the generated [_$UserModelToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$WeatherObjectModelToJson(this);
}
