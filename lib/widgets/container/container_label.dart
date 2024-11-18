import 'package:flutter/material.dart';
import 'package:web_lotus/assets/style.dart';

ContainerLabel({required String label}) {
  return Container(
    width: 100,
    padding: EdgeInsets.all(5),
    margin: EdgeInsets.all(5),
    color: Color.fromARGB(255, 92, 117, 160),
    child: Text(
      label,
      style: style12_white,
    ),
  );
}
