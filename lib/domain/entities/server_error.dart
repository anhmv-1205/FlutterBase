import 'package:flutter_base_project/domain/entities/entity.dart';
import 'package:flutter_base_project/domain/entities/server_error_detail.dart';

class ServerError extends Entity {
  List<ServerErrorDetail>? errors;

  ServerError(this.errors);
}
