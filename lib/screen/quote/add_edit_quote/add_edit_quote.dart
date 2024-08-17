import 'package:flutter/material.dart';
import 'package:web_lotus/assets/color.dart';
import 'package:web_lotus/assets/style.dart';
import 'package:web_lotus/assets/variable.dart';
import 'package:web_lotus/controller/info_signin_controller.dart';
import 'package:web_lotus/controller/init_quote_controller.dart';
import 'package:web_lotus/model/model_add_quote.dart';
import 'package:web_lotus/screen/quote/quote_page.dart';
import 'package:web_lotus/screen/tracking/tracking_page.dart';
import 'package:web_lotus/widgets/appbar/appbar_fake.dart';
import 'package:web_lotus/widgets/footer.dart';

import 'widget/add_info_cont_quote.dart';
import 'widget/port_quote/port_quote.dart';
import 'widget/table_input_quote.dart';

class AEQuotePage extends StatefulWidget {
  const AEQuotePage({super.key});

  @override
  State<AEQuotePage> createState() => _AEQuotePageState();
}

class _AEQuotePageState extends State<AEQuotePage> {
  @override
  void initState() {
    super.initState();
    quoteController.currentDate_send.value =
        changeDatetoSend(date: DateTime.now());
    quoteController.gateInDate.value.text =
        changeDatetoShow(date: DateTime.now());
    quoteController.gateInDate_send.value =
        changeDatetoSend(date: DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    var FHeight = deviceHeight(context);
    var FWidth = deviceWidth(context);

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
                  margin: EdgeInsets.fromLTRB(10, 10, 10, 20),
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
                          'Create Quote',
                          style: style20_blue,
                        ),
                        Container(
                            margin: EdgeInsets.only(top: 20, bottom: 10),
                            padding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 10),
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
                            child: PortQuote()),
                        Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
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
                            child: InfoContQuote()),
                        Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
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
                            child: TableInputQuote()),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              if ((quoteController.currency.value != '') &&
                                  (quoteController.exRate.value.text != '')) {
                                PostNewQuote(
                                  eqcQuoteId: quoteController.eqcQuoteId.value,
                                  portDepotId:
                                      inforUserController.shipperId.value,
                                  quoteNo: quoteController.quoteNo.value,
                                  quoteCcy: quoteController.currency.value,
                                  exRate: quoteController.exRate.value.text,
                                  quoteUser:
                                      inforUserController.shipperName.value,
                                  edit: 'I',
                                );
                              }
                            },
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll<Color>(haian),
                                minimumSize:
                                    MaterialStateProperty.all(Size(100, 40))),
                            child: Text('Send Quote'),
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
