import 'package:json_annotation/json_annotation.dart';

part 'location_model.g.dart';

@JsonSerializable()
class LocationModel {
  final String name;
  final String region;
  final String country;
  final double lat;
  final double lon;
  @JsonKey(name: 'tz_id')
  final String tzId;
  @JsonKey(name: 'localtime_epoch')
  final int localTimeEpoch;
  @JsonKey(name: 'localtime')
  final String localTime;

  LocationModel(this.name, this.region, this.country, this.lat, this.lon,
      this.tzId, this.localTimeEpoch, this.localTime);

  factory LocationModel.fromJson(Map<String, dynamic> json) =>
      _$LocationModelFromJson(json);

  /// Connect the generated [_$UserModelToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$LocationModelToJson(this);
}
