import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:web_lotus/assets/color.dart';
import 'package:web_lotus/assets/style.dart';
import 'package:web_lotus/assets/variable.dart';
import 'package:web_lotus/controller/init_quote_controller.dart';
import 'package:web_lotus/model/model_init_quote.dart';
import 'package:web_lotus/model/model_quote_list.dart';
import 'package:web_lotus/screen/quote/data_quote_list/data_quote_list_gridview.dart';
import 'package:web_lotus/widgets/appbar/appbar_fake.dart';
import 'package:web_lotus/widgets/container/WidgetGridColumn.dart';
import 'package:web_lotus/widgets/footer.dart';
import 'package:flutter_popup/flutter_popup.dart';
import 'add_quote_new/add_edit_quote.dart';
import 'data_quote_list/detail_quote/detail_quote_page.dart';

class QuoteListPage extends StatefulWidget {
  QuoteListPage({super.key});

  @override
  State<QuoteListPage> createState() => _QuoteListPageState();
}

class _QuoteListPageState extends State<QuoteListPage> {
  TextEditingController _search_quote = TextEditingController();

  // late DataQuoteListSource _dataQuoteListSource;
  // List<QuoteList> _quoteList = <QuoteList>[];
  final DataGridController _dataGridController = DataGridController();

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
      backgroundColor: MyColor.backgroundColor,
      bottomSheet: Footer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AppbarWidget(),
          Expanded(
            child: Container(
              margin: EdgeInsets.fromLTRB(10, 0, 10, 40),
              // width: fullSizeWidth,
              decoration: BoxDecoration(
                  color: MyColor.contentColor,
                  borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Quote List',
                    style: style20_blue,
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
                                  initialDate: dateFormat.parse(
                                      quoteController.fromDate_text.value),
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
                                decoration: BoxDecoration(
                                    border: Border.all(color: grey)),
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                padding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 10),
                                child: Text(
                                  quoteController.fromDate_text.value,
                                  style: style12_black,
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
                                  margin: EdgeInsets.symmetric(horizontal: 10),
                                  padding: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 10),
                                  child: Text(
                                    quoteController.toDate_text.value,
                                    style: style12_black,
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
                          quoteController.countRow.value = 0;
                          InitEQCQuote().fetchInitQuote(eqcQuoteId_new);
                          Get.to(() => AEQuotePage1());
                        },
                        style: ButtonStyle(
                            backgroundColor:
                                WidgetStatePropertyAll<Color>(Colors.orange),
                            minimumSize:
                                WidgetStateProperty.all(Size(100, 40))),
                        child: Text('Add Quote'),
                      ),
                    ],
                  ),
                  Expanded(
                    child: FutureBuilder(
                        future: QuoteList().fetchQuoteList(
                            quoteController.fromDate_send.value,
                            quoteController.toDate_send.value),
                        builder: (BuildContext context,
                            AsyncSnapshot<dynamic> snapshot) {
                          return snapshot.hasData
                              ? SfDataGridTheme(
                                  data: SfDataGridThemeData(
                                      headerColor: Colors.grey[200]),
                                  child: SfDataGrid(
                                      rowHeight: 30,
                                      headerRowHeight: 40,
                                      columnWidthMode: ColumnWidthMode.fill,
                                      selectionMode: SelectionMode.single,
                                      gridLinesVisibility:
                                          GridLinesVisibility.both,
                                      headerGridLinesVisibility:
                                          GridLinesVisibility.both,
                                      controller: _dataGridController,
                                      onSelectionChanged:
                                          (addedRows, removedRows) {
                                        quoteController.eqcQuoteId.value =
                                            _dataGridController.selectedRow!
                                                .getCells()[1]
                                                .value
                                                .toString();
                                        Get.to(() => const QuoteDetailsPage());
                                      },
                                      source:
                                          DataQuoteListSource(snapshot.data),
                                      columns: [
                                        WidgetGridColumn(
                                            label: 'Seq', visible: true),
                                        WidgetGridColumn(
                                            label: 'eqcQuoteId',
                                            visible: false),
                                        WidgetGridColumn(
                                            label: 'Quote No', visible: true),
                                        WidgetGridColumn(
                                            label: 'Port/Depot', visible: true),
                                        WidgetGridColumn(
                                            label: 'Date', visible: true),
                                        WidgetGridColumn(
                                            label: 'Ccy', visible: true),
                                        WidgetGridColumn(
                                            label: 'exRate', visible: true),
                                        WidgetGridColumn(
                                            label: 'Status', visible: true),
                                        WidgetGridColumn(
                                            label: 'User', visible: true),
                                        WidgetGridColumn(
                                            label: 'Approve by', visible: true),
                                        WidgetGridColumn(
                                            label: 'Approve Date',
                                            visible: true),
                                      ]),
                                )
                              : Center(child: CircularProgressIndicator());
                        }),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
