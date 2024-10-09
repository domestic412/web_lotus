import 'package:flutter/material.dart';
import 'package:web_lotus/controller/init_quote_controller.dart';

class WidgetQuoteNo extends StatelessWidget {
  const WidgetQuoteNo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minWidth: 250),
      child: Row(
        children: [
          Container(
              margin: EdgeInsets.only(right: 10), child: Text('Quote No.')),
          Container(
              width: 150,
              height: 40,
              padding: EdgeInsets.symmetric(vertical: 13, horizontal: 13),
              decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(5)),
              child: Text(
                quoteController.quoteNo.value,
                style: TextStyle(color: Colors.black54),
              ))
        ],
      ),
    );
    ;
  }
}
