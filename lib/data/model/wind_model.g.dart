// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wind_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WindModel _$WindModelFromJson(Map<String, dynamic> json) => WindModel(
      (json['speed'] as num).toDouble(),
      json['deg'] as int,
    );

Map<String, dynamic> _$WindModelToJson(WindModel instance) => <String, dynamic>{
      'speed': instance.speed,
      'deg': instance.deg,
    };
