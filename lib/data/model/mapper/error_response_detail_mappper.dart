import 'package:flutter_base_project/data/model/api_response/error_response_detail.dart';
import 'package:flutter_base_project/domain/entities/server_error_detail.dart';
import 'package:injectable/injectable.dart';

import 'data_mapper.dart';

@Injectable()
class ErrorResponseDetailMapper extends DataMapper<ErrorResponseDetail, ServerErrorDetail> {
  @override
  ServerErrorDetail mapToEntity(ErrorResponseDetail data) {
    return ServerErrorDetail(data.message);
  }
}
