import 'package:flutter_base_project/data/model/base/data_model.dart';
import 'package:flutter_base_project/data/model/api_response/error_response_detail.dart';
import 'package:json_annotation/json_annotation.dart';

part 'error_response.g.dart';

@JsonSerializable()
class ErrorResponse extends DataModel {
  @JsonKey(name: "success")
  bool? status;
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "errors")
  List<ErrorResponseDetail>? errors;

  ErrorResponse(this.status, this.message, this.errors);

  factory ErrorResponse.fromJson(Map<String, dynamic> json) => _$ErrorResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorResponseToJson(this);
}
