import 'package:flutter/material.dart';

import 'package:web_lotus/controller/init_quote_controller.dart';
import 'package:web_lotus/widgets/container/ContainerLabel.dart';
import 'package:web_lotus/widgets/container/WidgetTextField.dart';

class WidgetMrCost extends StatelessWidget {
  const WidgetMrCost({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        WidgetContainerLabel(label: 'Mr Cost'),
        WidgetTextField(controller: quoteController.mrCost.value),
      ],
    );
  }
}
