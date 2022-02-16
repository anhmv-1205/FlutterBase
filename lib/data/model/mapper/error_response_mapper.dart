import 'package:flutter_base_project/domain/entities/server_error.dart';
import 'package:injectable/injectable.dart';

import '../api_response/error_response.dart';
import 'data_mapper.dart';
import 'error_response_detail_mappper.dart';

@Injectable()
class ErrorResponseMapper extends DataMapper<ErrorResponse, ServerError> {
  final ErrorResponseDetailMapper _errorResponseDetailMapper;

  ErrorResponseMapper(this._errorResponseDetailMapper);

  @override
  ServerError mapToEntity(ErrorResponse? data) {
    return ServerError(_errorResponseDetailMapper.mapToListEntity(data?.errors));
  }
}
