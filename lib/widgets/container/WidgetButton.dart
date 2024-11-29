import 'package:flutter/material.dart';

ElevatedButton WidgetButton(
    String text, ButtonStyle style, VoidCallback onPressed) {
  return ElevatedButton(
    style: style,
    onPressed: onPressed,
    child: const Text('Button'),
  );
}
