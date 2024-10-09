import 'package:flutter/material.dart';
import 'package:web_lotus/controller/init_quote_controller.dart';
import 'package:web_lotus/model/model_init_quote.dart';

class WidgetError extends StatefulWidget {
  const WidgetError({super.key});

  @override
  State<WidgetError> createState() => _WidgetErrorState();
}

class _WidgetErrorState extends State<WidgetError> {
  ErrorQuotes? selectError;
  @override
  Widget build(BuildContext context) {
    final List<DropdownMenuEntry<ErrorQuotes>> errorEntries =
        <DropdownMenuEntry<ErrorQuotes>>[];
    for (final error in quoteController.listError) {
      errorEntries.add(
        DropdownMenuEntry<ErrorQuotes>(
          value: error,
          label: error.error!,
        ),
      );
    }
    return Container(
        margin: EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Damage Code'),
            SizedBox(
              height: 5,
            ),
            Container(
              width: 200,
              child: DropdownMenu<ErrorQuotes>(
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
                dropdownMenuEntries: errorEntries,
                onSelected: (ErrorQuotes? error) {
                  selectError = error;
                  quoteController.errorId.value = selectError?.errorId ?? '';
                  quoteController.errorName.value =
                      selectError?.errorCode ?? '';
                },
              ),
            )
          ],
        ));
  }
}
