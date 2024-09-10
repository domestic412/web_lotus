import 'package:flutter/material.dart';
import 'package:web_lotus/assets/color.dart';
import 'package:web_lotus/assets/style.dart';
import 'package:web_lotus/controller/init_quote_controller.dart';
import 'package:web_lotus/model/model_quote_detail.dart';
import 'package:web_lotus/screen/quote/data_quote_list/detail_quote/data_detail_quote/data_detail_quote.dart';
import 'package:web_lotus/screen/quote/quote_page.dart';
import 'package:web_lotus/screen/tracking/tracking_page.dart';
import 'package:web_lotus/widgets/appbar/appbar_fake.dart';
import 'package:web_lotus/widgets/footer.dart';

class QuoteDetailsPage extends StatefulWidget {
  const QuoteDetailsPage({super.key});

  @override
  State<QuoteDetailsPage> createState() => _QuoteDetailsPageState();
}

TextEditingController input = TextEditingController();
final ScrollController horizontalScroll = ScrollController();
double width_20 = 20;

class _QuoteDetailsPageState extends State<QuoteDetailsPage> {
  DataTableQuoteDetails _dataQuote = DataTableQuoteDetails(data: []);
  DataTableQuoteDetails _list_filter = DataTableQuoteDetails(data: []);

  TextEditingController _search_quote = TextEditingController();

  @override
  void initState() {
    super.initState();
    EQCQuoteDetail()
        .fetchQuoteDetails(quoteController.eqcQuoteId.value)
        .then((data) {
      setState(() {
        _dataQuote = DataTableQuoteDetails(data: data);
        _list_filter = _dataQuote;
        // print('initial data history');
      });
    });
  }

  void _filterQuoteDetails() {
    setState(() {
      final filterData = _dataQuote.list_filter(_search_quote.text);
      _list_filter = DataTableQuoteDetails(data: filterData);
      // print('filter data history');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: WidgetAppBar(),
      backgroundColor: MyColor.backgroundColor,
      bottomSheet: Footer(),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AppbarWidget(),
              Container(
                margin: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TrackingPage()));
                        },
                        child: Text('Tracking')),
                    SizedBox(width: 30),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => QuoteListPage()));
                        },
                        child: Text('Quote')),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  margin: EdgeInsets.fromLTRB(10, 10, 10, 40),
                  decoration: BoxDecoration(
                      color: MyColor.contentColor,
                      borderRadius: BorderRadius.circular(10)),
                  // width: 1004,
                  constraints:
                      const BoxConstraints(minWidth: 1004, maxWidth: 1400),
                  // width: FWidth,
                  padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Quote Details',
                          style: style20_blue,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: white,
                            border: Border.all(
                                color: blue.withOpacity(.4), width: .5),
                            boxShadow: [
                              BoxShadow(
                                  offset: const Offset(0, 6),
                                  color: blue.withOpacity(.1),
                                  blurRadius: 12)
                            ],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.all(8),
                          margin: const EdgeInsets.symmetric(vertical: 16),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: Colors.black45)),
                            child: ListTile(
                              dense: true,
                              leading: const Icon(Icons.search),
                              title: TextField(
                                controller: _search_quote,
                                decoration: const InputDecoration(
                                    hintText: 'Search',
                                    border: InputBorder.none,
                                    isDense: true,
                                    contentPadding: EdgeInsets.all(0)),
                                onChanged: (value) {
                                  _filterQuoteDetails();
                                },
                              ),
                              trailing: IconButton(
                                icon: const Icon(Icons.cancel),
                                onPressed: () {
                                  _search_quote.clear();
                                  _filterQuoteDetails();
                                },
                              ),
                            ),
                          ),
                        ),
                        Container(
                          // width: deviceWidth(context),
                          width: 1400,
                          decoration: BoxDecoration(
                            color: white,
                            border: Border.all(
                                color: blue.withOpacity(.4), width: .5),
                            boxShadow: [
                              BoxShadow(
                                  offset: const Offset(0, 6),
                                  color: blue.withOpacity(.1),
                                  blurRadius: 12)
                            ],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: PaginatedDataTable(
                            // headingRowColor:
                            //     MaterialStateColor.resolveWith((states) => lightGrey),
                            sortColumnIndex: 0,
                            dataRowMaxHeight: 50,
                            columnSpacing: 16,
                            columns: const [
                              DataColumn(
                                label: SizedBox(
                                  width: 40,
                                  child: Center(
                                    child: Text(
                                      'Seq',
                                      // style: style_text_Table_small_bold,
                                    ),
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Tooltip(
                                  message: 'Charge Type',
                                  child: Text(
                                    'Type',
                                    // style: style_text_Table_small_bold,
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Tooltip(
                                    message: 'Component',
                                    child: Text(
                                      'Comp.',
                                      // style: style_text_Table_small_bold,
                                    )),
                              ),
                              DataColumn(
                                label: Text(
                                  'Category',
                                  // style: style_text_Table_small_bold,
                                ),
                              ),
                              DataColumn(
                                label: Tooltip(
                                  message: 'Damage Code',
                                  child: Text(
                                    'D. Code',
                                    // style: style_text_Table_small_bold,
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  'Container',
                                  // style: style_text_Table_small_bold,
                                ),
                              ),
                              DataColumn(
                                label: Tooltip(
                                  message: 'Damage Details',
                                  child: Text(
                                    'D. Details',
                                    // style: style_text_Table_small_bold,
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  'Quantity',
                                  // style: style_text_Table_small_bold,
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  'Dimension',
                                  // style: style_text_Table_small_bold,
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  'Length',
                                  // style: style_text_Table_small_bold,
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  'Width',
                                  // style: style_text_Table_small_bold,
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  'Location',
                                  // style: style_text_Table_small_bold,
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  'Labor Cost',
                                  // style: style_text_Table_small_bold,
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  'Mr. Cost',
                                  // style: style_text_Table_small_bold,
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  'Total Cost',
                                  // style: style_text_Table_small_bold,
                                ),
                              ),
                              DataColumn(
                                label: Tooltip(
                                  message: 'Estimate Date',
                                  child: Text(
                                    'Est. Date',
                                    // style: style_text_Table_small_bold,
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  'Payer',
                                  // style: style_text_Table_small_bold,
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  'Status',
                                  // style: style_text_Table_small_bold,
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  'Image File',
                                  // style: style_text_Table_small_bold,
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  'Upload Image',
                                  // style: style_text_Table_small_bold,
                                ),
                              ),
                            ],
                            source: _list_filter,
                          ),
                        ),
                      ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
