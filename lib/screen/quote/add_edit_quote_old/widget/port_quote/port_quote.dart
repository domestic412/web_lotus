// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// import 'widget/import_button.dart';
// import 'widget/widget_currency.dart';
// import 'widget/widget_exRate.dart';
// import 'widget/widget_quoteNo.dart';

// class PortQuote extends StatefulWidget {
//   const PortQuote({super.key});

//   @override
//   State<PortQuote> createState() => _PortQuoteState();
// }

// class _PortQuoteState extends State<PortQuote> {
//   // CurrencyQuotes? selectCurrency;
//   // int j = 0;

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           WidgetQuoteNo(),
//           WidgetCurrency(),
//           WidgetExRate(),
//           ImportButton()
//         ],
//       ),
//     );
//   }

//   // FutureBuilder<InitEQCQuote> buildPortQuote() {
//   //   return FutureBuilder<InitEQCQuote>(
//   //       future: quoteController.initEQC,
//   //       builder: (context, snapshot) {
//   //         if (snapshot.connectionState == ConnectionState.waiting) {
//   //           return Center(child: CircularProgressIndicator());
//   //         }
//   //         if (snapshot.hasData) {
//   //           // List listcurrency = snapshot.data!.currencyQuotes!;
//   //           List<CurrencyQuotes> listcurrency = quoteController.listCurrency;
//   //           final List<DropdownMenuEntry<CurrencyQuotes>> currencyEntries =
//   //               <DropdownMenuEntry<CurrencyQuotes>>[];
//   //           for (final currency in listcurrency) {
//   //             currencyEntries.add(
//   //               DropdownMenuEntry<CurrencyQuotes>(
//   //                 value: currency,
//   //                 label: currency.currency!,
//   //               ),
//   //             );
//   //           }
//   //           return SingleChildScrollView(
//   //             scrollDirection: Axis.horizontal,
//   //             child: Row(
//   //               mainAxisAlignment: MainAxisAlignment.start,
//   //               children: [
//   //                 _buildQuoteNoSection(),
//   //                 _buildCurrencySection(currencyEntries),
//   //                 // _buildCurrencySection(),
//   //                 _buildExRateSection(),
//   //                 ImportButton()
//   //               ],
//   //             ),
//   //           );
//   //         }
//   //         return Text('Error');
//   //       });
//   // }

//   // Container _buildExRateSection() {
//   //   return Container(
//   //     constraints: BoxConstraints(minWidth: 150),
//   //     child: Row(children: [
//   //       Container(
//   //         margin: EdgeInsets.only(right: 10),
//   //         child: Text('Ex. Rate'),
//   //       ),
//   //       Container(
//   //         width: 100,
//   //         margin: EdgeInsets.only(right: 100),
//   //         child: TextField(
//   //           controller: quoteController.exRate.value,
//   //           decoration:
//   //               InputDecoration(isDense: true, border: OutlineInputBorder()),
//   //         ),
//   //       )
//   //     ]),
//   //   );
//   // }

//   // Container _buildCurrencySection(
//   //     List<DropdownMenuEntry<CurrencyQuotes>> currencyEntries) {
//   //   return Container(
//   //     constraints: BoxConstraints(minWidth: 250),
//   //     child: Row(
//   //       children: [
//   //         Container(
//   //           margin: EdgeInsets.only(right: 10),
//   //           child: Text('Currency'),
//   //         ),
//   //         DropdownMenu<CurrencyQuotes>(
//   //           width: 150,
//   //           menuHeight: 500,
//   //           enableFilter: true,
//   //           enableSearch: true,
//   //           dropdownMenuEntries: currencyEntries,
//   //           onSelected: (CurrencyQuotes? currency) {
//   //             selectCurrency = currency;
//   //             quoteController.currency.value = selectCurrency?.currency ?? '';
//   //           },
//   //         )
//   //       ],
//   //     ),
//   //   );
//   // }

//   // Container _buildQuoteNoSection() {
//   //   return Container(
//   //     constraints: BoxConstraints(minWidth: 250),
//   //     child: Row(
//   //       children: [
//   //         Container(
//   //             margin: EdgeInsets.only(right: 10), child: Text('Quote No.')),
//   //         Container(
//   //             width: 150,
//   //             padding: EdgeInsets.symmetric(vertical: 13, horizontal: 13),
//   //             decoration: BoxDecoration(
//   //                 color: Colors.black12,
//   //                 borderRadius: BorderRadius.circular(5)),
//   //             child: Text(
//   //               quoteController.quoteNo.value,
//   //               style: TextStyle(color: Colors.black54),
//   //             ))
//   //       ],
//   //     ),
//   //   );
//   // }
// }

// // class User {
// //   final String name;
// //   final int id;

// //   User({required this.name, required this.id});

// //   @override
// //   String toString() {
// //     return 'User(name: $name, id: $id)';
// //   }
// // }
