import 'package:json_annotation/json_annotation.dart';

part 'wind_model.g.dart';

@JsonSerializable()
class WindModel {
  final double speed;
  final int deg;

  WindModel(this.speed, this.deg);

  factory WindModel.fromJson(Map<String, dynamic> json) => _$WindModelFromJson(json);

  Map<String, dynamic> toJson() => _$WindModelToJson(this);
}
