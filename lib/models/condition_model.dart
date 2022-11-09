import 'package:json_annotation/json_annotation.dart';

part 'condition_model.g.dart';

@JsonSerializable()
class ConditionModel {
  final String text;
  final String icon;
  final int code;

  ConditionModel(this.text, this.icon, this.code);

  factory ConditionModel.fromJson(Map<String, dynamic> json) =>
      _$ConditionModelFromJson(json);

  /// Connect the generated [_$UserModelToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$ConditionModelToJson(this);
}
