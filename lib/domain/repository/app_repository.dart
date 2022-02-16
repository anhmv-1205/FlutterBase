import 'package:flutter_base_project/domain/entities/user.dart';

abstract class AppRepository {
  Future<bool> saveIsDarkMode(bool isDarkMode);

  bool get isDarkMode;

  Future<User> login({required String username, required String password});
}
