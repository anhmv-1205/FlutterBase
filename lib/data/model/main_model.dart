import 'package:json_annotation/json_annotation.dart';

part 'main_model.g.dart';

@JsonSerializable()
class MainModel {
  final double temp;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final int pressure;
  final int humidity;

  MainModel(
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.pressure,
    this.humidity,
  );

  factory MainModel.fromJson(Map<String, dynamic> json) => _$MainModelFromJson(json);

  Map<String, dynamic> toJson() => _$MainModelToJson(this);
}
