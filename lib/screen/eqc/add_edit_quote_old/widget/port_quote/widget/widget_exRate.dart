import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:web_lotus/assets/style.dart';
import 'package:web_lotus/controller/init_quote_controller.dart';
import 'package:web_lotus/widgets/container/ContainerLabel.dart';
import 'package:web_lotus/widgets/container/WidgetTextField.dart';

class WidgetExRate extends StatelessWidget {
  const WidgetExRate({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      WidgetContainerLabel(label: 'Ex. Rate'),
      WidgetTextField(controller: quoteController.exRate.value),
    ]);
  }
}
