import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

WidgetGridColumn({required String label, required bool visible}) {
  if (visible == null || visible == true) {
    visible = true;
  } else {
    visible = false;
  }
  return GridColumn(
      visible: visible,
      columnName: label,
      label: Container(
          padding: const EdgeInsets.all(5.0),
          alignment: Alignment.centerLeft,
          child: Text(label, overflow: TextOverflow.ellipsis)));
}
