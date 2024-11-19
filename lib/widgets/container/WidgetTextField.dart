import 'package:flutter/material.dart';

Container WidgetTextField({required TextEditingController controller}) {
  return Container(
    width: 100,
    margin: EdgeInsets.all(5),
    child: TextField(
      controller: controller,
      style: TextStyle(fontSize: 12),
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
