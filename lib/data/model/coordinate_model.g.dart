// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coordinate_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoordinateModel _$CoordinateModelFromJson(Map<String, dynamic> json) =>
    CoordinateModel(
      (json['lon'] as num).toDouble(),
      (json['lat'] as num).toDouble(),
    );

Map<String, dynamic> _$CoordinateModelToJson(CoordinateModel instance) =>
    <String, dynamic>{
      'lon': instance.longitude,
      'lat': instance.latitude,
    };
