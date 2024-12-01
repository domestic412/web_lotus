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
import 'package:web_lotus/model/model_listEQC.dart';
import 'package:web_lotus/screen/eqc/add_quote_new/add_edit_quote.dart';
import 'package:web_lotus/screen/eqc/add_quote_new/widget/add_info_detail_quote/widget/widget_component.dart';
import 'package:web_lotus/screen/eqc/list_eqc/data_listEQC_gridview.dart';
import 'package:web_lotus/widgets/appbar/appbar_fake.dart';
import 'package:web_lotus/widgets/container/ContainerLabel.dart';
import 'package:web_lotus/widgets/container/WidgetGridColumn.dart';
import 'package:web_lotus/widgets/container/WidgetTextField.dart';
import 'package:web_lotus/widgets/container/combobox.dart';

import 'detail_eqc/data_details_cntr_gridview.dart';
import 'detail_eqc/widget_detail_eqc.dart';

class ListEQCPage extends StatefulWidget {
  const ListEQCPage({super.key});

  @override
  State<ListEQCPage> createState() => _ListEQCPageState();
}

class _ListEQCPageState extends State<ListEQCPage> {
  final DataGridController _dataGridController = DataGridController();
  late DataListEQCSource _dataListEQCSource;
  List<ListEQC123> _listEQC = <ListEQC123>[];

  TextEditingController _controller_depo = TextEditingController();
  TextEditingController _controller_cntr = TextEditingController();
  TextEditingController _controller_size = TextEditingController();
  TextEditingController _controller_quoteCcy = TextEditingController();
  TextEditingController _controller_approveCode = TextEditingController();
  TextEditingController _controller_quoteNo = TextEditingController();
  // search details
  TextEditingController _controller_charge = TextEditingController();
  TextEditingController _controller_component = TextEditingController();
  TextEditingController _controller_damageCode = TextEditingController();
  TextEditingController _controller_damageDetail = TextEditingController();
  TextEditingController _controller_category = TextEditingController();
  TextEditingController _controller_location = TextEditingController();
  TextEditingController _controller_payer = TextEditingController();

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

