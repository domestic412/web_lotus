import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<void> LoginAlert(BuildContext context) {
  return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            "Đăng nhập thất bại",
            textAlign: TextAlign.center,
          ),
          content: const Text("Tên đăng nhập hoặc mật khẩu không đúng."),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("OK"))
          ],
        );
      });
}

Future<void> LoginAlertDatabase(BuildContext context) {
  return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            "Đăng nhập thất bại",
            textAlign: TextAlign.center,
          ),
          content: const Text("Lỗi Data."),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("OK"))
          ],
        );
      });
}
