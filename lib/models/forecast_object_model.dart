import 'package:json_annotation/json_annotation.dart';

import 'forecast_day_model.dart';

part 'forecast_object_model.g.dart';

@JsonSerializable()
class ForecastObjectModel {
  @JsonKey(name: 'forecastday')
  final List<ForecastDayModel> forecastDay;

  ForecastObjectModel(this.forecastDay);

  factory ForecastObjectModel.fromJson(Map<String, dynamic> json) =>
      _$ForecastObjectModelFromJson(json);

  /// Connect the generated [_$UserModelToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$ForecastObjectModelToJson(this);
}
