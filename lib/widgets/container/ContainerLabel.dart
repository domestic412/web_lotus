import 'package:flutter/material.dart';
import 'package:web_lotus/assets/style.dart';

Container WidgetContainerLabel({required String label}) {
  return Container(
    width: 100,
    padding: const EdgeInsets.all(5),
    margin: const EdgeInsets.all(5),
    color: const Color.fromARGB(255, 92, 117, 160),
    child: Text(
      label,
      style: style12_white,
    ),
  );
}
