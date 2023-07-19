import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:cams/router/route.gr.dart';
import 'package:cams/widgets/buttons.dart';
import 'package:cams/widgets/inputs.dart';
import 'package:cams/widgets/texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:provider/provider.dart';

import '../widgets/dialog.dart';
import '../data/token.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final _usernameController = TextEditingController(text: 'oren-000001');
  final _passwordController = TextEditingController(text: '2#dddd#!');
  final apiProvider = Provider(create: (ref) => SessionManager());
  @override
  void initState() {
    savestorage();
    super.initState();
  }

  void savestorage() async {
    var checking = await const FlutterSecureStorage().read(key: "rememberkey");
    if (checking != null) {
      SessionManager().updatetoken(checking);
      context.router.replaceAll([const Campagerouter()]);
    }
  }

  Future<void> SignIn() async {
    if (_usernameController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty) {
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
          ("http://api.relay.keenetic.pro/api/v1/token/"),
          data: {
            "username": _usernameController.text,
            "password": _passwordController.text,
            HttpHeaders.contentTypeHeader: 'application/json'
          },
        );
        if (response.statusCode == 200) {
          final access_token = response.data!['access'];
          final refresh_token = response.data!['refresh'];
          SessionManager().updatetoken(access_token);
          SessionManager().refreshtoken(refresh_token);
          context.router.replaceAll([Campagerouter()]);
        } else {}
      } catch (e) {
        showErrorLogIn(context);
      }
    } else {
      showErrorNull(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF0e1217),
      child: SafeArea(
        bottom: false,
        child: Scaffold(
          body: Container(
            color: const Color(0xFF0e1217),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const Spacer(
                  flex: 1,
                ),
                mainText(
                  'Авторизация',
                  Colors.white,
                ),
                const Spacer(
                  flex: 4,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: simpleText('Вход', Colors.white),
                ),
                const SizedBox(
                  height: 20,
                ),
                inputCode('Ваш лицевой счёт', false, _usernameController),
                const SizedBox(height: 10),
                inputCode('Пароль', true, _passwordController),
                const Spacer(
                  flex: 4,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: UniversalButton(
                      onPressed: () async {
                        SignIn();
                      },
                      fillColor: const Color(0xFF346dae),
                      label: 'Войти',
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
