import 'package:auto_route/auto_route.dart';
import 'package:cams/router/route.gr.dart';
import 'package:cams/widgets/buttons.dart';
import 'package:cams/widgets/texts.dart';
import 'package:flutter/material.dart';

class EnterPage extends StatefulWidget {
  const EnterPage({super.key});

  @override
  State<EnterPage> createState() => _EnterPageState();
}

class _EnterPageState extends State<EnterPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF0e1217),
      child: SafeArea(
        bottom: false,
        child: Scaffold(
          backgroundColor: const Color(0xFF0e1217),
          body: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Spacer(
                  flex: 1,
                ),
                mainText('Добро пожаловать в ДомOffOn!', Colors.white),
                const Spacer(
                  flex: 8,
                ),
                UniversalButton(
                  fillColor: const Color(0xFF346dae),
                  label: 'Авторизация',
                  fontColor: Colors.white,
                  onPressed: () =>
                      context.router.navigate(const AuthPageRoute()),
                ),
                UniversalButton(
                  fillColor: Colors.white,
                  label: 'Регистрация',
                  fontColor: const Color(0xFF346dae),
                  onPressed: () =>
                      context.router.navigate(const RegistrationPageRoute()),
                ),
                const Spacer(
                  flex: 1,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
