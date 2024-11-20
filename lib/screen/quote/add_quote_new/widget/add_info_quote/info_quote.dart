import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'widget/import_button.dart';
import 'widget/widget_currency.dart';
import 'widget/widget_exRate.dart';
import 'widget/widget_quoteNo.dart';

class InfoQuote extends StatefulWidget {
  const InfoQuote({super.key});

  @override
  State<InfoQuote> createState() => _InfoQuoteState();
}

class _InfoQuoteState extends State<InfoQuote> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        WidgetQuoteNo(),
        WidgetCurrency(),
        WidgetExRate(),
        ImportButton()
      ],
    );
  }
}
