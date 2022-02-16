import 'dart:ui';

import 'package:flutter_base_project/domain/entities/user.dart';
import 'package:flutter_base_project/domain/exception/remote_exception.dart';
import 'package:flutter_base_project/domain/usecases/input/login_input.dart';
import 'package:flutter_base_project/domain/usecases/login_use_case.dart';
import 'package:flutter_base_project/shared/extensions/stream_ext.dart';
import 'package:flutter_base_project/ui/base/application_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

@Injectable()
class LoginBloc extends BaseBloc {
  final LoginUseCase _loginUseCase;

  /// Input
  late void Function(String) funcEmailChanged;
  late void Function(String) funcPasswordChanged;
  late VoidCallback funcSubmit;
  late Function(RemoteException) funcOnServerError;

  /// Output
  late Stream<String?> streamError;
  late Stream<bool> streamIsButtonLoginEnable;
  late Stream<User> streamLoginSuccess;

  LoginBloc(this._loginUseCase) {
    final _emailController = BehaviorSubject.seeded("")..disposeBy(disposeBag);
    final _passwordController = BehaviorSubject.seeded("")..disposeBy(disposeBag);
    final _submitController = PublishSubject<void>()..disposeBy(disposeBag);
    final _onServerErrorController = PublishSubject<String?>()..disposeBy(disposeBag);

    funcEmailChanged = _emailController.add;
    funcPasswordChanged = _passwordController.add;
    funcSubmit = () => _submitController.add(null);

    final Stream<String?> validationError = _submitController.stream.map((_) {
      // demo validation
      if (_passwordController.value.length < 8 || _passwordController.value.length > 20) {
        return "Wrong password format!";
      }
      return null;
    });

    streamIsButtonLoginEnable = Rx.combineLatest2(_emailController.stream, _passwordController.stream,
        (String email, String password) => email.isNotEmpty && password.isNotEmpty).share();

    streamError = Rx.merge([
      _onServerErrorController.stream,
      validationError,
      streamIsButtonLoginEnable.mapTo(null),
    ]);

    streamLoginSuccess = validationError.flatMap((String? error) {
      if (error == null) {
        return _login(_emailController.value, _passwordController.value);
      } else {
        return const Stream.empty();
      }
    });
  }

  Stream<User> _login(String email, String password) => executeFuture(
        _loginUseCase.call(LoginInput(email, password)),
      );
}
