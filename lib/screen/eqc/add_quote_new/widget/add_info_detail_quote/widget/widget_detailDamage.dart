import 'package:flutter/material.dart';
import 'package:web_lotus/controller/init_quote_controller.dart';
import 'package:web_lotus/widgets/container/ContainerLabel.dart';
import 'package:web_lotus/widgets/container/WidgetTextField.dart';

class WidgetDetailDamage extends StatelessWidget {
  const WidgetDetailDamage({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        WidgetContainerLabel(label: 'Detail of Dmg'),
        WidgetTextField(controller: quoteController.detailDamage.value),
        // Text('Detail of Damage'),
        // SizedBox(
        //   height: 5,
        // ),
        // Container(
        //   width: 200,
        //   height: 40,
        //   child: TextField(
        //       controller: quoteController.detailDamage.value,
        //       decoration: const InputDecoration(
        //           isDense: true, border: OutlineInputBorder())),
        // )
      ],
    );
  }
}
