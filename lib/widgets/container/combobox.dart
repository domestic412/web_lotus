import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:web_lotus/assets/style.dart';

Combobox(
    {required TextEditingController controllerCombobox,
    required List list,
    required String valueName,
    required String valueId,
    required String valueSend}) {
  return Container(
    width: 100,
    margin: const EdgeInsets.all(5),
    child: TypeAheadField<dynamic>(
      animationDuration: const Duration(milliseconds: 0),
      autoFlipDirection: true,
      suggestionsCallback: (search) => list
          .where((element) => element[valueName]
              .toString()
              .toLowerCase()
              .contains(search.toLowerCase()))
          .toList(),
      builder: (context, controller, focusNode) {
        controllerCombobox = controller;
        controllerCombobox.clear();
        return TextField(
          controller: controllerCombobox,
          focusNode: focusNode,
          style: const TextStyle(fontSize: 12),
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.all(8),
            isDense: true,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
              Radius.circular(0.0),
            )),
          ),
        );
      },
      itemBuilder: (context, value) => ListTile(
        dense: true,
        title: Text(
          value[valueName]!,
          style: style12_black,
        ),
      ),
      onSelected: (value) {
        controllerCombobox.text = value[valueName]!;
        valueSend = value[valueId]!;
        print(valueSend);
      },
    ),
  );
}
