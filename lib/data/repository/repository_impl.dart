import 'package:flutter_base_project/data/source/local/local_data_source.dart';
import 'package:flutter_base_project/data/source/remote/remote_data_source.dart';
import 'package:flutter_base_project/domain/entities/user.dart';
import 'package:flutter_base_project/domain/repository/app_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AppRepository)
class RepositoryImpl extends AppRepository {
  final LocalDataSource _localDataSource;
  final RemoteDataSource _remoteDataSource;

  RepositoryImpl(this._localDataSource, this._remoteDataSource);

  @override
  bool get isDarkMode => _localDataSource.isDarkMode;

  @override
  Future<bool> saveIsDarkMode(bool isDarkMode) {
    return _localDataSource.saveIsDarkMode(isDarkMode);
  }

  @override
  Future<User> login({required String username, required String password}) async {
    final result = await _remoteDataSource.login(username, password);
    await _saveLocalData(result.item1);
    return result.item2;
  }

  Future<List<Object>> _saveLocalData(String token) async {
    return Future.wait([
      _localDataSource.saveAccessToken(token),
      _localDataSource.saveIsLoggedIn(true),
    ]);
  }
}
