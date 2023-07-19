import 'dart:io';
import 'package:cams/data/token.dart';
import 'package:cams/widgets/dialog.dart';
import 'package:cams/widgets/texts.dart';
import 'package:flutter/material.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:provider/provider.dart';
import '../widgets/buttons.dart';
import '../widgets/inputs.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _verifyPasswordController = TextEditingController();
  final apiProvider = Provider(create: (ref) => SessionManager());

  Future<void> signUp() async {
    if (_usernameController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty &&
        _verifyPasswordController.text.isNotEmpty) {
      SessionManager.api.interceptors.add(PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: true,
          error: true,
          compact: true,
          maxWidth: 90));
      try {
        apiProvider;
        var response = await SessionManager.api.post(
          ("http://api.relay.keenetic.pro/api/v1/register/"),
          data: {
            "username": _usernameController.text,
            "password1": _passwordController.text,
            "password2": _verifyPasswordController.text,
            HttpHeaders.contentTypeHeader: 'application/json'
          },
        );
        if (response.statusCode == 200) {
          showSuccess(context);
        } else {}
      } catch (e) {}
    } else if (_usernameController.text.isEmpty &&
        _passwordController.text.isEmpty &&
        _verifyPasswordController.text.isEmpty) {
      showErrorNull(context);
    } else {
      showErrorLogIn(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF0e1217),
      child: SafeArea(
        bottom: false,
        child: Scaffold(
          backgroundColor: const Color(0xFF0e1217),
          body: Container(
            color: const Color(0xFF0e1217),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const Spacer(
                  flex: 1,
                ),
                mainText(
                  'Регистрация',
                  Colors.white,
                ),
                const Spacer(
                  flex: 4,
                ),
                const SizedBox(
                  height: 20,
                ),
                inputCode('Ваш лицевой счёт', false, _usernameController),
                const SizedBox(height: 10),
                inputCode('Пароль', true, _passwordController),
                const SizedBox(height: 10),
                inputCode('Повторите пароль', true, _verifyPasswordController),
                const Spacer(
                  flex: 4,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: UniversalButton(
                      onPressed: () async {
                        signUp();
                      },
                      fillColor: const Color(0xFF346dae),
                      label: 'Зарегистрироваться',
                      fontColor: Colors.white),
                ),
                const Spacer(
                  flex: 1,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
