import 'package:flutter/material.dart';
import 'package:web_lotus/controller/init_quote_controller.dart';

class WidgetContainer extends StatefulWidget {
  const WidgetContainer({super.key});

  @override
  State<WidgetContainer> createState() => _WidgetContainerState();
}

class _WidgetContainerState extends State<WidgetContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Container'),
            SizedBox(
              height: 5,
            ),
            Container(
              width: 200,
              height: 40,
              child: TextField(
                  controller: quoteController.container.value,
                  decoration: const InputDecoration(
                      isDense: true, border: OutlineInputBorder())),
            )
          ],
        ));
  }
}
