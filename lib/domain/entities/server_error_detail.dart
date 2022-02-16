import 'package:flutter_base_project/domain/entities/entity.dart';

class ServerErrorDetail extends Entity {
  String? messageError;

  ServerErrorDetail(this.messageError);
}
