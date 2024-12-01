import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_popup/flutter_popup.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:web_lotus/assets/color.dart';
import 'package:web_lotus/assets/style.dart';
import 'package:web_lotus/assets/variable.dart';
import 'package:web_lotus/controller/info_signin_controller.dart';
import 'package:web_lotus/controller/init_quote_controller.dart';
import 'package:web_lotus/model/model_init_quote.dart';
import 'package:web_lotus/model/model_quote_detail.dart';
import 'package:web_lotus/screen/eqc/add_quote_new/add_edit_quote.dart';
import 'package:web_lotus/screen/eqc/list_eqc/data_detail_quote/data_listEQC_gridview.dart';
import 'package:web_lotus/widgets/appbar/appbar_fake.dart';
import 'package:web_lotus/widgets/container/ContainerLabel.dart';
import 'package:web_lotus/widgets/container/WidgetGridColumn.dart';
import 'package:web_lotus/widgets/container/WidgetTextField.dart';
import 'package:web_lotus/widgets/container/combobox.dart';

class ListEQCPage extends StatefulWidget {
  const ListEQCPage({super.key});

  @override
  State<ListEQCPage> createState() => _ListEQCPageState();
}

class _ListEQCPageState extends State<ListEQCPage> {
  final DataGridController _dataGridController = DataGridController();
  late DataListEQCSource _dataListEQCSource;
  List<ListEQC> _listEQC = <ListEQC>[];

  TextEditingController _controller_cntr = TextEditingController();
  TextEditingController _controller_charge = TextEditingController();
  TextEditingController _controller_component = TextEditingController();
  TextEditingController _controller_category = TextEditingController();
  TextEditingController _controller_error = TextEditingController();
  TextEditingController _controller_location = TextEditingController();

  @override
  void initState() {
    super.initState();
    quoteController.fromDate_send.value =
        changeDatetoSend(date: DateTime.now().subtract(Duration(days: 30)));
    quoteController.fromDate_text.value =
        changeDatetoShow(date: DateTime.now().subtract(Duration(days: 30)));

    quoteController.toDate_send.value =
        changeDatetoSend(date: DateTime.now().add(Duration(days: 1)));
    quoteController.toDate_text.value =
        changeDatetoShow(date: DateTime.now().add(Duration(days: 1)));
  }

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
            'Management EQC',
            style: style20_blue,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(5.0),
                child: Row(
                  children: [
                    Text('From Date'),
                    CustomPopup(
                      showArrow: false,
                      content: SizedBox(
                        height: 270,
                        width: 270,
                        child: CalendarDatePicker(
                          initialDate: dateFormat
                              .parse(quoteController.fromDate_text.value),
                          firstDate: DateTime(2024),
                          lastDate: DateTime(2123),
                          onDateChanged: (value) {
                            quoteController.fromDate_text.value =
                                DateFormat('dd/MM/yyyy').format(value);
                            quoteController.fromDate_send.value =
                                DateFormat('MM/dd/yyyy').format(value);
                            setState(() {
                              Navigator.pop(context);
                            });
                          },
                        ),
                      ),
                      child: Container(
                        decoration:
                            BoxDecoration(border: Border.all(color: grey)),
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        child: Text(
                          quoteController.fromDate_text.value,
                          style: style11_black,
                        ),
                      ),
                    ),
                    Text('To Date'),
                    SizedBox(
                      child: CustomPopup(
                        showArrow: false,
                        contentPadding: EdgeInsets.all(0),
                        content: SizedBox(
                          height: 270,
                          width: 270,
                          child: CalendarDatePicker(
                            initialDate: dateFormat
                                .parse(quoteController.toDate_text.value),
                            firstDate: DateTime(2024),
                            lastDate: DateTime(2123),
                            onDateChanged: (value) {
                              quoteController.toDate_text.value =
                                  DateFormat('dd/MM/yyyy').format(value);
                              quoteController.toDate_send.value =
                                  DateFormat('MM/dd/yyyy').format(value);
                              setState(() {
                                Navigator.pop(context);
                              });
                            },
                          ),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: grey),
                          ),
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          child: Text(
                            quoteController.toDate_text.value,
                            style: style11_black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Container(
              //   margin: EdgeInsets.symmetric(
              //       vertical: 16, horizontal: 10),
              //   child: Container(
              //     constraints:
              //         BoxConstraints(minWidth: 500, maxWidth: 750),
              //     decoration: BoxDecoration(
              //         border: Border.all(color: Colors.grey)),
              //     child: TextField(
              //       controller: _search_quote,
              //       decoration: InputDecoration(
              //           hintText: 'Search',
              //           border: InputBorder.none,
              //           isDense: true,
              //           contentPadding: EdgeInsets.all(7)),
              //       onChanged: (value) {
              //         // _filterQuote();
              //       },
              //     ),
              //   ),
              // ),
              ElevatedButton(
                onPressed: () {
                  quoteController.listInputQuoteDetail.value = [];
                  quoteController.listInputQuoteDetail_show.value = [];
                  InitEQCQuote().fetchInitQuote(eqcQuoteId_new);
                  Get.to(() => AEQuotePage());
                },
                style: ButtonStyle(
                    backgroundColor:
                        WidgetStatePropertyAll<Color>(Colors.orange),
                    minimumSize: WidgetStateProperty.all(Size(100, 40))),
                child: Text('Add Quote'),
              ),
            ],
          ),
          Expanded(
            child: FutureBuilder(
                future: ListEQC().fetchListEQC(
                    fromDate: quoteController.fromDate_send.value,
                    toDate: quoteController.toDate_send.value,
                    userId: inforUserController.userId.value),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    _listEQC = snapshot.data;
                    _dataListEQCSource = DataListEQCSource(_listEQC);
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
                                      _dataListEQCSource.applyFilter(
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
                                      _dataListEQCSource.clear();
                                    },
                                    child: const Text('Remove Filter')),
                                const SizedBox(
                                  width: 20,
                                ),
                                ElevatedButton(
                                    onPressed: () {
                                      // SelectFileZip(refresh);
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
                                      source: _dataListEQCSource,
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
                                          label: 'Container',
                                          visible: true,
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
                                          label: 'Tariff Price',
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
                                          label: 'Request',
                                          visible: true,
                                        ),
                                        WidgetGridColumn(
                                          label: 'Approval',
                                          visible: true,
                                        ),
                                        WidgetGridColumn(
                                          label: 'Complete',
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
