import 'package:flutter/material.dart';
import 'package:web_lotus/controller/init_quote_controller.dart';
import 'package:web_lotus/widgets/container/ContainerLabel.dart';
import 'package:web_lotus/widgets/container/WidgetTextField.dart';

class WidgetDemension extends StatelessWidget {
  const WidgetDemension({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        WidgetContainerLabel(label: 'Demension'),
        WidgetTextField(controller: quoteController.dimension.value),
        // Text('Demension'),
        // SizedBox(
        //   height: 5,
        // ),
        // Container(
        //   width: 140,
        //   height: 40,
        //   child: TextField(
        //     controller: quoteController.dimension.value,
        //     decoration: InputDecoration(
        //         isDense: true, border: OutlineInputBorder()),
        //   ),
        // )
      ],
    );
  }
}
