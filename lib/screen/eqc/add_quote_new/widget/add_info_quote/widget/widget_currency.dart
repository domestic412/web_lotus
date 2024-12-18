import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:web_lotus/controller/init_quote_controller.dart';
import 'package:web_lotus/model/model_init_quote.dart';
import 'package:web_lotus/widgets/container/ContainerLabel.dart';
import 'package:web_lotus/widgets/container/combobox.dart';

class WidgetCurrency extends StatefulWidget {
  const WidgetCurrency({super.key});

  @override
  State<WidgetCurrency> createState() => _WidgetCurrencyState();
}

class _WidgetCurrencyState extends State<WidgetCurrency> {
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      child: Row(
        children: [
          WidgetContainerLabel(label: 'Currency'),
          Combobox<CurrencyQuotes>(
            controllerCombobox: _controller,
            list: quoteController.listCurrency,
            valueName: (element) => element.currency!,
            onChanged: (value) {
              quoteController.currency.value = value!.currency!;
              print(quoteController.currency.value);
            },
          ),
        ],
      ),
    );
  }
}
