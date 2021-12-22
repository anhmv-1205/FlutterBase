// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_repsonse_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherResponseModel _$WeatherResponseModelFromJson(
        Map<String, dynamic> json) =>
    WeatherResponseModel(
      CoordinateModel.fromJson(json['coord'] as Map<String, dynamic>),
      (json['weather'] as List<dynamic>)
          .map((e) => WeatherModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['base'] as String,
      MainModel.fromJson(json['main'] as Map<String, dynamic>),
      json['visibility'] as int,
      WindModel.fromJson(json['wind'] as Map<String, dynamic>),
      CloudsModel.fromJson(json['clouds'] as Map<String, dynamic>),
      json['dt'] as int,
      SystemModel.fromJson(json['sys'] as Map<String, dynamic>),
      json['timezone'] as int,
      json['id'] as int,
      json['name'] as String,
      json['cod'] as int,
    );

Map<String, dynamic> _$WeatherResponseModelToJson(
        WeatherResponseModel instance) =>
    <String, dynamic>{
      'coord': instance.coordinate,
      'weather': instance.weather,
      'base': instance.base,
      'main': instance.main,
      'visibility': instance.visibility,
      'wind': instance.wind,
      'clouds': instance.clouds,
      'dt': instance.dt,
      'sys': instance.sys,
      'timezone': instance.timezone,
      'id': instance.id,
      'name': instance.name,
      'cod': instance.cod,
    };
