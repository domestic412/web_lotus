import 'package:flutter/material.dart';
import 'package:web_lotus/controller/init_quote_controller.dart';
import 'package:web_lotus/model/model_init_quote.dart';
import 'package:web_lotus/widgets/container/ContainerLabel.dart';
import 'package:web_lotus/widgets/container/combobox.dart';

class WidgetCharge extends StatefulWidget {
  const WidgetCharge({super.key});

  @override
  State<WidgetCharge> createState() => _WidgetChargeState();
}

class _WidgetChargeState extends State<WidgetCharge> {
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        WidgetContainerLabel(label: 'Charge'),
        Combobox<ChargeTypeQuotes>(
            controllerCombobox: _controller,
            list: quoteController.listCharge,
            valueName: (element) => element.chargeTypeCode!,
            valueId: (element) => element.chargeTypeId!,
            valueSend: quoteController.chargeTypeId.value),
        const Icon(
          Icons.search,
          size: 12,
        ),
      ],
    );
  }
}
