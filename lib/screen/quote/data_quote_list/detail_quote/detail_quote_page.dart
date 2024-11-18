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

import 'data_detail_quote/widget/upload_image.dart';

class QuoteDetailsPage extends StatefulWidget {
  const QuoteDetailsPage({super.key});

  @override
  State<QuoteDetailsPage> createState() => _QuoteDetailsPageState();
}

class _QuoteDetailsPageState extends State<QuoteDetailsPage> {
  late DataQuoteDetailSource _dataQuoteDetailSource;
  List<QuoteDetail> _listQuoteDetail = <QuoteDetail>[];
  TextEditingController _controller_cntr = TextEditingController();
  TextEditingController _controller_charge = TextEditingController();
  TextEditingController _controller_component = TextEditingController();
  TextEditingController _controller_category = TextEditingController();
  TextEditingController _controller_error = TextEditingController();
  TextEditingController _controller_location = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.contentColor,
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(10),
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
                    _dataQuoteDetailSource.addColumnGroup(ColumnGroup(name: 'Container', sortGroupRows: true));
                  }
                  return snapshot.hasData
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                WidgetCntr(),
                                WidgetCharge(),
                                WidgetComponent(),
                                WidgetCategory(),
                                WidgetDamage(),
                                WidgetLocation(),
                                ElevatedButton(
                                    onPressed: () {
                                      _dataQuoteDetailSource.applyFilter(
                                          cntr: _controller_cntr.text,
                                          chargeTypeCode:
                                              _controller_charge.text,
                                          componentCode:
                                              _controller_component.text,
                                          categoryCode:
                                              _controller_category.text,
                                          damageCode: _controller_error.text,
                                          location: _controller_location.text);
                                    },
                                    child: const Text('Filter')),
                                const SizedBox(
                                  width: 10,
                                ),
                                ElevatedButton(
                                    onPressed: () {
                                      _controller_cntr.clear();
                                      _controller_charge.clear();
                                      _controller_component.clear();
                                      _controller_category.clear();
                                      _controller_error.clear();
                                      _controller_location.clear();
                                      _dataQuoteDetailSource.clear();
                                    },
                                    child: const Text('Remove Filter')),
                                const SizedBox(
                                  width: 20,
                                ),
                                ElevatedButton(onPressed: (){
                                  SelectFileZip();
                                }, child: Text('Upload Image (.zip)'))
                              ],
                            ),
                            Expanded(
                              child: SfDataGridTheme(
                                  data: SfDataGridThemeData(
                                    headerColor: Colors.grey[200],
                                  ),
                                  child: SfDataGrid(
                                      rowHeight: 30,
                                      headerRowHeight: 40,
                                      allowExpandCollapseGroup: true,
                                      groupCaptionTitleFormat: '{ColumnName} : {Key} - {ItemsCount}',
                                      columnWidthMode: ColumnWidthMode.fill,
                                      selectionMode: SelectionMode.single,
                                      gridLinesVisibility:
                                          GridLinesVisibility.both,
                                      headerGridLinesVisibility:
                                          GridLinesVisibility.both,
                                      source: _dataQuoteDetailSource,
                                      columns: [
                                        GridColumn(
                                            columnName: 'Seq',
                                            label: Container(
                                              padding: const EdgeInsets.all(5),
                                              alignment: Alignment.centerLeft,
                                              child: const Text(
                                                'Seq',
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            )),
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
                                        GridColumn(
                                            columnName: 'Image',
                                            label: Container(
                                              padding: const EdgeInsets.all(5),
                                              alignment: Alignment.centerLeft,
                                              child: const Text(
                                                'Image',
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

  Row WidgetCntr() {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.all(5),
          padding: const EdgeInsets.all(5),
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 92, 117, 160),
          ),
          child: Text(
            'Container No.',
            style: style12_white,
          ),
        ),
        SizedBox(
          width: 100,
          child: TextField(
            controller: _controller_cntr,
            style: const TextStyle(fontSize: 12),
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.all(8),
              isDense: true,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                Radius.circular(0.0),
              )),
            ),
          ),
        )
      ],
    );
  }

  Row WidgetCharge() {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.all(5),
          padding: const EdgeInsets.all(5),
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 92, 117, 160),
          ),
          child: Text(
            'Charge Type',
            style: style12_white,
          ),
        ),
        SizedBox(
          width: 100,
          child: TypeAheadField<ChargeTypeQuotes>(
            animationDuration: const Duration(milliseconds: 0),
            autoFlipDirection: true,
            suggestionsCallback: (search) => quoteController.listCharge
                .where((element) => element.chargeTypeCode!
                    .toLowerCase()
                    .contains(search.toLowerCase()))
                .toList(),
            builder: (context, controller, focusNode) {
              _controller_charge = controller;
              _controller_charge.clear();
              return TextField(
                controller: _controller_charge,
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
                value.chargeTypeCode!,
                style: style12_black,
              ),
            ),
            onSelected: (value) {
              _controller_charge.text = value.chargeTypeCode!;
            },
          ),
        ),
      ],
    );
  }

  Row WidgetComponent() {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.all(5),
          padding: const EdgeInsets.all(5),
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 92, 117, 160),
          ),
          child: Text(
            'Component',
            style: style12_white,
          ),
        ),
        SizedBox(
          width: 100,
          child: TypeAheadField<ComponentQuotes>(
            animationDuration: const Duration(milliseconds: 0),
            autoFlipDirection: true,
            suggestionsCallback: (search) => quoteController.listComponent
                .where((element) => element.componentCode!
                    .toLowerCase()
                    .contains(search.toLowerCase()))
                .toList(),
            builder: (context, controller, focusNode) {
              _controller_component = controller;
              _controller_component.clear();
              return TextField(
                controller: _controller_component,
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
                value.componentCode!,
                style: style12_black,
              ),
            ),
            onSelected: (value) {
              _controller_component.text = value.componentCode!;
            },
          ),
        ),
      ],
    );
  }

  Row WidgetCategory() {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.all(5),
          padding: const EdgeInsets.all(5),
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 92, 117, 160),
          ),
          child: Text(
            'Category',
            style: style12_white,
          ),
        ),
        SizedBox(
          width: 100,
          child: TypeAheadField<CategoryQuotes>(
            animationDuration: const Duration(milliseconds: 0),
            autoFlipDirection: true,
            suggestionsCallback: (search) => quoteController.listCategory
                .where((element) => element.categoryCode!
                    .toUpperCase()
                    .contains(search.toUpperCase()))
                .toList(),
            builder: (context, controller, focusNode) {
              _controller_category = controller;
              _controller_category.clear();
              return TextField(
                controller: _controller_category,
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
                value.categoryCode!,
                style: style12_black,
              ),
            ),
            onSelected: (value) {
              _controller_category.text = value.categoryCode!;
            },
          ),
        ),
      ],
    );
  }

  Row WidgetDamage() {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.all(5),
          padding: const EdgeInsets.all(5),
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 92, 117, 160),
          ),
          child: Text(
            'Damage Code',
            style: style12_white,
          ),
        ),
        SizedBox(
          width: 100,
          child: TypeAheadField<ErrorQuotes>(
            animationDuration: const Duration(milliseconds: 0),
            autoFlipDirection: true,
            suggestionsCallback: (search) => quoteController.listError
                .where((element) => element.errorCode!
                    .toLowerCase()
                    .contains(search.toLowerCase()))
                .toList(),
            builder: (context, controller, focusNode) {
              _controller_error = controller;
              _controller_error.clear();
              return TextField(
                controller: _controller_error,
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
                value.errorCode!,
                style: style12_black,
              ),
            ),
            onSelected: (value) {
              _controller_error.text = value.errorCode!;
            },
          ),
        ),
      ],
    );
  }

  Row WidgetLocation() {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.all(5),
          padding: const EdgeInsets.all(5),
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 92, 117, 160),
          ),
          child: Text(
            'Location',
            style: style12_white,
          ),
        ),
        SizedBox(
          width: 100,
          child: TextField(
            controller: _controller_location,
            style: const TextStyle(fontSize: 12),
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.all(8),
              isDense: true,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                Radius.circular(0.0),
              )),
            ),
          ),
        )
      ],
    );
  }
}

extension on List<FilterCondition> {
  FilterCondition? firstWhereOrNull(bool Function(dynamic item) param0) {}
}
