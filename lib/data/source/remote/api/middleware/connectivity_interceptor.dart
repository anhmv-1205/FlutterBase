import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_base_project/domain/exception/remote_exception.dart';

class ConnectivityInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      return handler.reject(DioError(requestOptions: options, error: const RemoteException.noInternet()));
    }
    return super.onRequest(options, handler);
  }
}
