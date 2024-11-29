import 'package:flutter/material.dart';
import 'package:web_lotus/controller/init_quote_controller.dart';
import 'package:web_lotus/widgets/container/ContainerLabel.dart';

class WidgetQuoteNo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          WidgetContainerLabel(label: 'Quote No.'),
          Container(
              width: 90,
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.black12,
              ),
              child: Text(
                quoteController.quoteNo.value,
                style: TextStyle(color: Colors.black54, fontSize: 11),
              ))
        ],
      ),
    );
  }
}
