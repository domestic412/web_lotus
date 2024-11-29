import 'package:flutter/material.dart';

import 'package:web_lotus/controller/init_quote_controller.dart';
import 'package:web_lotus/model/model_init_quote.dart';
import 'package:web_lotus/widgets/container/ContainerLabel.dart';
import 'package:web_lotus/widgets/container/combobox.dart';

class WidgetError extends StatefulWidget {
  const WidgetError({super.key});

  @override
  State<WidgetError> createState() => _WidgetErrorState();
}

class _WidgetErrorState extends State<WidgetError> {
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        WidgetContainerLabel(label: 'Damage'),
        Combobox<ErrorQuotes>(
            controllerCombobox: _controller,
            list: quoteController.listError,
            valueName: (element) => element.errorCode!,
            // valueId: (element) => element.errorId!,
            // valueSend: quoteController.errorId.value
            onChanged: (value) {
              quoteController.errorId.value = value!.errorId!;
            }),
        const Icon(
          Icons.search,
          size: 12,
        ),
      ],
    );
  }
}
