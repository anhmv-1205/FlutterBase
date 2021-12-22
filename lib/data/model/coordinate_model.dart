import 'package:json_annotation/json_annotation.dart';

part 'coordinate_model.g.dart';

@JsonSerializable()
class CoordinateModel {
  @JsonKey(name: 'lon')
  final double longitude;
  @JsonKey(name: 'lat')
  final double latitude;

  CoordinateModel(
    this.longitude,
    this.latitude,
  );

  factory CoordinateModel.fromJson(Map<String, dynamic> json) => _$CoordinateModelFromJson(json);

  Map<String, dynamic> toJson() => _$CoordinateModelToJson(this);
}
