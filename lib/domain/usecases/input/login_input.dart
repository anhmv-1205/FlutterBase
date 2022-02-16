import 'package:flutter_base_project/domain/usecases/base/base_input.dart';

class LoginInput extends BaseInput {
  final String email;
  final String password;

  LoginInput(this.email, this.password);
}
