import 'package:flutter_base_project/domain/entities/user.dart';
import 'package:flutter_base_project/domain/repository/app_repository.dart';
import 'package:flutter_base_project/domain/usecases/base/base_use_case.dart';
import 'package:flutter_base_project/domain/usecases/input/login_input.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class LoginUseCase extends BaseUseCase<LoginInput, User> {
  final AppRepository _repository;

  LoginUseCase(this._repository);

  @override
  Future<User> call(LoginInput input) {
    return _repository.login(username: input.email, password: input.password);
  }
}
