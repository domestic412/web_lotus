import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:web_lotus/assets/style.dart';

Combobox<T>({
  required TextEditingController controllerCombobox,
  required List<T> list,
  // required String valueName,
  // required String valueId,
  // required String valueSend,
  required String Function(T) valueName,
  required String Function(T) valueId,
  required String valueSend,
}) {
  return Container(
    width: 100,
    margin: const EdgeInsets.all(5),
    child: TypeAheadField<T>(
      animationDuration: const Duration(milliseconds: 0),
      autoFlipDirection: true,
      suggestionsCallback: (search) => list
          .where((element) =>
              valueName(element).toLowerCase().contains(search.toLowerCase()))
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
          valueName(value),
          // value.valueName!,
          style: style12_black,
        ),
      ),
      onSelected: (value) {
        controllerCombobox.text = valueName(value); //  value.valueName!;
        valueSend = valueId(value); // value.valueId!;
      },
    ),
  );
}
