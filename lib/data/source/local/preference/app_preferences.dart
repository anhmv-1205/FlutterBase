import 'dart:convert';

import 'package:flutter_base_project/data/source/local/preference/model/user_preference_data.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'config/shared_pref_key.dart';
import 'error/shared_pref_exception.dart';

@LazySingleton()
class AppPreferences {
  final SharedPreferences _sharedPreference;

  AppPreferences(this._sharedPreference);

  Future<bool> saveAccessToken(String token) {
    return _sharedPreference
        .setString(SharedPrefKey.accessToken, token)
        .catchError((error) => throw SharedPrefException('Can not save access token', error));
  }

  String get accessToken {
    return _sharedPreference.getString(SharedPrefKey.accessToken) ?? '';
  }

  Future<bool> saveIsLoggedIn(bool isLoggedIn) {
    return _sharedPreference
        .setBool(SharedPrefKey.isLoggedIn, isLoggedIn)
        .catchError((error) => throw SharedPrefException('Can not save isLoggedIn flag', error));
  }

  bool get isLoggedIn {
    return _sharedPreference.getBool(SharedPrefKey.isLoggedIn) ?? false;
  }

  Future<bool> saveCurrentUser(UserPreferenceData preferenceUserData) {
    return _sharedPreference
        .setString(SharedPrefKey.currentUser, json.encode(preferenceUserData))
        .catchError((error) => throw SharedPrefException('Can not save current user', error));
  }

  UserPreferenceData? get currentUser {
    final String? user = _sharedPreference.getString(SharedPrefKey.currentUser);
    if (user == null) return null;
    return UserPreferenceData.fromJson(json.decode(user));
  }

  Future<bool> saveIsDarkMode(bool isDarkMode) {
    return _sharedPreference
        .setBool(SharedPrefKey.isDarkMode, isDarkMode)
        .catchError((error) => throw SharedPrefException('Can not save isDarkMode flag', error));
  }

  bool get isDarkMode {
    return _sharedPreference.getBool(SharedPrefKey.isDarkMode) ?? false;
  }

  Future<bool> saveDeviceToken(String token) {
    return _sharedPreference
        .setString(SharedPrefKey.deviceToken, token)
        .catchError((error) => throw SharedPrefException('Can not save device token', error));
  }

  String get deviceToken {
    return _sharedPreference.getString(SharedPrefKey.deviceToken) ?? '';
  }

  Future<void> clearAllUserInfo() async {
    await Future.wait([
      _sharedPreference.remove(SharedPrefKey.currentUser),
      _sharedPreference.remove(SharedPrefKey.isLoggedIn),
      _sharedPreference.remove(SharedPrefKey.accessToken),
    ]);
  }
}
