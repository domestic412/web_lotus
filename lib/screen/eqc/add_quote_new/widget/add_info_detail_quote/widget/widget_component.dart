import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:web_lotus/controller/init_quote_controller.dart';
import 'package:web_lotus/model/model_init_quote.dart';
import 'package:web_lotus/widgets/container/ContainerLabel.dart';
import 'package:web_lotus/widgets/container/combobox.dart';

class WidgetComponent extends StatefulWidget {
  const WidgetComponent({super.key});

  @override
  State<WidgetComponent> createState() => _WidgetComponentState();
}

class _WidgetComponentState extends State<WidgetComponent> {
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        WidgetContainerLabel(label: 'Component'),
        Combobox<ComponentQuotes>(
            controllerCombobox: _controller,
            list: quoteController.listComponent,
            valueName: (element) => element.componentCode!,
            // valueId: (element) => element.componentId!,
            // valueSend: quoteController.componentId.value
            onChanged: (value) {
              quoteController.componentId.value = value!.componentId!;
            }),
        const Icon(
          Icons.search,
          size: 12,
        ),
      ],
    );
  }
}
