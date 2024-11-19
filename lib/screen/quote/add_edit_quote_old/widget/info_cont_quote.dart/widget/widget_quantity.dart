import 'package:flutter/material.dart';
import 'package:web_lotus/controller/init_quote_controller.dart';

class WidgetQuantity extends StatefulWidget {
  const WidgetQuantity({super.key});

  @override
  State<WidgetQuantity> createState() => _WidgetQuantityState();
}

class _WidgetQuantityState extends State<WidgetQuantity> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Quantity'),
            SizedBox(
              height: 5,
            ),
            Container(
              width: 60,
              height: 40,
              child: TextField(
                controller: quoteController.quantity.value,
                decoration: InputDecoration(
                    isDense: true, border: OutlineInputBorder()),
              ),
            )
          ],
        ));
  }
}
