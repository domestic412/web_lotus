import 'package:flutter/material.dart';

import 'package:web_lotus/controller/init_quote_controller.dart';

class WidgetTotalCost extends StatefulWidget {
  const WidgetTotalCost({super.key});

  @override
  State<WidgetTotalCost> createState() => _WidgetTotalCostState();
}

class _WidgetTotalCostState extends State<WidgetTotalCost> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Total Cost'),
            SizedBox(
              height: 5,
            ),
            Container(
              width: 140,
              height: 40,
              child: TextField(
                controller: quoteController.totalCost.value,
                decoration: InputDecoration(
                    isDense: true, border: OutlineInputBorder()),
              ),
            )
          ],
        ));
  }
}
