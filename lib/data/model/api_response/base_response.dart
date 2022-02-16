import 'package:json_annotation/json_annotation.dart';

part 'base_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class BaseResponse<T> {
  final bool success;
  final String message;
  final T data;

  BaseResponse(this.success, this.message, this.data);

  factory BaseResponse.fromJson(Map<String, dynamic> json, T Function(dynamic) fromJsonT) =>
      _$BaseResponseFromJson(json, fromJsonT);
}
