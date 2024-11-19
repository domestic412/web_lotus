import 'package:flutter/material.dart';
import 'package:web_lotus/controller/init_quote_controller.dart';

class WidgetWidth extends StatefulWidget {
  const WidgetWidth({super.key});

  @override
  State<WidgetWidth> createState() => _WidgetWidthState();
}

class _WidgetWidthState extends State<WidgetWidth> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Width'),
            SizedBox(
              height: 5,
            ),
            Container(
              width: 140,
              height: 40,
              child: TextField(
                controller: quoteController.width.value,
                decoration: InputDecoration(
                    isDense: true, border: OutlineInputBorder()),
              ),
            )
          ],
        ));
  }
}
