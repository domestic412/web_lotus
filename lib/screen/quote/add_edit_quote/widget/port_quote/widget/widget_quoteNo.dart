import 'package:flutter/material.dart';
import 'package:web_lotus/assets/style.dart';
import 'package:web_lotus/controller/init_quote_controller.dart';

class WidgetQuoteNo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // constraints: BoxConstraints(minWidth: 250),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 100,
            padding: EdgeInsets.all(5),
            color: Color.fromARGB(255, 92, 117, 160),
            child: Text(
              'Quote No.',
              style: style12_white,
            ),
          ),
          Container(
              width: 100,
              margin: EdgeInsets.only(left: 5),
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.black12,
              ),
              child: Text(
                quoteController.quoteNo.value,
                style: TextStyle(color: Colors.black38, fontSize: 12),
              ))
        ],
      ),
    );
  }
}
