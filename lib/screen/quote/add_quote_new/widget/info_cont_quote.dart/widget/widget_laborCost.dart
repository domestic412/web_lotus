import 'package:flutter/material.dart';
import 'package:web_lotus/controller/init_quote_controller.dart';

class WidgetLaborCost extends StatefulWidget {
  const WidgetLaborCost({super.key});

  @override
  State<WidgetLaborCost> createState() => _WidgetLaborCostState();
}

class _WidgetLaborCostState extends State<WidgetLaborCost> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Labor Cost'),
            SizedBox(
              height: 5,
            ),
            Container(
              width: 140,
              height: 40,
              child: TextField(
                controller: quoteController.laborCost.value,
                decoration: InputDecoration(
                    isDense: true, border: OutlineInputBorder()),
              ),
            )
          ],
        ));
  }
}
