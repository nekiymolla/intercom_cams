import 'package:auto_route/auto_route.dart';
import 'package:cams/router/route.gr.dart';
import 'package:flutter/material.dart';

//Error dialog

void showErrorLogIn(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: const Color(0xFF346dae),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        title: const Text("Ошибка!"),
        content: const Text("Неверная почта или пароль"),
        actions: <Widget>[
          TextButton(
            child: const Text("OK",
                style: TextStyle(
                  color: Colors.white,
                )),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

void showErrorNull(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        backgroundColor: const Color(0xFF346dae),
        title: const Text("Ошибка!"),
        content: const Text("Введите лицевой счёт и пароль"),
        actions: <Widget>[
          TextButton(
            child: const Text(
              "OK",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

//Success dialog

void showSuccess(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: const Color(0xFF346dae),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        title: const Text("Отлично"),
        content: const Text("Аккаунт успешно создан!"),
        actions: <Widget>[
          TextButton(
            child: const Text(
              "OK",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onPressed: () {
              context.router.replaceAll([const Campagerouter()]);
            },
          ),
        ],
      );
    },
  );
}

void showSuccessOpenDoor(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: const Color(0xFF346dae),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        title: const Text("Открыто!"),
        content: const Text("Дверь открыта!"),
        actions: <Widget>[
          TextButton(
            child: const Text(
              "OK",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onPressed: () {
              context.router.pop();
            },
          ),
        ],
      );
    },
  );
}

showLoadingDialog(BuildContext context) => showDialog(
    context: context,
    barrierDismissible: false,
    barrierColor: Colors.white.withOpacity(0),
    builder: (BuildContext context) {
      return AlertDialog(
          elevation: 0,
          backgroundColor: Colors.transparent,
          content: Center(
            child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(8),
                child: const CircularProgressIndicator(
                  color: Colors.black,
                )),
          ));
    });
