import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:web_lotus/assets/color.dart';
import 'package:web_lotus/assets/style.dart';
import 'package:web_lotus/controller/init_quote_controller.dart';
import 'package:web_lotus/model/model_init_quote.dart';
import 'package:web_lotus/model/model_quote_detail.dart';
import 'package:web_lotus/screen/quote/data_quote_list/detail_quote/data_detail_quote/data_detail_quote_gridview.dart';
import 'package:web_lotus/widgets/appbar/appbar_fake.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class QuoteDetailsPage extends StatefulWidget {
  const QuoteDetailsPage({super.key});

  @override
  State<QuoteDetailsPage> createState() => _QuoteDetailsPageState();
}

class _QuoteDetailsPageState extends State<QuoteDetailsPage> {
  late DataQuoteDetailSource _dataQuoteDetailSource;
  List<QuoteDetail> _listQuoteDetail = <QuoteDetail>[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: WidgetAppBar(),
      backgroundColor: MyColor.contentColor,
      // bottomSheet: Footer(),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          AppbarWidget(),
          Text(
            'Quote Details',
            style: style20_blue,
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: FutureBuilder(
                future: QuoteDetail()
                    .fetchQuoteDetails(quoteController.eqcQuoteId.value),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    _listQuoteDetail = snapshot.data;
                    _dataQuoteDetailSource =
                        DataQuoteDetailSource(_listQuoteDetail);
                  }
                  return snapshot.hasData
                      ? Column(
                          children: [
                            TypeAheadField<ComponentQuotes>(
              animationDuration: Duration(milliseconds: 0),
              autoFlipDirection: true,
              autoFlipMinHeight: 400,
              suggestionsCallback: (search) => getSalaryData()
                  .where((element) => element.name!
                      .toLowerCase()
                      .contains(search.toLowerCase()))
                  .toList(),
              builder: (context, controller, focusNode) {
                _controller = controller;
                _controller.clear();
                return TextField(
                  controller: _controller,
                  focusNode: focusNode,
                  autofocus: true,
                );
              },
              itemBuilder: (context, value) => ListTile(
                title: Text(value.name!),
              ),
              onSelected: (value) {
                newCellValue = value.id;
                _controller.text = value.name!;
              },
            )
                            MaterialButton(
                                child: Text('Add Filter'),
                                onPressed: () {
                                  _dataQuoteDetailSource.addFilter(
                                      'Component',
                                      const FilterCondition(
                                          filterBehavior:
                                              FilterBehavior.stringDataType,
                                          type: FilterType.equals,
                                          value: 'FPP'));
                                }),
                            Expanded(
                              child: SfDataGridTheme(
                                  data: SfDataGridThemeData(
                                    headerColor: Colors.grey[200],
                                  ),
                                  child: SfDataGrid(
                                      rowHeight: 30,
                                      headerRowHeight: 40,
                                      columnWidthMode: ColumnWidthMode.fill,
                                      selectionMode: SelectionMode.single,
                                      gridLinesVisibility:
                                          GridLinesVisibility.both,
                                      headerGridLinesVisibility:
                                          GridLinesVisibility.both,
                                      source: _dataQuoteDetailSource,
                                      columns: [
                                        GridColumn(
                                            columnName: 'Container',
                                            label: Container(
                                              padding: const EdgeInsets.all(5),
                                              alignment: Alignment.centerLeft,
                                              child: const Text(
                                                'Container',
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            )),
                                        GridColumn(
                                            columnName: 'Charge Type',
                                            label: Container(
                                              padding: const EdgeInsets.all(5),
                                              alignment: Alignment.centerLeft,
                                              child: const Text(
                                                'Charge Type',
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            )),
                                        GridColumn(
                                            columnName: 'Component',
                                            label: Container(
                                              padding: const EdgeInsets.all(5),
                                              alignment: Alignment.centerLeft,
                                              child: const Text(
                                                'Component',
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            )),
                                        GridColumn(
                                            columnName: 'Category',
                                            label: Container(
                                              padding: const EdgeInsets.all(5),
                                              alignment: Alignment.centerLeft,
                                              child: const Text(
                                                'Category',
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            )),
                                        GridColumn(
                                            columnName: 'Damage Code',
                                            label: Container(
                                              padding: const EdgeInsets.all(5),
                                              alignment: Alignment.centerLeft,
                                              child: const Text(
                                                'Damage Code',
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            )),
                                        GridColumn(
                                            columnName: 'Damage Detail',
                                            label: Container(
                                              padding: const EdgeInsets.all(5),
                                              alignment: Alignment.centerLeft,
                                              child: const Text(
                                                'Damage Detail',
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            )),
                                        GridColumn(
                                            columnName: 'Quantity',
                                            label: Container(
                                              padding: const EdgeInsets.all(5),
                                              alignment: Alignment.centerLeft,
                                              child: const Text(
                                                'Quantity',
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            )),
                                        GridColumn(
                                            columnName: 'Demension',
                                            label: Container(
                                              padding: const EdgeInsets.all(5),
                                              alignment: Alignment.centerLeft,
                                              child: const Text(
                                                'Demension',
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            )),
                                        GridColumn(
                                            columnName: 'Length',
                                            label: Container(
                                              padding: const EdgeInsets.all(5),
                                              alignment: Alignment.centerLeft,
                                              child: const Text(
                                                'Length',
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            )),
                                        GridColumn(
                                            columnName: 'Width',
                                            label: Container(
                                              padding: const EdgeInsets.all(5),
                                              alignment: Alignment.centerLeft,
                                              child: const Text(
                                                'Width',
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            )),
                                        GridColumn(
                                            columnName: 'Location',
                                            label: Container(
                                              padding: const EdgeInsets.all(5),
                                              alignment: Alignment.centerLeft,
                                              child: const Text(
                                                'Location',
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            )),
                                        GridColumn(
                                            columnName: 'Labor Cost',
                                            label: Container(
                                              padding: const EdgeInsets.all(5),
                                              alignment: Alignment.centerLeft,
                                              child: const Text(
                                                'Labor Cost',
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            )),
                                        GridColumn(
                                            columnName: 'Mr Cost',
                                            label: Container(
                                              padding: const EdgeInsets.all(5),
                                              alignment: Alignment.centerLeft,
                                              child: const Text(
                                                'Mr Cost',
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            )),
                                        GridColumn(
                                            columnName: 'Total Cost',
                                            label: Container(
                                              padding: const EdgeInsets.all(5),
                                              alignment: Alignment.centerLeft,
                                              child: const Text(
                                                'Total Cost',
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            )),
                                        GridColumn(
                                            columnName: 'Estimate Date',
                                            label: Container(
                                              padding: const EdgeInsets.all(5),
                                              alignment: Alignment.centerLeft,
                                              child: const Text(
                                                'Estimate Date',
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            )),
                                        GridColumn(
                                            columnName: 'Payer',
                                            label: Container(
                                              padding: const EdgeInsets.all(5),
                                              alignment: Alignment.centerLeft,
                                              child: const Text(
                                                'Payer',
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            )),
                                        GridColumn(
                                            columnName: 'Approve Code',
                                            label: Container(
                                              padding: const EdgeInsets.all(5),
                                              alignment: Alignment.centerLeft,
                                              child: const Text(
                                                'Approve Code',
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            )),
                                      ])),
                            ),
                          ],
                        )
                      : const Center(child: CircularProgressIndicator());
                }),
          )
        ]),
      ),
    );
  }
}

extension on List<FilterCondition> {
  FilterCondition? firstWhereOrNull(bool Function(dynamic item) param0) {}
}
