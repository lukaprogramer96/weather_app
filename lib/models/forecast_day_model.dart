import 'package:json_annotation/json_annotation.dart';

import 'day_model.dart';

part 'forecast_day_model.g.dart';

@JsonSerializable()
class ForecastDayModel {
  final String date;
  @JsonKey(name: 'date_epoch')
  final int dateEpoch;
  final DayModel day;

  ForecastDayModel(this.date, this.dateEpoch, this.day);

  factory ForecastDayModel.fromJson(Map<String, dynamic> json) =>
      _$ForecastDayModelFromJson(json);

  /// Connect the generated [_$UserModelToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$ForecastDayModelToJson(this);
}
