import 'package:flutter/material.dart';
import 'package:flutter_base_project/domain/exception/remote_exception.dart';
import 'package:flutter_base_project/ui/pages/helper/error_handler/remote/remote_error_handler.dart';
import 'package:flutter_base_project/ui/pages/helper/error_handler/remote/remote_error_listener.dart';

import 'error_listener.dart';

abstract class ErrorHandler<E extends Exception, L extends ErrorListener> {
  void proceed(BuildContext context, E exception, L listener);
}

class ErrorHandlerFactory {
  ErrorHandlerFactory._();

  static void handleErrorByType(
      BuildContext context,
      Object error,
      ErrorListener listener,
      ) {
    if (error is RemoteException) {
      return RemoteErrorHandler().proceed(
        context,
        error,
        listener as RemoteErrorListener,
      );
    }

    // database error

    // shared pref error

    throw 'Uncaught Exception: ${error.runtimeType}';
  }
}
