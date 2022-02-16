import 'package:flutter_base_project/data/source/local/preference/model/mapper/base/base_preference_mapper.dart';
import 'package:flutter_base_project/domain/entities/user.dart';
import 'package:injectable/injectable.dart';

import '../user_preference_data.dart';

@Injectable()
class UserPreferenceMapper extends BasePreferenceMapper<UserPreferenceData, User> {
  @override
  User mapToEntity(UserPreferenceData data) {
    return User(data.id, data.name);
  }
}
