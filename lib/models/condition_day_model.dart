import 'package:json_annotation/json_annotation.dart';

part 'condition_day_model.g.dart';

@JsonSerializable()
class ConditionDayModel {
  final String text;
  final String icon;

  ConditionDayModel(this.text, this.icon);

  factory ConditionDayModel.fromJson(Map<String, dynamic> json) =>
      _$ConditionDayModelFromJson(json);

  /// Connect the generated [_$UserModelToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$ConditionDayModelToJson(this);
}
