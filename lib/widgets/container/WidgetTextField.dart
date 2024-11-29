import 'package:flutter/material.dart';
import 'package:web_lotus/assets/style.dart';

Container WidgetTextField({required TextEditingController controller}) {
  return Container(
    width: 90,
    margin: EdgeInsets.all(5),
    child: TextField(
      controller: controller,
      style: style11_black,
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.all(8),
        isDense: true,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
          Radius.circular(0.0),
        )),
      ),
    ),
  );
}
