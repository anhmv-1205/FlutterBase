import 'package:flutter/material.dart';
import 'package:flutter_base_project/shared/color_constants.dart';
import 'package:flutter_base_project/shared/extensions/stream_ext.dart';
import 'package:flutter_base_project/ui/base/base_state.dart';
import 'package:flutter_base_project/ui/components/rounded_button.dart';
import 'package:flutter_base_project/ui/components/rounded_input_field.dart';
import 'package:flutter_base_project/ui/pages/login/login_bloc.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends BaseState<LoginPage, LoginBloc> {
  @override
  void initState() {
    super.initState();
    bloc.streamLoginSuccess.listen((event) {
      print(event.name + "login successfully");
    }).disposeBy(disposeBag);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ChangeNotifierProvider(
      create: (_) => bloc,
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StreamBuilder<String?>(
                  stream: bloc.streamError,
                  builder: (context, snapshot) {
                    return snapshot.data != null
                        ? Text(snapshot.data!, style: const TextStyle(color: Colors.red))
                        : const SizedBox();
                  }),
              RoundedInputField(
                hintText: "Email",
                icon: const Icon(
                  Icons.email,
                  color: kPrimaryColor,
                ),
                onChanged: bloc.funcEmailChanged,
              ),
              RoundedInputField(
                hintText: "Password",
                isPassword: true,
                icon: const Icon(
                  Icons.lock,
                  color: kPrimaryColor,
                ),
                onChanged: bloc.funcPasswordChanged,
              ),
              StreamBuilder<bool?>(
                  stream: bloc.streamIsButtonLoginEnable,
                  builder: (context, snapshot) {
                    return RoundedButton(
                      press: () {
                        hideKeyboard();
                        bloc.funcSubmit();
                      },
                      title: "LOGIN",
                      enable: snapshot.data ?? false,
                    );
                  }),
              SizedBox(height: size.height * 0.03),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an Account?",
                    style: TextStyle(color: kPrimaryColor),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      "Sign up",
                      style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
