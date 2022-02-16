import 'package:flutter/foundation.dart';
import 'package:flutter_base_project/data/source/remote/api/middleware/custom_log_interceptor.dart';
import 'package:flutter_base_project/shared/helper/stream/dispose_bag.dart';
import 'package:flutter_base_project/shared/helper/stream/stream_logger.dart';

void configLogging() {
  /// config http request logging
  HttpRequestLogConfig.enableLogInterceptor = kDebugMode;

  /// config stream logging
  StreamLoggerConfig.enableStreamLogger = kDebugMode;

  /// config DisposeBag logging
  DisposeBagConfig.enableLogging = kDebugMode;
}
