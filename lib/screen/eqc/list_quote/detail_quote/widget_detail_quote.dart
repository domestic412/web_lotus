import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:web_lotus/controller/init_quote_controller.dart';
import 'package:web_lotus/model/model_quote_detail.dart';
import 'package:web_lotus/widgets/container/WidgetGridColumn.dart';

import 'data_details_cntr_gridview.dart';

class DetailQuote extends StatelessWidget {
  // final DataGridController _dataGridController = DataGridController();
  late DataQuoteDetailSource _dataQuoteDetailSource;
  List<QuoteDetail> _listQuoteDetail = <QuoteDetail>[];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: quoteController.eqcQuoteId.value == ''
          ? SizedBox.shrink()
          : FutureBuilder<List<QuoteDetail>>(
              future: QuoteDetail()
                  .fetchQuoteDetail(quoteId: quoteController.eqcQuoteId.value),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  _listQuoteDetail = snapshot.data;
                  _dataQuoteDetailSource =
                      DataQuoteDetailSource(_listQuoteDetail);
                }
                return snapshot.hasData
                    ? SfDataGridTheme(
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
                            source: _dataQuoteDetailSource,
                            columns: [
                              WidgetGridColumn(
                                label: 'Seq.',
                                visible: true,
                              ),
                              WidgetGridColumn(
                                label: 'Charge Type',
                                visible: true,
                              ),
                              WidgetGridColumn(
                                label: 'Component',
                                visible: true,
                              ),
                              WidgetGridColumn(
                                label: 'Category',
                                visible: true,
                              ),
                              WidgetGridColumn(
                                label: 'Damage Code',
                                visible: true,
                              ),
                              WidgetGridColumn(
                                label: 'Container',
                                visible: true,
                              ),
                              WidgetGridColumn(
                                label: 'Damege Detail',
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
                                label: 'Estimate Date',
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
                                label: 'Tariff Price',
                                visible: true,
                              ),
                              WidgetGridColumn(
                                label: 'Image',
                                visible: true,
                              ),
                            ]))
                    : const Center(child: CircularProgressIndicator());
              }),
    );
  }
}
