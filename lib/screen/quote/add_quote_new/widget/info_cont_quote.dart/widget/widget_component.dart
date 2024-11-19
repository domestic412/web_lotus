import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:web_lotus/assets/style.dart';
import 'package:web_lotus/controller/init_quote_controller.dart';
import 'package:web_lotus/model/model_init_quote.dart';
import 'package:web_lotus/widgets/container/ContainerLabel.dart';

class WidgetComponent extends StatefulWidget {
  const WidgetComponent({super.key});

  @override
  State<WidgetComponent> createState() => _WidgetComponentState();
}

class _WidgetComponentState extends State<WidgetComponent> {
  // ComponentQuotes? selectComponent;
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // final List<DropdownMenuEntry<ComponentQuotes>> componentEntries =
    //     <DropdownMenuEntry<ComponentQuotes>>[];
    // for (final component in quoteController.listComponent) {
    //   componentEntries.add(
    //     DropdownMenuEntry<ComponentQuotes>(
    //       value: component,
    //       label: component.component!,
    //     ),
    //   );
    // }
    return Row(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        WidgetContainerLabel(label: 'Component'),
        Container(
          width: 100,
          margin: const EdgeInsets.all(5),
          child: TypeAheadField<ComponentQuotes>(
            animationDuration: const Duration(milliseconds: 0),
            autoFlipDirection: true,
            suggestionsCallback: (search) => quoteController.listComponent
                .where((element) => element.componentCode!
                    .toLowerCase()
                    .contains(search.toLowerCase()))
                .toList(),
            builder: (context, controller, focusNode) {
              _controller = controller;
              return TextField(
                controller: _controller,
                focusNode: focusNode,
                style: const TextStyle(fontSize: 12),
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(8),
                  isDense: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                    Radius.circular(0.0),
                  )),
                ),
              );
            },
            itemBuilder: (context, value) => ListTile(
              dense: true,
              title: Text(
                value.componentCode!,
                style: style12_black,
              ),
            ),
            onSelected: (value) {
              _controller.text = value.componentCode!;
              quoteController.componentName.value = value.componentCode!;
              quoteController.componentId.value = value.componentId!;
            },
          ),
        ),
        const Icon(
          Icons.search,
          size: 12,
        ),
        // Text('Component'),
        // SizedBox(
        //   height: 5,
        // ),
        // Container(
        //   width: 200,
        //   child: DropdownMenu<ComponentQuotes>(
        //     menuHeight: 500,
        //     enableFilter: true,
        //     enableSearch: true,
        //     inputDecorationTheme: InputDecorationTheme(
        //       isDense: true,
        //       constraints: BoxConstraints(maxHeight: 40, maxWidth: 200),
        //       border: OutlineInputBorder(
        //         borderRadius: BorderRadius.circular(5),
        //       ),
        //     ),
        //     dropdownMenuEntries: componentEntries,
        //     onSelected: (ComponentQuotes? component) {
        //       selectComponent = component;
        //       quoteController.componentId.value =
        //           selectComponent?.componentId ?? '';
        //       quoteController.componentName.value =
        //           selectComponent?.componentCode ?? '';
        //     },
        //   ),
        // ),
      ],
    );
  }
}
