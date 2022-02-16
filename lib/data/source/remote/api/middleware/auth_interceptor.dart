import 'dart:collection';

import 'package:dio/dio.dart';
import 'package:flutter_base_project/data/source/local/preference/app_preferences.dart';
import 'package:flutter_base_project/data/source/remote/api/config/api_config.dart';
import 'package:flutter_base_project/data/source/remote/api/services/refresh_token_service.dart';
import 'package:get_it/get_it.dart';
import 'package:tuple/tuple.dart';

class AuthInterceptor extends InterceptorsWrapper {
  final AppPreferences appPreferences = GetIt.instance.get<AppPreferences>();
  var _isRefreshing = false;
  final _queue = Queue<Tuple2<RequestOptions, ErrorInterceptorHandler>>();
  final refreshTokenService = GetIt.instance.get<RefreshTokenService>();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final accessToken = appPreferences.accessToken;
    _putAccessToken(options.headers, accessToken);
    return super.onRequest(options, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 403 || err.response?.statusCode == 401) {
      final options = err.response!.requestOptions;
      _onExpiredToken(options, handler);
    } else {
      handler.next(err);
    }
  }

  void _putAccessToken(Map<String, dynamic> headers, String accessToken) {
    headers[ApiConfig.authorization] = '${ApiConfig.bearer} $accessToken';
  }

  void _onExpiredToken(RequestOptions options, ErrorInterceptorHandler handler) {
    _queue.addLast(Tuple2(options, handler));
    if (!_isRefreshing) {
      _isRefreshing = true;
      _refreshToken().then(_onRefreshTokenSuccess).catchError(_onRefreshTokenError).whenComplete(() {
        _isRefreshing = false;
        _queue.clear();
      });
    }
  }

  Future<String> _refreshToken() async {
    _isRefreshing = true;
    final refreshTokenResponse = await refreshTokenService.refreshToken();
    await appPreferences.saveAccessToken(refreshTokenResponse.data.token);

    return refreshTokenResponse.data.token;
  }

  Future<void> _onRefreshTokenSuccess(String newToken) async {
    await Future.wait(
        _queue.map((requestInfo) => _requestWithNewToken(requestInfo.item1, requestInfo.item2, newToken)));
  }

  void _onRefreshTokenError(Object? error) {
    for (var element in _queue) {
      final options = element.item1;
      final handler = element.item2;
      handler.next(DioError(requestOptions: options, error: error));
    }
  }

  Future<void> _requestWithNewToken(RequestOptions options, ErrorInterceptorHandler handler, String newAccessToken) {
    _putAccessToken(options.headers, newAccessToken);
    return refreshTokenService
        .fetch(options)
        .then((response) => handler.resolve(response))
        .catchError((e) => handler.next(DioError(requestOptions: options, error: e)));
  }
}
