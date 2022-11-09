import 'package:json_annotation/json_annotation.dart';

import 'condition_day_model.dart';

part 'day_model.g.dart';

@JsonSerializable()
class DayModel {
  @JsonKey(name: 'maxtemp_c')
  final double maxTempC;
  @JsonKey(name: 'mintemp_c')
  final double minTempC;
  @JsonKey(name: 'condition')
  final ConditionDayModel conditionDay;

  DayModel(this.maxTempC, this.minTempC, this.conditionDay);

  factory DayModel.fromJson(Map<String, dynamic> json) =>
      _$DayModelFromJson(json);

  /// Connect the generated [_$UserModelToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$DayModelToJson(this);
}
