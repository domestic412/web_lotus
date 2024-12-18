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
      ],
    );
  }
}
