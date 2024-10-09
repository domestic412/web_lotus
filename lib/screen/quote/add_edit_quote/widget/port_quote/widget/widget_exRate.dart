import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:web_lotus/controller/init_quote_controller.dart';

class WidgetExRate extends StatelessWidget {
  const WidgetExRate({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minWidth: 150),
      child: Row(children: [
        Container(
          margin: EdgeInsets.only(right: 10),
          child: Text('Ex. Rate'),
        ),
        Container(
          width: 100,
          height: 40,
          margin: EdgeInsets.only(right: 100),
          child: TextField(
            controller: quoteController.exRate.value,
            decoration:
                InputDecoration(isDense: true, border: OutlineInputBorder()),
          ),
        )
      ]),
    );
    ;
  }
}
