import 'package:flutter_base_project/data/model/api_response/base_response.dart';
import 'package:flutter_base_project/data/model/base/data_model.dart';
import 'package:flutter_base_project/data/model/user_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse extends DataModel {
  @JsonKey(name: "access_token")
  final String accessToken;
  @JsonKey(name: "token_type")
  final String tokenType;
  @JsonKey(name: "user")
  final UserData user;

  LoginResponse(this.accessToken, this.tokenType, this.user);

  factory LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}
