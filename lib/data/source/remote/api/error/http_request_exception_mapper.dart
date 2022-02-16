import 'package:dio/dio.dart';
import 'package:flutter_base_project/data/model/api_response/error_response.dart';
import 'package:flutter_base_project/data/model/mapper/error_response_mapper.dart';
import 'package:flutter_base_project/domain/exception/mapper/exception_mapper.dart';
import 'package:flutter_base_project/domain/exception/remote_exception.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class HttpRequestExceptionMapper extends ExceptionMapper<RemoteException> {
  final ErrorResponseMapper _errorResponseMapper;

  HttpRequestExceptionMapper(this._errorResponseMapper);

  @override
  RemoteException map(Object? exception) {
    if (exception is DioError) {
      if (exception.error is RemoteException) {
        return exception.error;
      }

      switch (exception.type) {
        case DioErrorType.cancel:
          return const RemoteException.cancellationError();
        case DioErrorType.connectTimeout:
        case DioErrorType.sendTimeout:
        case DioErrorType.receiveTimeout:
          return const RemoteException.timeoutError();
        case DioErrorType.other:
          break;
        case DioErrorType.response:
          if (exception.response?.data != null) {
            final errorResponse = ErrorResponse.fromJson(exception.response!.data!);
            return RemoteException.serverError(
              exception.response!.statusCode,
              _errorResponseMapper.mapToEntity(errorResponse),
              errorResponse.message,
            );
          } else {
            return RemoteException.httpError(exception.response!.statusCode);
          }
      }
    }

    return RemoteException.unexpectedError(
        exception is Exception ? exception : Exception(exception?.toString() ?? "Unexpected error"));
  }
}
