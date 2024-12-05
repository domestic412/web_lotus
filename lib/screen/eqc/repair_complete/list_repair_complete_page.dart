import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_popup/flutter_popup.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:web_lotus/assets/color.dart';
import 'package:web_lotus/assets/style.dart';
import 'package:web_lotus/assets/variable.dart';
import 'package:web_lotus/controller/info_signin_controller.dart';
import 'package:web_lotus/controller/init_quote_controller.dart';
import 'package:web_lotus/model/model_init_quote.dart';
import 'package:web_lotus/model/model_listEQC.dart';
import 'package:web_lotus/screen/eqc/list_eqc/detail_eqc/widget_detail_eqc.dart';
import 'package:web_lotus/widgets/appbar/appbar_fake.dart';
import 'package:web_lotus/widgets/container/ContainerLabel.dart';
import 'package:web_lotus/widgets/container/WidgetGridColumn.dart';
import 'package:web_lotus/widgets/container/WidgetTextField.dart';
import 'package:web_lotus/widgets/container/combobox.dart';

import 'data_repair_complete_gridview.dart';

class ListRepairCompletePage extends StatefulWidget {
  const ListRepairCompletePage({super.key});

  @override
  State<ListRepairCompletePage> createState() => _ListRepairCompletePageState();
}

class _ListRepairCompletePageState extends State<ListRepairCompletePage> {
  final DataGridController _dataGridController = DataGridController();
  late DataRepairCompleteSource _dataListEQCSource;
  List<ListEQC> _listEQC = <ListEQC>[];

  TextEditingController _controller_depo = TextEditingController();
  TextEditingController _controller_quoteNo = TextEditingController();
  TextEditingController _controller_cntr = TextEditingController();
  TextEditingController _controller_size = TextEditingController();
  TextEditingController _controller_quoteCcy = TextEditingController();

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
            'Repair Complete',
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
                    WidgetContainerLabel(label: 'From Date'),
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
                    WidgetContainerLabel(label: 'To Date'),
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
            ],
          ),
          Expanded(
            child: FutureBuilder<List<ListEQC>>(
                future: ListEQC().fetchListEQC(
                    fromDate: quoteController.fromDate_send.value,
                    toDate: quoteController.toDate_send.value,
                    userId: inforUserController.userId.value),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    _listEQC = snapshot.data;
                    _dataListEQCSource = DataRepairCompleteSource(_listEQC);
                  }
                  return snapshot.hasData
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                WidgetQuoteNo(controller: _controller_quoteNo),
                                WidgetCntr(controller: _controller_cntr),
                                WidgetSize(controller: _controller_size),
                                WidgetCurrency(
                                    controller: _controller_quoteCcy),
                                // WidgetStatus(
                                //     controller: _controller_approveCode),

                                WidgetButtonFilter(),
                                WidgetButtonRemoveFilter(),
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
                                                .getCells()[6]
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
                                          label: 'Quote No',
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

  Container WidgetButtonRemoveFilter() {
    return Container(
      margin: EdgeInsets.all(5),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: grey,
            minimumSize: Size(150, 35),
          ),
          onPressed: () {
            _controller_depo.clear();
            _controller_quoteNo.clear();
            _controller_cntr.clear();
            _controller_size.clear();
            _controller_quoteCcy.clear();
            // _controller_approveCode.clear();
            _dataListEQCSource.clear();
          },
          child: Text(
            'Remove Filter',
            style: style11_white,
          )),
    );
  }

  Container WidgetButtonFilter() {
    return Container(
      margin: EdgeInsets.all(5),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: haian,
            minimumSize: Size(150, 35),
          ),
          onPressed: () {
            _dataListEQCSource.applyFilter(
              quoteNo: _controller_quoteNo.text,
              depot: _controller_depo.text,
              cntr: _controller_cntr.text,
              size: _controller_size.text,
              quoteCcy: _controller_quoteCcy.text,
              // approveCode:
              //     _controller_approveCode.text,
            );
          },
          child: Text(
            'Filter',
            style: style11_white,
          )),
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

  Row WidgetQuoteNo({required TextEditingController controller}) {
    return Row(
      children: [
        WidgetContainerLabel(label: 'Quote No.'),
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
        WidgetTextField(controller: controller),
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
}
