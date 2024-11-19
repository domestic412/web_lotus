import 'package:flutter/material.dart';
import 'package:web_lotus/assets/color.dart';
import 'package:web_lotus/assets/style.dart';
import 'package:web_lotus/assets/variable.dart';
import 'package:web_lotus/controller/info_signin_controller.dart';
import 'package:web_lotus/controller/init_quote_controller.dart';
import 'package:web_lotus/model/model_add_quote.dart';
import 'package:web_lotus/widgets/appbar/appbar_fake.dart';
import 'package:web_lotus/widgets/footer.dart';

import 'widget/info_cont_quote.dart/add_info_cont_quote.dart';
import 'widget/port_quote/port_quote.dart';
import 'widget/table_input_quote.dart';

class AEQuotePage1 extends StatefulWidget {
  const AEQuotePage1({super.key});

  @override
  State<AEQuotePage1> createState() => _AEQuotePage1State();
}

class _AEQuotePage1State extends State<AEQuotePage1> {
  @override
  void initState() {
    super.initState();
    quoteController.currentDate_send.value =
        changeDatetoSend(date: DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    // var FHeight = deviceHeight(context);
    // var FWidth = deviceWidth(context);

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
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 10, 20),
                  decoration: BoxDecoration(
                      color: MyColor.contentColor,
                      borderRadius: BorderRadius.circular(10)),
                  // constraints:
                  //     const BoxConstraints(minWidth: 1004, maxWidth: 1400),
                  padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Create Quote',
                          style: style20_blue,
                        ),
                        PortQuote(),
                        Container(
                            // margin: EdgeInsets.symmetric(vertical: 10),
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                if ((quoteController.currency.value != '') &&
                                    (quoteController.exRate.value.text != '')) {
                                  PostNewQuote(
                                    eqcQuoteId:
                                        quoteController.eqcQuoteId.value,
                                    portDepotId:
                                        inforUserController.shipperId.value,
                                    quoteNo: quoteController.quoteNo.value,
                                    quoteStatus: 'C',
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
                            SizedBox(
                              width: 10,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                if ((quoteController.currency.value != '') &&
                                    (quoteController.exRate.value.text != '')) {
                                  PostNewQuote(
                                    eqcQuoteId:
                                        quoteController.eqcQuoteId.value,
                                    portDepotId:
                                        inforUserController.shipperId.value,
                                    quoteNo: quoteController.quoteNo.value,
                                    quoteStatus: 'D',
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
                                      MaterialStatePropertyAll<Color>(grey),
                                  minimumSize:
                                      MaterialStateProperty.all(Size(100, 40))),
                              child: Text('Save Draft'),
                            ),
                          ],
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
