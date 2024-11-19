import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:web_lotus/assets/style.dart';
import 'package:web_lotus/controller/init_quote_controller.dart';
import 'package:web_lotus/model/model_init_quote.dart';
import 'package:web_lotus/widgets/container/ContainerLabel.dart';

class WidgetCharge extends StatefulWidget {
  const WidgetCharge({super.key});

  @override
  State<WidgetCharge> createState() => _WidgetChargeState();
}

class _WidgetChargeState extends State<WidgetCharge> {
  // ChargeTypeQuotes? selectCharge;
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // final List<DropdownMenuEntry<ChargeTypeQuotes>> chargeEntries =
    //     <DropdownMenuEntry<ChargeTypeQuotes>>[];
    // for (final charge in quoteController.listCharge) {
    //   chargeEntries.add(
    //     DropdownMenuEntry<ChargeTypeQuotes>(
    //       value: charge,
    //       label: charge.chargeType!,
    //     ),
    //   );
    // }
    return Row(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        WidgetContainerLabel(label: 'Charge'),
        Container(
          width: 100,
          margin: const EdgeInsets.all(5),
          child: TypeAheadField<ChargeTypeQuotes>(
            animationDuration: const Duration(milliseconds: 0),
            autoFlipDirection: true,
            suggestionsCallback: (search) => quoteController.listCharge
                .where((element) => element.chargeTypeCode!
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
                value.chargeTypeCode!,
                style: style12_black,
              ),
            ),
            onSelected: (value) {
              _controller.text = value.chargeTypeCode!;
              quoteController.chargeName.value = value.chargeTypeCode!;
              quoteController.chargeTypeId.value = value.chargeTypeId!;
            },
          ),
        ),
        const Icon(
          Icons.search,
          size: 12,
        ),
        // Container(
        //   width: 200,
        //   child: DropdownMenu<ChargeTypeQuotes>(
        //     menuHeight: 500,
        //     inputDecorationTheme: InputDecorationTheme(
        //       isDense: true,
        //       constraints: BoxConstraints(maxHeight: 40, maxWidth: 200),
        //       border: OutlineInputBorder(
        //         borderRadius: BorderRadius.circular(5),
        //       ),
        //     ),
        //     dropdownMenuEntries: chargeEntries,
        //     onSelected: (ChargeTypeQuotes? charge) {
        //       selectCharge = charge;
        //       quoteController.chargeTypeId.value =
        //           selectCharge?.chargeTypeId ?? '';
        //       quoteController.chargeName.value =
        //           selectCharge?.chargeTypeCode ?? '';
        //     },
        //   ),
        // ),
      ],
    );
  }
}
