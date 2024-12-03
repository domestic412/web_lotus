import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:web_lotus/controller/init_quote_controller.dart';
import 'package:web_lotus/widgets/container/WidgetGridColumn.dart';

import 'data_details_cntr_gridview.dart';

class DetailRepair extends StatelessWidget {
  const DetailRepair({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Expanded(
        child: SfDataGridTheme(
            data: SfDataGridThemeData(
              headerColor: Colors.grey[200],
            ),
            child: SfDataGrid(
                rowHeight: 30,
                headerRowHeight: 40,
                isScrollbarAlwaysShown: true,
                columnWidthMode: ColumnWidthMode.fill,
                selectionMode: SelectionMode.single,
                gridLinesVisibility: GridLinesVisibility.both,
                headerGridLinesVisibility: GridLinesVisibility.both,
                source: DataDetailsEQCSource(quoteController.listDetails),
                columns: [
                  WidgetGridColumn(
                    label: 'Seq.',
                    visible: true,
                  ),
                  WidgetGridColumn(
                    label: 'Charge',
                    visible: true,
                  ),
                  WidgetGridColumn(
                    label: 'Container',
                    visible: true,
                  ),
                  WidgetGridColumn(
                    label: 'inGateDate',
                    visible: false,
                  ),
                  WidgetGridColumn(
                    label: 'Component',
                    visible: true,
                  ),
                  WidgetGridColumn(
                    label: 'Damage Code',
                    visible: true,
                  ),
                  WidgetGridColumn(
                    label: 'Damege Detail',
                    visible: true,
                  ),
                  WidgetGridColumn(
                    label: 'Category',
                    visible: true,
                  ),
                  WidgetGridColumn(
                    label: 'Quantity',
                    visible: true,
                  ),
                  WidgetGridColumn(
                    label: 'Dimension',
                    visible: true,
                  ),
                  WidgetGridColumn(
                    label: 'Length',
                    visible: true,
                  ),
                  WidgetGridColumn(
                    label: 'Width',
                    visible: true,
                  ),
                  WidgetGridColumn(
                    label: 'Location',
                    visible: true,
                  ),
                  WidgetGridColumn(
                    label: 'Labor Cost',
                    visible: true,
                  ),
                  WidgetGridColumn(
                    label: 'Mr Cost',
                    visible: true,
                  ),
                  WidgetGridColumn(
                    label: 'Total Cost',
                    visible: true,
                  ),
                  WidgetGridColumn(
                    label: 'Tariff',
                    visible: true,
                  ),
                  WidgetGridColumn(
                    label: 'Payer',
                    visible: true,
                  ),
                  WidgetGridColumn(
                    label: 'Status',
                    visible: true,
                  ),
                  WidgetGridColumn(
                    label: 'Image',
                    visible: true,
                  ),
                ])),
      ),
    );
  }
}
