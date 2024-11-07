import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:web_lotus/assets/style.dart';
import 'package:web_lotus/controller/init_quote_controller.dart';
import 'package:web_lotus/model/model_init_quote.dart';

class WidgetCurrency extends StatefulWidget {
  const WidgetCurrency({super.key});

  @override
  State<WidgetCurrency> createState() => _WidgetCurrencyState();
}

class _WidgetCurrencyState extends State<WidgetCurrency> {
  CurrencyQuotes? selectCurrency;
  @override
  Widget build(BuildContext context) {
    List<CurrencyQuotes> listcurrency = quoteController.listCurrency;
    final List<DropdownMenuEntry<CurrencyQuotes>> currencyEntries =
        <DropdownMenuEntry<CurrencyQuotes>>[];
    for (final currency in listcurrency) {
      currencyEntries.add(
        DropdownMenuEntry<CurrencyQuotes>(
          value: currency,
          label: currency.currency!,
        ),
      );
    }
    return _buildCurrencySection(currencyEntries);
  }

  Container _buildCurrencySection(
      List<DropdownMenuEntry<CurrencyQuotes>> currencyEntries) {
    // List<CurrencyQuotes> listcurrency = quoteController.listCurrency;
    return Container(
      constraints: BoxConstraints(minWidth: 200),
      child: Row(
        children: [
          Container(
            width: 100,
            margin: EdgeInsets.only(right: 5),
            padding: EdgeInsets.all(5),
            color: Color.fromARGB(255, 92, 117, 160),
            child: Text(
              'Currency',
              style: style12_white,
            ),
          ),
          DropdownMenu<CurrencyQuotes>(
            menuHeight: 500,
            enableFilter: true,
            enableSearch: true,
            trailingIcon: SizedBox.shrink(),
            inputDecorationTheme: InputDecorationTheme(
              isDense: true,
              constraints: BoxConstraints(maxHeight: 30, maxWidth: 100),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black26)),
            ),
            dropdownMenuEntries: currencyEntries,
            onSelected: (CurrencyQuotes? currency) {
              selectCurrency = currency;
              quoteController.currency.value = selectCurrency?.currency ?? '';
            },
          ),
          // SizedBox(
          //   width: 10,
          // ),
          // Container(
          //   width: 150,
          //   height: 40,
          //   child: DropdownButtonFormField<CurrencyQuotes>(
          //       value: selectCurrency,
          //       items: listcurrency.map((CurrencyQuotes currency) {
          //         return DropdownMenuItem<CurrencyQuotes>(
          //             value: currency, child: Text(currency.currency!));
          //       }).toList(),
          //       onChanged: (CurrencyQuotes? currency) {
          //         selectCurrency = currency;
          //         quoteController.currency.value =
          //             selectCurrency?.currency ?? '';
          //       }),
          // )
        ],
      ),
    );
  }
}