    quoteController.listDetails.value = [];
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
            child: FutureBuilder<List<ListEQC123>>(
                future: ListEQC123().fetchListEQC(
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
                                WidgetDepo(controller: _controller_depo),
                                WidgetCntr(controller: _controller_cntr),
                                WidgetSize(controller: _controller_size),
                                WidgetCurrency(
                                    controller: _controller_quoteCcy),
                                // WidgetStatus(
                                //     controller: _controller_approveCode),
                                WidgetQuoteNo(controller: _controller_quoteNo),
                                ElevatedButton(
                                    onPressed: () {
                                      _dataListEQCSource.applyFilter(
                                        depot: _controller_depo.text,
                                        cntr: _controller_cntr.text,
                                        size: _controller_size.text,
                                        quoteCcy: _controller_quoteCcy.text,
                                        approveCode:
                                            _controller_approveCode.text,
                                        quoteNo: _controller_quoteNo.text,
                                        //details
                                        charge: _controller_charge.text,
                                        component: _controller_component.text,
                                        damageCode: _controller_damageCode.text,
                                        damageDetail:
                                            _controller_damageDetail.text,
                                        category: _controller_category.text,
                                        location: _controller_location.text,
                                        payer: _controller_payer.text,
                                      );
                                    },
                                    child: const Text('Filter')),
                                const SizedBox(
                                  width: 10,
                                ),
                                ElevatedButton(
                                    onPressed: () {
                                      _controller_depo.clear();
                                      _controller_cntr.clear();
                                      _controller_size.clear();
                                      _controller_quoteCcy.clear();
                                      _controller_approveCode.clear();
                                      _controller_quoteNo.clear();
                                      _controller_charge.clear();
                                      _controller_component.clear();
                                      _controller_damageCode.clear();
                                      _controller_damageDetail.clear();
                                      _controller_category.clear();
                                      _controller_location.clear();
                                      _controller_payer.clear();
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
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                WidgetCharge(controller: _controller_charge),
                                WidgetComponent(
                                    controller: _controller_component),
                                WidgetDamage(
                                    controller: _controller_damageCode),
                                WidgetDamageDetail(
                                    controller: _controller_damageDetail),
                                WidgetCategory(
                                    controller: _controller_category),
                                WidgetLocation(
                                    controller: _controller_location),
                                WidgetPayer(controller: _controller_payer),
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
                                      controller: _dataGridController,
                                      onSelectionChanged:
                                          (addedRows, removedRows) {
                                        quoteController.listDetails.value =
                                            _dataGridController.selectedRow!
                                                .getCells()[5]
                                                .value;
                                      },
                                      source: _dataListEQCSource,
                                      columns: [
                                        WidgetGridColumn(
                                          label: 'Seq.',
                                          visible: true,
                                        ),
                                        WidgetGridColumn(
                                          label: 'Depot',
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
                                          label: 'isImgUpload',
                                          visible: false,
                                        ),
                                        WidgetGridColumn(
                                          label: 'completeImgUpload',
                                          visible: false,
                                        ),
                                        WidgetGridColumn(
                                          label: 'details',
                                          visible: false,
                                        ),
                                        WidgetGridColumn(
                                          label: 'Size',
                                          visible: true,
                                        ),
                                        WidgetGridColumn(
                                          label: 'Ccy',
                                          visible: true,
                                        ),
                                        WidgetGridColumn(
                                          label: 'Total Cost',
                                          visible: true,
                                        ),
                                        WidgetGridColumn(
                                          label: 'Tarrif',
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
                                          label: 'Remarks',
                                          visible: true,
                                        ),
                                        WidgetGridColumn(
                                          label: 'Quote No',
                                          visible: true,
                                        ),
                                      ])),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            DetailEQC()
                          ],
                        )
                      : const Center(child: CircularProgressIndicator());
                }),
          ),
        ]),
      ),
    );
  }

  Row WidgetDepo({required TextEditingController controller}) {
    return Row(
      children: [
        WidgetContainerLabel(label: 'Depot'),
        WidgetTextField(controller: controller),
      ],
    );
  }

  Row WidgetCntr({required TextEditingController controller}) {
    return Row(
      children: [
        WidgetContainerLabel(label: 'Container'),
        WidgetTextField(controller: controller),
      ],
    );
  }

  Row WidgetSize({required TextEditingController controller}) {
    return Row(
      children: [
        WidgetContainerLabel(label: 'Size'),
        Combobox<ChargeTypeQuotes>(
          controllerCombobox: controller,
          list: quoteController.listCharge,
          valueName: (element) => element.chargeTypeCode!,
          onChanged: (p0) {},
        ),
      ],
    );
  }

  Row WidgetCurrency({required TextEditingController controller}) {
    return Row(
      children: [
        WidgetContainerLabel(label: 'Currency'),
        Combobox<CurrencyQuotes>(
          controllerCombobox: controller,
          list: quoteController.listCurrency,
          valueName: (element) => element.currency!,
          onChanged: (p0) {},
        ),
      ],
    );
  }

  // Row WidgetStatus({required TextEditingController controller}) {
  //   return Row(
  //     children: [
  //       WidgetContainerLabel(label: 'Status'),
  //       Combobox<CategoryQuotes>(
  //         controllerCombobox: controller,
  //         list: quoteController.listCategory,
  //         valueName: (element) => element.categoryCode!,
  //         onChanged: (p0) {},
  //       ),
  //     ],
  //   );
  // }

  Row WidgetQuoteNo({required TextEditingController controller}) {
    return Row(
      children: [
        WidgetContainerLabel(label: 'Quote No.'),
        WidgetTextField(controller: controller),
      ],
    );
  }

  Row WidgetCharge({required TextEditingController controller}) {
    return Row(
      children: [
        WidgetContainerLabel(label: 'Charge'),
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

  Row WidgetDamage({required TextEditingController controller}) {
    return Row(
      children: [
        WidgetContainerLabel(label: 'Damage'),
        Combobox<ErrorQuotes>(
          controllerCombobox: controller,
          list: quoteController.listError,
          valueName: (element) => element.errorCode!,
          onChanged: (p0) {},
        ),
      ],
    );
  }

  Row WidgetDamageDetail({required TextEditingController controller}) {
    return Row(
      children: [
        WidgetContainerLabel(label: 'Damage Detail'),
        WidgetTextField(controller: controller),
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

  Row WidgetLocation({required TextEditingController controller}) {
    return Row(
      children: [
        WidgetContainerLabel(label: 'Location'),
        WidgetTextField(controller: controller),
      ],
    );
  }

  Row WidgetPayer({required TextEditingController controller}) {
    return Row(
      children: [
        WidgetContainerLabel(label: 'Payer'),
        WidgetTextField(controller: controller),
      ],
    );
  }
}
