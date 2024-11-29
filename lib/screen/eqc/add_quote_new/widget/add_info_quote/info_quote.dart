import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'widget/import_button.dart';
import 'widget/upload_image_button.dart';
import 'widget/widget_currency.dart';
import 'widget/widget_exRate.dart';
import 'widget/widget_quoteNo.dart';

class InfoQuote extends StatelessWidget {
  InfoQuote(this.refresh);
  final VoidCallback refresh;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        WidgetQuoteNo(),
        WidgetCurrency(),
        SizedBox(
          width: 12,
        ),
        WidgetExRate(),
        ImportButton(),
        UploadImageButton(refresh),
      ],
    );
  }
}
