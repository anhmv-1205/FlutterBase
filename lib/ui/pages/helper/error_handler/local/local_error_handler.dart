import 'package:flutter/material.dart';
import 'package:flutter_base_project/domain/exception/local_exception.dart';

import '../error_handler.dart';
import 'local_error_listener.dart';

class LocalErrorHandler extends ErrorHandler<LocalException, LocalErrorListener> {
  @override
  void proceed(BuildContext context, LocalException exception, LocalErrorListener listener) {}
}
