import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:web_lotus/assets/style.dart';
import 'package:web_lotus/controller/init_quote_controller.dart';

class WidgetExRate extends StatelessWidget {
  const WidgetExRate({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minWidth: 150),
      child: Row(children: [
        Container(
          width: 100,
          margin: EdgeInsets.only(right: 5),
          padding: EdgeInsets.all(5),
          color: Color.fromARGB(255, 92, 117, 160),
          child: Text(
            'Ex. Rate',
            style: style12_white,
          ),
        ),
        Container(
          width: 100,
          height: 30,
          margin: EdgeInsets.only(left: 5, right: 50),
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
