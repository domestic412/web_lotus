import 'package:flutter/material.dart';
import 'package:web_lotus/controller/init_quote_controller.dart';

class WidgetDemension extends StatefulWidget {
  const WidgetDemension({super.key});

  @override
  State<WidgetDemension> createState() => _WidgetDemensionState();
}

class _WidgetDemensionState extends State<WidgetDemension> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Demension'),
            SizedBox(
              height: 5,
            ),
            Container(
              width: 140,
              height: 40,
              child: TextField(
                controller: quoteController.dimension.value,
                decoration: InputDecoration(
                    isDense: true, border: OutlineInputBorder()),
              ),
            )
          ],
        ));
  }
}
