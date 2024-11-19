import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:web_lotus/assets/style.dart';
import 'package:web_lotus/controller/init_quote_controller.dart';
import 'package:web_lotus/model/model_init_quote.dart';
import 'package:web_lotus/widgets/container/ContainerLabel.dart';

class WidgetError extends StatefulWidget {
  const WidgetError({super.key});

  @override
  State<WidgetError> createState() => _WidgetErrorState();
}

class _WidgetErrorState extends State<WidgetError> {
  // ErrorQuotes? selectError;
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // final List<DropdownMenuEntry<ErrorQuotes>> errorEntries =
    //     <DropdownMenuEntry<ErrorQuotes>>[];
    // for (final error in quoteController.listError) {
    //   errorEntries.add(
    //     DropdownMenuEntry<ErrorQuotes>(
    //       value: error,
    //       label: error.error!,
    //     ),
    //   );
    // }
    return Row(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        WidgetContainerLabel(label: 'Damage'),
        Container(
          width: 100,
          margin: const EdgeInsets.all(5),
          child: TypeAheadField<ErrorQuotes>(
            animationDuration: const Duration(milliseconds: 0),
            autoFlipDirection: true,
            suggestionsCallback: (search) => quoteController.listError
                .where((element) => element.errorCode!
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
                value.errorCode!,
                style: style12_black,
              ),
            ),
            onSelected: (value) {
              _controller.text = value.errorCode!;
              quoteController.errorName.value = value.errorCode!;
              quoteController.errorId.value = value.errorId!;
            },
          ),
        ),
        const Icon(
          Icons.search,
          size: 12,
        ),
        // Text('Damage Code'),
        // SizedBox(
        //   height: 5,
        // ),
        // Container(
        //   width: 200,
        //   child: DropdownMenu<ErrorQuotes>(
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
        //     dropdownMenuEntries: errorEntries,
        //     onSelected: (ErrorQuotes? error) {
        //       selectError = error;
        //       quoteController.errorId.value = selectError?.errorId ?? '';
        //       quoteController.errorName.value =
        //           selectError?.errorCode ?? '';
        //     },
        //   ),
        // )
      ],
    );
  }
}
