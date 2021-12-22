import 'package:json_annotation/json_annotation.dart';

part 'system_model.g.dart';

@JsonSerializable()
class SystemModel {
  final int type;
  final int id;
  final String country;
  final int sunrise;
  final int sunset;

  SystemModel(
    this.type,
    this.id,
    this.country,
    this.sunrise,
    this.sunset,
  );

  factory SystemModel.fromJson(Map<String, dynamic> json) => _$SystemModelFromJson(json);

  Map<String, dynamic> toJson() => _$SystemModelToJson(this);
}
