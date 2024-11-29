import 'package:flutter/material.dart';

import 'package:web_lotus/controller/init_quote_controller.dart';
import 'package:web_lotus/widgets/container/ContainerLabel.dart';
import 'package:web_lotus/widgets/container/WidgetTextField.dart';

class WidgetLocation extends StatelessWidget {
  const WidgetLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        WidgetContainerLabel(label: 'Location'),
        WidgetTextField(controller: quoteController.location.value),
      ],
    );
  }
}
