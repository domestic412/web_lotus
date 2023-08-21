import 'dart:js_util';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:web_lotus/assets/style.dart';

class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample({super.key});

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

String selectedValue = 'bk';

class _DropdownButtonExampleState extends State<DropdownButtonExample> {

  @override
  Widget build(BuildContext context) {
    return
    DropdownButtonHideUnderline(
        child: DropdownButton2<String>(
          style: style13_black,
          items: const [
            DropdownMenuItem(value: 'bk',child: Text('BL No. or Booking No.'),),
            DropdownMenuItem(value: 'cntr',child: Text('Container No.'),),
          ],
          value: selectedValue,
          onChanged: (String? value) {
            setState(() {
              selectedValue = value!;
            });
          },
          buttonStyleData: ButtonStyleData(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(5)
            ),
            height: 40,
          ),
          menuItemStyleData: const MenuItemStyleData(
            height: 40,
          ),
        ));
  }
}