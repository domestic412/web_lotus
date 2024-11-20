import 'package:flutter/material.dart';
import 'package:web_lotus/controller/init_quote_controller.dart';
import 'package:web_lotus/model/model_init_quote.dart';
import 'package:web_lotus/widgets/container/ContainerLabel.dart';
import 'package:web_lotus/widgets/container/combobox.dart';

class WidgetCategory extends StatefulWidget {
  const WidgetCategory({super.key});

  @override
  State<WidgetCategory> createState() => _WidgetCategoryState();
}

class _WidgetCategoryState extends State<WidgetCategory> {
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        WidgetContainerLabel(label: 'Category'),
        Combobox<CategoryQuotes>(
            controllerCombobox: _controller,
            list: quoteController.listCategory,
            valueName: (element) => element.categoryCode!,
            valueId: (element) => element.categoryId!,
            valueSend: quoteController.categoryId.value),
        const Icon(
          Icons.search,
          size: 12,
        ),
      ],
    );
  }
}
