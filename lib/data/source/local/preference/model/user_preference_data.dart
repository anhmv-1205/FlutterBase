import 'package:flutter_base_project/data/source/local/preference/model/base/base_preference_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_preference_data.g.dart';

@JsonSerializable()
class UserPreferenceData extends BasePreferenceData {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "name")
  final String name;

  UserPreferenceData(this.id, this.name);

  factory UserPreferenceData.fromJson(Map<String, dynamic> json) => _$UserPreferenceDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserPreferenceDataToJson(this);
}
