import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:web_lotus/assets/style.dart';
import 'package:web_lotus/controller/init_quote_controller.dart';
import 'package:web_lotus/widgets/container/container_label.dart';
import 'package:web_lotus/widgets/container/textfield.dart';

class WidgetExRate extends StatelessWidget {
  const WidgetExRate({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      ContainerLabel(label: 'Ex. Rate'),
      WidgetTextField(controller: quoteController.exRate.value),
    ]);
  }
}
