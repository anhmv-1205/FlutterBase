import 'package:flutter_base_project/domain/entities/entity.dart';

class User extends Entity {
  final int id;
  final String name;

  User(this.id, this.name);
}
