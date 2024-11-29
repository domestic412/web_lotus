import 'package:flutter/material.dart';
import 'package:web_lotus/assets/color.dart';
import 'package:web_lotus/assets/style.dart';
import 'package:web_lotus/assets/variable.dart';
import 'package:web_lotus/controller/info_signin_controller.dart';
import 'package:web_lotus/controller/init_quote_controller.dart';
import 'package:web_lotus/model/model_add_quote.dart';
import 'package:web_lotus/widgets/appbar/appbar_fake.dart';
import 'package:web_lotus/widgets/footer.dart';

import 'widget/add_info_detail_quote/add_info_cont_quote.dart';
import 'widget/add_info_quote/info_quote.dart';
import 'widget/table_quote/table_input_quote.dart';

class AEQuotePage extends StatefulWidget {
  @override
  State<AEQuotePage> createState() => _AEQuotePage1State();
}

class _AEQuotePage1State extends State<AEQuotePage> {
  @override
  void initState() {
    super.initState();
    quoteController.currentDate_send.value =
        changeDatetoSend(date: DateTime.now());
  }

  void refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.backgroundColor,
      // bottomSheet: Footer(),
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Create Quote',
                      style: style20_blue,
                    ),
                    InfoQuote(refresh),
                    InfoContQuote(),
                    Expanded(child: TableInputQuote()),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            if ((quoteController.currency.value != '') &&
                                (quoteController.exRate.value.text != '')) {
                              PostNewQuote(
                                eqcQuoteId: quoteController.eqcQuoteId.value,
                                portDepotId: inforUserController.userId.value,
                                quoteNo: quoteController.quoteNo.value,
                                quoteStatus: 'C',
                                quoteCcy: quoteController.currency.value,
                                exRate: quoteController.exRate.value.text,
                                quoteUser: inforUserController.userName.value,
                                edit: 'I',
                              );
                            }
                          },
                          style: ButtonStyle(
                              backgroundColor:
                                  WidgetStatePropertyAll<Color>(haian),
                              minimumSize:
                                  WidgetStateProperty.all(Size(100, 40))),
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
                                eqcQuoteId: quoteController.eqcQuoteId.value,
                                portDepotId: inforUserController.userId.value,
                                quoteNo: quoteController.quoteNo.value,
                                quoteStatus: 'D',
                                quoteCcy: quoteController.currency.value,
                                exRate: quoteController.exRate.value.text,
                                quoteUser: inforUserController.userName.value,
                                edit: 'I',
                              );
                            }
                          },
                          style: ButtonStyle(
                              backgroundColor:
                                  WidgetStatePropertyAll<Color>(grey),
                              minimumSize:
                                  WidgetStateProperty.all(Size(100, 40))),
                          child: Text('Save Draft'),
                        ),
                      ],
                    ),
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}
