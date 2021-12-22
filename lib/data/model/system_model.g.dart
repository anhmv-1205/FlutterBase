// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'system_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SystemModel _$SystemModelFromJson(Map<String, dynamic> json) => SystemModel(
      json['type'] as int,
      json['id'] as int,
      json['country'] as String,
      json['sunrise'] as int,
      json['sunset'] as int,
    );

Map<String, dynamic> _$SystemModelToJson(SystemModel instance) =>
    <String, dynamic>{
      'type': instance.type,
      'id': instance.id,
      'country': instance.country,
      'sunrise': instance.sunrise,
      'sunset': instance.sunset,
    };
