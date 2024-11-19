import 'package:flutter/material.dart';

import 'package:web_lotus/controller/init_quote_controller.dart';

class WidgetLocation extends StatefulWidget {
  const WidgetLocation({super.key});

  @override
  State<WidgetLocation> createState() => _WidgetLocationState();
}

class _WidgetLocationState extends State<WidgetLocation> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Location'),
            SizedBox(
              height: 5,
            ),
            Container(
              width: 140,
              height: 40,
              child: TextField(
                controller: quoteController.location.value,
                decoration: InputDecoration(
                    isDense: true, border: OutlineInputBorder()),
              ),
            )
          ],
        ));
  }
}
