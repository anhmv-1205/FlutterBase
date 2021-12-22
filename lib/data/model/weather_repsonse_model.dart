import 'package:flutter_base_project/data/model/clouds_model.dart';
import 'package:flutter_base_project/data/model/coordinate_model.dart';
import 'package:flutter_base_project/data/model/main_model.dart';
import 'package:flutter_base_project/data/model/system_model.dart';
import 'package:flutter_base_project/data/model/weather_model.dart';
import 'package:flutter_base_project/data/model/wind_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'weather_repsonse_model.g.dart';

@JsonSerializable()
class WeatherResponseModel {
  @JsonKey(name: 'coord')
  final CoordinateModel coordinate;
  @JsonKey(name: 'weather')
  final List<WeatherModel> weather;
  final String base;
  final MainModel main;
  final int visibility;
  final WindModel wind;
  final CloudsModel clouds;
  final int dt;
  final SystemModel sys;
  final int timezone;
  final int id;
  final String name;
  final int cod;

  WeatherResponseModel(
    this.coordinate,
    this.weather,
    this.base,
    this.main,
    this.visibility,
    this.wind,
    this.clouds,
    this.dt,
    this.sys,
    this.timezone,
    this.id,
    this.name,
    this.cod,
  );

  factory WeatherResponseModel.fromJson(Map<String, dynamic> json) => _$WeatherResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherResponseModelToJson(this);
}
