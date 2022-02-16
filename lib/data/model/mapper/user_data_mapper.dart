import 'package:flutter_base_project/data/model/mapper/data_mapper.dart';
import 'package:flutter_base_project/data/model/user_data.dart';
import 'package:flutter_base_project/domain/entities/user.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class UserDataMapper extends DataMapper<UserData, User> {
  @override
  User mapToEntity(UserData data) {
    return User(1, data.tendn);
  }
}
