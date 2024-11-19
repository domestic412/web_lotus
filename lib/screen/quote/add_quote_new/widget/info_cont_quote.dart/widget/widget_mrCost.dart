import 'package:flutter/material.dart';

import 'package:web_lotus/controller/init_quote_controller.dart';

class WidgetMrCost extends StatefulWidget {
  const WidgetMrCost({super.key});

  @override
  State<WidgetMrCost> createState() => _WidgetMrCostState();
}

class _WidgetMrCostState extends State<WidgetMrCost> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Mr Cost'),
            SizedBox(
              height: 5,
            ),
            Container(
              width: 140,
              height: 40,
              child: TextField(
                controller: quoteController.mrCost.value,
                decoration: InputDecoration(
                    isDense: true, border: OutlineInputBorder()),
              ),
            )
          ],
        ));
  }
}
