import 'package:flutter_base_project/data/model/wind_model.dart';
import 'package:flutter_base_project/domain/entities/Clouds.dart';
import 'package:flutter_base_project/domain/entities/coordinate.dart';
import 'package:flutter_base_project/domain/entities/main.dart';
import 'package:flutter_base_project/domain/entities/system.dart';
import 'package:flutter_base_project/domain/entities/weather.dart';

class WeatherResponse {
  Coordinate coordinate;
  List<Weather> weather;
  String base;
  Main main;
  int visibility;
  WindModel wind;
  Clouds clouds;
  int dt;
  System sys;
  int timezone;
  int id;
  String name;
  int cod;

  WeatherResponse(
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
}
