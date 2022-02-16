import 'package:flutter_base_project/data/model/base/data_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_data.g.dart';

@JsonSerializable()
class UserData extends DataModel {
  final String tendn;
  final String hoten;

  UserData(this.tendn, this.hoten);

  factory UserData.fromJson(Map<String, dynamic> json) => _$UserDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}
