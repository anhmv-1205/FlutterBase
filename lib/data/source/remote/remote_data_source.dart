import 'package:flutter_base_project/data/model/mapper/user_data_mapper.dart';
import 'package:flutter_base_project/domain/entities/user.dart';
import 'package:injectable/injectable.dart';
import 'package:tuple/tuple.dart';

import 'api/services/user_service.dart';

@LazySingleton()
class RemoteDataSource {
  final UserService _userService;
  final UserDataMapper _remoteUserDataMapper;

  RemoteDataSource(this._userService, this._remoteUserDataMapper);

  Future<Tuple2<String, User>> login(String username, String password) async {
    final response = await _userService.login(username, password);
    return Tuple2(response.data.accessToken, _remoteUserDataMapper.mapToEntity(response.data.user));
  }
}
