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
import 'package:web_lotus/model/model_quote_list.dart';
import 'package:web_lotus/screen/eqc/add_quote_new/add_edit_quote.dart';
import 'package:web_lotus/screen/eqc/widget/container.dart';
import 'package:web_lotus/screen/eqc/widget/img/upload_image_zip.dart';
import 'package:web_lotus/widgets/appbar/appbar_fake.dart';
import 'package:web_lotus/widgets/container/ContainerLabel.dart';
import 'package:web_lotus/widgets/container/WidgetGridColumn.dart';

import 'data_listQuote_gridview.dart';
import 'detail_quote/widget_detail_quote.dart';

class ListQuotePage extends StatefulWidget {
  const ListQuotePage({super.key});

  @override
  State<ListQuotePage> createState() => _ListQuotePageState();
}

class _ListQuotePageState extends State<ListQuotePage> {
  final DataGridController _dataGridController = DataGridController();
  late DataQuoteListSource _dataQuoteListSource;
  List<QuoteList> _QuoteList = <QuoteList>[];

  TextEditingController _controller_depo = TextEditingController();
  // TextEditingController _controller_cntr = TextEditingController();
  // TextEditingController _controller_size = TextEditingController();
  TextEditingController _controller_quoteCcy = TextEditingController();
  // TextEditingController _controller_approveCode = TextEditingController();
  TextEditingController _controller_quoteNo = TextEditingController();
  TextEditingController _controller_status = TextEditingController();
  // // search details
  // TextEditingController _controller_charge = TextEditingController();
  // TextEditingController _controller_component = TextEditingController();
  // TextEditingController _controller_damageCode = TextEditingController();
  // TextEditingController _controller_damageDetail = TextEditingController();
  // TextEditingController _controller_category = TextEditingController();
  // TextEditingController _controller_location = TextEditingController();
  // TextEditingController _controller_payer = TextEditingController();

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

  refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AppbarWidget(),
          Expanded(
            child: Container(
              width: fullSizeWidth,
              margin: EdgeInsets.fromLTRB(10, 0, 10, 20),
              decoration: BoxDecoration(
                  color: MyColor.contentColor,
                  borderRadius: BorderRadius.circular(10)),
              padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Management EQC',
                      style: style20_blue,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          // padding: EdgeInsets.all(5.0),
                          child: Row(
                            children: [
                              WidgetContainerLabel(label: 'From Date'),
                              // Text('From Date'),
                              CustomPopup(
                                showArrow: false,
                                content: SizedBox(
                                  height: 270,
                                  width: 270,
                                  child: CalendarDatePicker(
                                    initialDate: dateFormat.parse(
                                        quoteController.fromDate_text.value),
                                    firstDate: DateTime(2024),
                                    lastDate: DateTime(2123),
                                    onDateChanged: (value) {
                                      quoteController.fromDate_text.value =
                                          DateFormat('dd/MM/yyyy')
                                              .format(value);
                                      quoteController.fromDate_send.value =
                                          DateFormat('MM/dd/yyyy')
                                              .format(value);
                                      setState(() {
                                        Navigator.pop(context);
                                      });
                                    },
                                  ),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(color: grey)),
                                  margin: EdgeInsets.symmetric(horizontal: 10),
                                  padding: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 10),
                                  child: Text(
                                    quoteController.fromDate_text.value,
                                    style: style11_black,
                                  ),
                                ),
                              ),
                              // Text('To Date'),
                              WidgetContainerLabel(label: 'To Date'),
                              SizedBox(
                                child: CustomPopup(
                                  showArrow: false,
                                  contentPadding: EdgeInsets.all(0),
                                  content: SizedBox(
                                    height: 270,
                                    width: 270,
                                    child: CalendarDatePicker(
                                      initialDate: dateFormat.parse(
                                          quoteController.toDate_text.value),
                                      firstDate: DateTime(2024),
                                      lastDate: DateTime(2123),
                                      onDateChanged: (value) {
                                        quoteController.toDate_text.value =
                                            DateFormat('dd/MM/yyyy')
                                                .format(value);
                                        quoteController.toDate_send.value =
                                            DateFormat('MM/dd/yyyy')
                                                .format(value);
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
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    padding: EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 10),
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
                            quoteController.listInputQuoteDetail_show.value =
                                [];
                            InitEQCQuote().fetchInitQuote(eqcQuoteId_new);
                            Get.to(() => AEQuotePage());
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: haian,
                            minimumSize: Size(150, 35),
                          ),
                          child: Text(
                            'Create Quote',
                            style: style11_white,
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: FutureBuilder<List<QuoteList>>(
                          future: QuoteList().fetchQuoteList(
                            fromDate: quoteController.fromDate_send.value,
                            toDate: quoteController.toDate_send.value,
                            // userId: inforUserController.userId.value
                          ),
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            if (snapshot.hasData) {
                              _QuoteList = snapshot.data;
                              _dataQuoteListSource =
                                  DataQuoteListSource(_QuoteList);
                            }
                            return snapshot.hasData
                                ? Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          WidgetDepo(
                                              controller: _controller_depo),
                                          WidgetQuoteNo(
                                              controller: _controller_quoteNo),
                                          WidgetCurrency(
                                              controller: _controller_quoteCcy),
                                          WidgetStatus(
                                              controller: _controller_status),
                                          WidgetButtonFilter(),
                                          WidgetButtonRemoveFilter(),
                                          WidgetButtonUploadImg()
                                          // Column(
                                          //   children: [
                                          //     WidgetDepo(
                                          //         controller: _controller_depo),
                                          //     WidgetQuoteNo(
                                          //         controller:
                                          //             _controller_quoteNo),
                                          //   ],
                                          // ),
                                          // Column(
                                          //   children: [
                                          //     // WidgetCntr(
                                          //     //     controller: _controller_cntr),
                                          //     // WidgetSize(controller: _controller_size),
                                          //     WidgetCurrency(
                                          //         controller:
                                          //             _controller_quoteCcy),
                                          //     // WidgetCharge(
                                          //     //     controller:
                                          //     //         _controller_charge),
                                          //   ],
                                          // ),
                                          // SizedBox(
                                          //   width: 20,
                                          // ),
                                          // Column(
                                          //   children: [
                                          //     WidgetComponent(
                                          //         controller:
                                          //             _controller_component),
                                          //     WidgetDamage(
                                          //         controller:
                                          //             _controller_damageCode),
                                          //     WidgetDamageDetail(
                                          //         controller:
                                          //             _controller_damageDetail),
                                          //   ],
                                          // ),
                                          // Column(
                                          //   children: [
                                          //     WidgetCategory(
                                          //         controller:
                                          //             _controller_category),
                                          //     WidgetLocation(
                                          //         controller:
                                          //             _controller_location),
                                          //     WidgetPayer(
                                          //         controller:
                                          //             _controller_payer),
                                          //   ],
                                          // ),
                                          // Column(
                                          //   crossAxisAlignment:
                                          //       CrossAxisAlignment.start,
                                          //   children: [
                                          //     WidgetButtonFilter(),
                                          //     WidgetButtonRemoveFilter(),
                                          //     WidgetButtonUploadImg()
                                          //   ],
                                          // )
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
                                                columnWidthMode:
                                                    ColumnWidthMode.fill,
                                                selectionMode:
                                                    SelectionMode.single,
                                                gridLinesVisibility:
                                                    GridLinesVisibility.both,
                                                headerGridLinesVisibility:
                                                    GridLinesVisibility.both,
                                                controller: _dataGridController,
                                                onSelectionChanged:
                                                    (addedRows, removedRows) {
                                                  quoteController
                                                          .eqcQuoteId.value =
                                                      _dataGridController
                                                          .selectedRow!
                                                          .getCells()[0]
                                                          .value;
                                                  setState(() {});
                                                },
                                                source: _dataQuoteListSource,
                                                columns: [
                                                  WidgetGridColumn(
                                                    label: 'Seq.',
                                                    visible: true,
                                                  ),
                                                  WidgetGridColumn(
                                                    label: 'eqcQuoteId',
                                                    visible: false,
                                                  ),
                                                  WidgetGridColumn(
                                                    label: 'Port/Depot',
                                                    visible: true,
                                                  ),
                                                  WidgetGridColumn(
                                                    label: 'Quote No',
                                                    visible: true,
                                                  ),
                                                  WidgetGridColumn(
                                                    label: 'Estimate Date',
                                                    visible: true,
                                                  ),
                                                  WidgetGridColumn(
                                                    label: 'Ccy',
                                                    visible: true,
                                                  ),
                                                  WidgetGridColumn(
                                                    label: 'exRate',
                                                    visible: true,
                                                  ),
                                                  WidgetGridColumn(
                                                    label: 'Status',
                                                    visible: true,
                                                  ),
                                                  WidgetGridColumn(
                                                    label: 'User',
                                                    visible: true,
                                                  ),
                                                  WidgetGridColumn(
                                                    label: 'Approve by',
                                                    visible: true,
                                                  ),
                                                  WidgetGridColumn(
                                                    label: 'Approve Date',
                                                    visible: true,
                                                  ),
                                                ])),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      DetailQuote()
                                    ],
                                  )
                                : const Center(
                                    child: CircularProgressIndicator());
                          }),
                    ),
                  ]),
            ),
          ),
        ],
      ),
    );
  }

  // Row WidgetSize({required TextEditingController controller}) {
  //   return Row(
  //     children: [
  //       WidgetContainerLabel(label: 'Size'),
  //       WidgetTextField(controller: controller),
  //     ],
  //   );
  // }

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

  WidgetButtonFilter() {
    return Container(
      margin: EdgeInsets.all(5),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: haian,
            minimumSize: Size(150, 35),
          ),
          onPressed: () {
            _dataQuoteListSource.applyFilter(
              quoteNo: _controller_quoteNo.text,
              portDepot: _controller_depo.text,
              quoteCcy: _controller_quoteCcy.text,
              quoteStatus: _controller_status.text,
              // cntr: _controller_cntr.text,
              // // size:
              // //     _controller_size.text == '' ? 'NULL' : _controller_size.text,
              // // approveCode: _controller_approveCode.text,
              // //details
              // charge: _controller_charge.text,
              // component: _controller_component.text,
              // damageCode: _controller_damageCode.text,
              // damageDetail: _controller_damageDetail.text,
              // category: _controller_category.text,
              // location: _controller_location.text,
              // payer: _controller_payer.text,
            );
          },
          child: Text(
            'Filter',
            style: style11_white,
          )),
    );
  }

  WidgetButtonRemoveFilter() {
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
            _controller_quoteCcy.clear();
            _controller_status.clear();
            // _controller_cntr.clear();
            // _controller_size.clear();

            // _controller_approveCode.clear();

            // _controller_charge.clear();
            // _controller_component.clear();
            // _controller_damageCode.clear();
            // _controller_damageDetail.clear();
            // _controller_category.clear();
            // _controller_location.clear();
            // _controller_payer.clear();
            _dataQuoteListSource.clear();
          },
          child: Text(
            'Remove Filter',
            style: style11_white,
          )),
    );
  }

  WidgetButtonUploadImg() {
    return Container(
      margin: EdgeInsets.all(5),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange, minimumSize: Size(150, 35)),
          onPressed: () {
            SelectFileZip(refresh);
          },
          child: Text(
            'Upload Image (.zip)',
            style: style11_white,
          )),
    );
  }
}
