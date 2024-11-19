import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:web_lotus/controller/init_quote_controller.dart';
import 'package:web_lotus/model/model_init_quote.dart';

class WidgetComponent extends StatefulWidget {
  const WidgetComponent({super.key});

  @override
  State<WidgetComponent> createState() => _WidgetComponentState();
}

class _WidgetComponentState extends State<WidgetComponent> {
  ComponentQuotes? selectComponent;
  @override
  Widget build(BuildContext context) {
    final List<DropdownMenuEntry<ComponentQuotes>> componentEntries =
        <DropdownMenuEntry<ComponentQuotes>>[];
    for (final component in quoteController.listComponent) {
      componentEntries.add(
        DropdownMenuEntry<ComponentQuotes>(
          value: component,
          label: component.component!,
        ),
      );
    }
    return Container(
        margin: EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Component'),
            SizedBox(
              height: 5,
            ),
            Container(
              width: 200,
              child: DropdownMenu<ComponentQuotes>(
                menuHeight: 500,
                enableFilter: true,
                enableSearch: true,
                inputDecorationTheme: InputDecorationTheme(
                  isDense: true,
                  constraints: BoxConstraints(maxHeight: 40, maxWidth: 200),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                dropdownMenuEntries: componentEntries,
                onSelected: (ComponentQuotes? component) {
                  selectComponent = component;
                  quoteController.componentId.value =
                      selectComponent?.componentId ?? '';
                  quoteController.componentName.value =
                      selectComponent?.componentCode ?? '';
                },
              ),
            ),
          ],
        ));
  }
}
