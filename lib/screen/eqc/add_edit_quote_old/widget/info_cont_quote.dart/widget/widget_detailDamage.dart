import 'package:flutter/material.dart';
import 'package:web_lotus/controller/init_quote_controller.dart';

class WidgetDetailDamage extends StatefulWidget {
  const WidgetDetailDamage({super.key});

  @override
  State<WidgetDetailDamage> createState() => _WidgetDetailDamageState();
}

class _WidgetDetailDamageState extends State<WidgetDetailDamage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Detail of Damage'),
            SizedBox(
              height: 5,
            ),
            Container(
              width: 200,
              height: 40,
              child: TextField(
                  controller: quoteController.detailDamage.value,
                  decoration: const InputDecoration(
                      isDense: true, border: OutlineInputBorder())),
            )
          ],
        ));
  }
}
