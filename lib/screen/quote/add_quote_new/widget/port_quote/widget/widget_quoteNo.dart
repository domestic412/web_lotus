import 'package:flutter/material.dart';
import 'package:web_lotus/controller/init_quote_controller.dart';
import 'package:web_lotus/widgets/container/ContainerLabel.dart';

class WidgetQuoteNo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        WidgetContainerLabel(label: 'Quote No.'),
        Container(
            width: 100,
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.black12,
            ),
            child: Text(
              quoteController.quoteNo.value,
              style: TextStyle(color: Colors.black38, fontSize: 12),
            ))
      ],
    );
  }
}
