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
import 'package:web_lotus/widgets/container/ContainerLabel.dart';
import 'package:web_lotus/widgets/container/WidgetGridColumn.dart';
import 'package:web_lotus/widgets/container/WidgetTextField.dart';
import 'package:web_lotus/widgets/container/combobox.dart';

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
                  }
                  return snapshot.hasData
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                WidgetCntr(controller: _controller_cntr),
                                WidgetCharge(controller: _controller_charge),
                                WidgetComponent(
                                    controller: _controller_component),
                                WidgetCategory(
                                    controller: _controller_category),
                                WidgetDamage(controller: _controller_error),
                                WidgetLocation(
                                    controller: _controller_location),
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
                                ElevatedButton(
                                    onPressed: () {
                                      // SelectFileZip();
                                    },
                                    child: Text('Upload Image (.zip)'))
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
                                      isScrollbarAlwaysShown: true,
                                      columnWidthMode: ColumnWidthMode.fill,
                                      selectionMode: SelectionMode.single,
                                      gridLinesVisibility:
                                          GridLinesVisibility.both,
                                      headerGridLinesVisibility:
                                          GridLinesVisibility.both,
                                      source: _dataQuoteDetailSource,
                                      columns: [
                                        WidgetGridColumn(
                                          label: 'Seq',
                                          visible: true,
                                        ),
                                        WidgetGridColumn(
                                          label: 'Charge Type',
                                          visible: true,
                                        ),
                                        WidgetGridColumn(
                                          label: 'Container',
                                          visible: true,
                                        ),
                                        WidgetGridColumn(
                                          label: 'Estimate Date',
                                          visible: false,
                                        ),
                                        WidgetGridColumn(
                                          label: 'Component',
                                          visible: true,
                                        ),
                                        WidgetGridColumn(
                                          label: 'Damage Detail',
                                          visible: true,
                                        ),
                                        WidgetGridColumn(
                                          label: 'Damage Code',
                                          visible: true,
                                        ),
                                        WidgetGridColumn(
                                          label: 'Quantity',
                                          visible: true,
                                        ),
                                        WidgetGridColumn(
                                          label: 'Demension',
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
                                          label: 'Category',
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
                                          label: 'Payer',
                                          visible: true,
                                        ),
                                        WidgetGridColumn(
                                          label: 'Approve Code',
                                          visible: true,
                                        ),
                                        WidgetGridColumn(
                                          label: 'Image',
                                          visible: true,
                                        ),
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

  Row WidgetCntr({required TextEditingController controller}) {
    return Row(
      children: [
        WidgetContainerLabel(label: 'Container No.'),
        WidgetTextField(controller: controller),
      ],
    );
  }

  Row WidgetCharge({required TextEditingController controller}) {
    return Row(
      children: [
        WidgetContainerLabel(label: 'Charge Type'),
        Combobox<ChargeTypeQuotes>(
          controllerCombobox: controller,
          list: quoteController.listCharge,
          valueName: (element) => element.chargeTypeCode!,
          onChanged: (p0) {},
        ),
      ],
    );
  }

  Row WidgetComponent({required TextEditingController controller}) {
    return Row(
      children: [
        WidgetContainerLabel(label: 'Component'),
        Combobox<ComponentQuotes>(
          controllerCombobox: controller,
          list: quoteController.listComponent,
          valueName: (element) => element.componentCode!,
          onChanged: (p0) {},
        ),
      ],
    );
  }

  Row WidgetCategory({required TextEditingController controller}) {
    return Row(
      children: [
        WidgetContainerLabel(label: 'Category'),
        Combobox<CategoryQuotes>(
          controllerCombobox: controller,
          list: quoteController.listCategory,
          valueName: (element) => element.categoryCode!,
          onChanged: (p0) {},
        ),
      ],
    );
  }

  Row WidgetDamage({required TextEditingController controller}) {
    return Row(
      children: [
        WidgetContainerLabel(label: 'Damage Code'),
        Combobox<ErrorQuotes>(
          controllerCombobox: controller,
          list: quoteController.listError,
          valueName: (element) => element.errorCode!,
          onChanged: (p0) {},
        ),
      ],
    );
  }

  Row WidgetLocation({required TextEditingController controller}) {
    return Row(
      children: [
        WidgetContainerLabel(label: 'Location'),
        WidgetTextField(controller: controller),
      ],
    );
  }
}
