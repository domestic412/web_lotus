// import 'dart:math';

// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_typeahead/flutter_typeahead.dart';
// import 'package:web_lotus/assets/style.dart';
// import 'package:web_lotus/controller/init_quote_controller.dart';
// import 'package:web_lotus/model/model_init_quote.dart';
// import 'package:web_lotus/widgets/container/ContainerLabel.dart';
// import 'package:web_lotus/widgets/container/combobox.dart';

// class WidgetCurrency extends StatefulWidget {
//   const WidgetCurrency({super.key});

//   @override
//   State<WidgetCurrency> createState() => _WidgetCurrencyState();
// }

// class _WidgetCurrencyState extends State<WidgetCurrency> {
//   TextEditingController _controller = TextEditingController();
//   // CurrencyQuotes? selectCurrency;
//   @override
//   Widget build(BuildContext context) {
//     // List<CurrencyQuotes> listcurrency = quoteController.listCurrency;
//     // final List<DropdownMenuEntry<CurrencyQuotes>> currencyEntries =
//     //     <DropdownMenuEntry<CurrencyQuotes>>[];
//     // for (final currency in listcurrency) {
//     //   currencyEntries.add(
//     //     DropdownMenuEntry<CurrencyQuotes>(
//     //       value: currency,
//     //       label: currency.currency!,
//     //     ),
//     //   );
//     // }
//     return WidgetCurrency();
//     // _buildCurrencySection(currencyEntries);
//   }

//   // Container _buildCurrencySection(
//   //     List<DropdownMenuEntry<CurrencyQuotes>> currencyEntries) {
//   //   // List<CurrencyQuotes> listcurrency = quoteController.listCurrency;
//   //   return Container(
//   //     constraints: BoxConstraints(minWidth: 200),
//   //     child: Row(
//   //       children: [
//   //         Container(
//   //           width: 100,
//   //           margin: EdgeInsets.only(right: 5),
//   //           padding: EdgeInsets.all(5),
//   //           color: Color.fromARGB(255, 92, 117, 160),
//   //           child: Text(
//   //             'Currency',
//   //             style: style12_white,
//   //           ),
//   //         ),
//   //         DropdownMenu<CurrencyQuotes>(
//   //           menuHeight: 500,
//   //           enableFilter: true,
//   //           enableSearch: true,
//   //           trailingIcon: SizedBox.shrink(),
//   //           inputDecorationTheme: InputDecorationTheme(
//   //             isDense: true,
//   //             constraints: BoxConstraints(maxHeight: 30, maxWidth: 100),
//   //             border: OutlineInputBorder(
//   //                 borderSide: BorderSide(color: Colors.black26)),
//   //           ),
//   //           dropdownMenuEntries: currencyEntries,
//   //           onSelected: (CurrencyQuotes? currency) {
//   //             selectCurrency = currency;
//   //             quoteController.currency.value = selectCurrency?.currency ?? '';
//   //           },
//   //         ),
//   //       ],
//   //     ),
//   //   );
//   // }

//   WidgetCurrency() {
//     return Row(
//       children: [
//         WidgetContainerLabel(label: 'Currency'),
//         Combobox<CurrencyQuotes>(
//             controllerCombobox: _controller,
//             list: quoteController.listCurrency,
//             valueName: (element) => element.currency!,
//             valueShow: quoteController.currency.value),
//         // Container(
//         //   width: 100,
//         //   margin: const EdgeInsets.all(5),
//         //   child: TypeAheadField<CurrencyQuotes>(
//         //     animationDuration: const Duration(milliseconds: 0),
//         //     autoFlipDirection: true,
//         //     suggestionsCallback: (search) => quoteController.listCurrency
//         //         .where((element) => element.currency!
//         //             .toUpperCase()
//         //             .contains(search.toUpperCase()))
//         //         .toList(),
//         //     builder: (context, controller, focusNode) {
//         //       _controller = controller;
//         //       _controller.clear();
//         //       return TextField(
//         //         controller: _controller,
//         //         focusNode: focusNode,
//         //         style: const TextStyle(fontSize: 12),
//         //         decoration: const InputDecoration(
//         //           contentPadding: EdgeInsets.all(8),
//         //           isDense: true,
//         //           border: OutlineInputBorder(
//         //               borderRadius: BorderRadius.all(
//         //             Radius.circular(0.0),
//         //           )),
//         //         ),
//         //       );
//         //     },
//         //     itemBuilder: (context, value) => ListTile(
//         //       dense: true,
//         //       title: Text(
//         //         value.currency!,
//         //         style: style12_black,
//         //       ),
//         //     ),
//         //     onSelected: (value) {
//         //       _controller.text = value.currency!;
//         //       quoteController.currency.value = value.currency ?? '';
//         //     },
//         //   ),
//         // ),
//       ],
//     );
//   }
// }
