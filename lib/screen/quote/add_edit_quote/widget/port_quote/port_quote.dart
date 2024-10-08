import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:web_lotus/assets/color.dart';
import 'package:web_lotus/controller/init_quote_controller.dart';
import 'package:web_lotus/model/model_init_quote.dart';

import 'import_button.dart';

class PortQuote extends StatefulWidget {
  const PortQuote({super.key});

  @override
  State<PortQuote> createState() => _PortQuoteState();
}

class _PortQuoteState extends State<PortQuote> {
  CurrencyQuotes? selectCurrency;
  // int j = 0;

  @override
  Widget build(BuildContext context) {
    return buildPortQuote();
  }

  FutureBuilder<InitEQCQuote> buildPortQuote() {
    return FutureBuilder<InitEQCQuote>(
        future: quoteController.initEQC,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasData) {
            // List listcurrency = snapshot.data!.currencyQuotes!;
            // final List<DropdownMenuEntry<CurrencyQuotes>> currencyEntries =
            //     <DropdownMenuEntry<CurrencyQuotes>>[];
            // for (final currency in listcurrency) {
            //   currencyEntries.add(
            //     DropdownMenuEntry<CurrencyQuotes>(
            //       value: currency,
            //       label: currency.currency,
            //     ),
            //   );
            // }
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _buildQuoteNoSection(),
                  // _buildCurrencySection(currencyEntries),
                  _buildCurrencySection(),
                  _buildExRateSection(),
                  ImportButton()
                ],
              ),
            );
          }
          return Text('Error');
        });
  }

  Container _buildExRateSection() {
    return Container(
      constraints: BoxConstraints(minWidth: 150),
      child: Row(children: [
        Container(
          margin: EdgeInsets.only(right: 10),
          child: Text('Ex. Rate'),
        ),
        Container(
          width: 60,
          margin: EdgeInsets.only(right: 100),
          child: TextField(
            controller: quoteController.exRate.value,
            decoration:
                InputDecoration(isDense: true, border: OutlineInputBorder()),
          ),
        )
      ]),
    );
  }

  // final List<String> items = [
  //   'Item1',
  //   'Item2',
  //   'Item3',
  //   'Item4',
  //   'Item5',
  //   'Item6',
  //   'Item7',
  //   'Item8',
  // ];
  // String? selectedValue;
  // final TextEditingController textEditingController = TextEditingController();

  Container _buildCurrencySection() {
    return Container(
        width: 200,
        decoration: BoxDecoration(
            border: Border.all(
              color: grey,
            ),
            borderRadius: BorderRadius.circular(5)),
        child: DropdownButtonHideUnderline(
          child: DropdownButton2<CurrencyQuotes>(
            isExpanded: true,
            hint: Text(
              'Select Item',
              style: TextStyle(
                fontSize: 14,
                color: Theme.of(context).hintColor,
              ),
            ),
            items: quoteController.listCurrency
                .map((item) => DropdownMenuItem(
                      value: item,
                      child: Text(
                        item.currency!,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ))
                .toList(),
            value: quoteController.listCurrency[0],
            onChanged: (value) {
              setState(() {
                quoteController.currency.value = value!.currency!;
              });
            },
            buttonStyleData: const ButtonStyleData(
              padding: EdgeInsets.symmetric(horizontal: 16),
              height: 40,
              width: 200,
            ),
            dropdownStyleData: const DropdownStyleData(
              maxHeight: 200,
            ),
            menuItemStyleData: const MenuItemStyleData(
              height: 40,
            ),
            // dropdownSearchData: DropdownSearchData(
            //   searchController: textEditingController,
            //   searchInnerWidgetHeight: 50,
            //   searchInnerWidget: Container(
            //     height: 50,
            //     padding: const EdgeInsets.only(
            //       top: 8,
            //       bottom: 4,
            //       right: 8,
            //       left: 8,
            //     ),
            //     child: TextFormField(
            //       expands: true,
            //       maxLines: null,
            //       autofocus: true,
            //       controller: textEditingController,
            //       decoration: InputDecoration(
            //         isDense: true,
            //         contentPadding: const EdgeInsets.symmetric(
            //           horizontal: 10,
            //           vertical: 8,
            //         ),
            //         hintText: 'Search for an item...',
            //         hintStyle: const TextStyle(fontSize: 12),
            //         border: OutlineInputBorder(
            //           borderRadius: BorderRadius.circular(8),
            //         ),
            //       ),
            //     ),
            //   ),
            //   searchMatchFn: (item, searchValue) {
            //     return item.value.toString().contains(searchValue);
            //   },
            // ),
            // This to clear the search value when you close the menu
            // onMenuStateChange: (isOpen) {
            //   if (!isOpen) {
            //     textEditingController.clear();
            //   }
            // },
          ),
        ));
  }

  // Container _buildCurrencySection(
  //     List<DropdownMenuEntry<CurrencyQuotes>> currencyEntries) {
  //   return Container(
  //     constraints: BoxConstraints(minWidth: 250),
  //     child: Row(
  //       children: [
  //         Container(
  //           margin: EdgeInsets.only(right: 10),
  //           child: Text('Currency'),
  //         ),
  //         DropdownMenu<CurrencyQuotes>(
  //           width: 150,
  //           menuHeight: 500,
  //           enableFilter: true,
  //           enableSearch: true,
  //           dropdownMenuEntries: currencyEntries,
  //           onSelected: (CurrencyQuotes? currency) {
  //             selectCurrency = currency;
  //             quoteController.currency.value = selectCurrency?.currency ?? '';
  //           },
  //         )
  //       ],
  //     ),
  //   );
  // }

  Container _buildQuoteNoSection() {
    return Container(
      constraints: BoxConstraints(minWidth: 250),
      child: Row(
        children: [
          Container(
              margin: EdgeInsets.only(right: 10), child: Text('Quote No.')),
          Container(
              width: 150,
              padding: EdgeInsets.symmetric(vertical: 13, horizontal: 13),
              decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(5)),
              child: Text(
                quoteController.quoteNo.value,
                style: TextStyle(color: Colors.black54),
              ))
        ],
      ),
    );
  }
}

class User {
  final String name;
  final int id;

  User({required this.name, required this.id});

  @override
  String toString() {
    return 'User(name: $name, id: $id)';
  }
}
