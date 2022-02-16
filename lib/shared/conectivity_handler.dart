import 'package:connectivity_plus/connectivity_plus.dart';

abstract class ConnectivityHandler {
  void onError(String err);

  void onConnectivityChanged(ConnectivityResult connectivity);
}
