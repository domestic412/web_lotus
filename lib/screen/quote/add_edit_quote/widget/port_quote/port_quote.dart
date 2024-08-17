import 'package:flutter/material.dart';
import 'package:web_lotus/controller/init_quote_controller.dart';
import 'package:web_lotus/model/model_init_quote.dart';

import 'import_button.dart';

class PortQuote extends StatefulWidget {
  const PortQuote({super.key});

  @override
  State<PortQuote> createState() => _PortQuoteState();
}

class _PortQuoteState extends State<PortQuote> {
  // PortQuotes? selectPort;
  CurrencyQuotes? selectCurrency;
  int j = 0;

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
            // List listports = snapshot.data!.portQuotes!;
            // final List<DropdownMenuEntry<PortQuotes>> portEntries =
            //     <DropdownMenuEntry<PortQuotes>>[];
            // for (final port in listports) {
            //   portEntries.add(
            //     DropdownMenuEntry<PortQuotes>(
            //       value: port,
            //       label: port.code,
            //     ),
            //   );
            // }
            List listcurrency = snapshot.data!.currencyQuotes!;
            final List<DropdownMenuEntry<CurrencyQuotes>> currencyEntries =
                <DropdownMenuEntry<CurrencyQuotes>>[];
            for (final currency in listcurrency) {
              currencyEntries.add(
                DropdownMenuEntry<CurrencyQuotes>(
                  value: currency,
                  label: currency.currency,
                ),
              );
            }
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // _buildPortDepSection(),
                  _buildQuoteNoSection(),
                  _buildCurrencySection(currencyEntries),
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

  Container _buildCurrencySection(
      List<DropdownMenuEntry<CurrencyQuotes>> currencyEntries) {
    return Container(
      constraints: BoxConstraints(minWidth: 250),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: 10),
            child: Text('Currency'),
          ),
          DropdownMenu<CurrencyQuotes>(
            width: 150,
            menuHeight: 500,
            enableFilter: true,
            enableSearch: true,
            dropdownMenuEntries: currencyEntries,
            onSelected: (CurrencyQuotes? currency) {
              selectCurrency = currency;
              quoteController.currency.value = selectCurrency?.currency ?? '';
            },
          )
        ],
      ),
    );
  }

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

  // Widget _buildPortDepSection() {
  //   return Container(
  //     constraints: BoxConstraints(minWidth: 250),
  //     // margin: EdgeInsets.only(right: 50),
  //     child: Row(
  //       children: [
  //         Container(
  //           margin: EdgeInsets.only(right: 10),
  //           child: Text('Port/Dep'),
  //         ),
  //         // DropdownMenu<PortQuotes>(
  //         //   width: 150,
  //         //   menuHeight: 500,
  //         //   // controller: quoteController.port_select.value,
  //         //   enableFilter: true,
  //         //   enableSearch: true,
  //         //   // label: Text('Port/Dep'.tr),
  //         //   dropdownMenuEntries: portEntries,
  //         //   onSelected: (PortQuotes? port) {
  //         //     // setState(() {
  //         //     selectPort = port;
  //         //     quoteController.portDepotId.value =
  //         //         selectPort?.portDepotId ?? '';
  //         //     // });
  //         //   },
  //         // ),
  //         Container(
  //             width: 150,
  //             padding: EdgeInsets.symmetric(vertical: 13, horizontal: 13),
  //             decoration: BoxDecoration(
  //                 color: Colors.black12,
  //                 // border: Border.all(
  //                 //   width: 0.5,
  //                 //   color: Colors.black87
  //                 // ),
  //                 borderRadius: BorderRadius.circular(5)),
  //             child: Text(
  //               'VNVIC',
  //               style: TextStyle(color: Colors.black54),
  //             ))
  //       ],
  //     ),
  //   );
  // }
}
