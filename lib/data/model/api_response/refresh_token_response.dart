import 'package:flutter_base_project/data/model/base/data_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'refresh_token_response.g.dart';

@JsonSerializable()
class RefreshTokenResponse extends DataModel {
  @JsonKey(name: "token")
  final String token;

  RefreshTokenResponse(this.token);


  factory RefreshTokenResponse.fromJson(Map<String, dynamic> json) => _$RefreshTokenResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RefreshTokenResponseToJson(this);
}
