// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MainModel _$MainModelFromJson(Map<String, dynamic> json) => MainModel(
      (json['temp'] as num).toDouble(),
      (json['feelsLike'] as num).toDouble(),
      (json['tempMin'] as num).toDouble(),
      (json['tempMax'] as num).toDouble(),
      json['pressure'] as int,
      json['humidity'] as int,
    );

Map<String, dynamic> _$MainModelToJson(MainModel instance) => <String, dynamic>{
      'temp': instance.temp,
      'feelsLike': instance.feelsLike,
      'tempMin': instance.tempMin,
      'tempMax': instance.tempMax,
      'pressure': instance.pressure,
      'humidity': instance.humidity,
    };
