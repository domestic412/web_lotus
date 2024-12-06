import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:web_lotus/controller/init_quote_controller.dart';
import 'package:web_lotus/widgets/container/WidgetGridColumn.dart';
import 'data_input_quote_gridview.dart';

class TableInputQuote extends StatefulWidget {
  const TableInputQuote({super.key});

  @override
  State<TableInputQuote> createState() => _TableInputQuoteState();
}

class _TableInputQuoteState extends State<TableInputQuote> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => SfDataGridTheme(
          data: SfDataGridThemeData(headerColor: Colors.grey[200]),
          child: SfDataGrid(
              rowHeight: 30,
              headerRowHeight: 40,
              columnWidthMode: ColumnWidthMode.fill,
              selectionMode: SelectionMode.single,
              gridLinesVisibility: GridLinesVisibility.both,
              headerGridLinesVisibility: GridLinesVisibility.both,
              source: DataInputQuoteGridview(
                  quoteController.listInputQuoteDetail_show),
              columns: [
                WidgetGridColumn(label: 'Seq.', visible: true),
                WidgetGridColumn(label: 'eqcQuoteId', visible: false),
                WidgetGridColumn(label: 'Charge Type', visible: true),
                WidgetGridColumn(label: 'Container', visible: true),
                WidgetGridColumn(label: 'Gate In Date', visible: true),
                WidgetGridColumn(label: 'Component', visible: true),
                WidgetGridColumn(label: 'Damege Detail', visible: true),
                WidgetGridColumn(label: 'Damage Code', visible: true),
                WidgetGridColumn(label: 'Quantity', visible: true),
                WidgetGridColumn(label: 'Dimension', visible: true),
                WidgetGridColumn(label: 'Length', visible: true),
                WidgetGridColumn(label: 'Width', visible: true),
                WidgetGridColumn(label: 'Location', visible: true),
                WidgetGridColumn(label: 'Category', visible: true),
                WidgetGridColumn(label: 'Labor Cost', visible: true),
                WidgetGridColumn(label: 'Mr Cost', visible: true),
                WidgetGridColumn(label: 'Total Cost', visible: true),
                WidgetGridColumn(label: 'Image', visible: true),
                WidgetGridColumn(label: 'R', visible: true),
              ]),
        ));
  }
}
