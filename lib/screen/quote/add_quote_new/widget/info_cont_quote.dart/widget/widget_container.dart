import 'package:flutter/material.dart';
import 'package:web_lotus/controller/init_quote_controller.dart';
import 'package:web_lotus/widgets/container/ContainerLabel.dart';
import 'package:web_lotus/widgets/container/WidgetTextField.dart';

class WidgetContainer extends StatelessWidget {
  const WidgetContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        WidgetContainerLabel(label: 'Container'),
        WidgetTextField(controller: quoteController.container.value),
        // Text('Container'),
        // SizedBox(
        //   height: 5,
        // ),
        // Container(
        //   width: 200,
        //   height: 40,
        //   child: TextField(
        //       controller: quoteController.container.value,
        //       decoration: const InputDecoration(
        //           isDense: true, border: OutlineInputBorder())),
        // )
      ],
    );
  }
}
