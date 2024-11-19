import 'package:flutter/material.dart';
import 'package:web_lotus/controller/init_quote_controller.dart';
import 'package:web_lotus/model/model_init_quote.dart';

class WidgetCharge extends StatefulWidget {
  const WidgetCharge({super.key});

  @override
  State<WidgetCharge> createState() => _WidgetChargeState();
}

class _WidgetChargeState extends State<WidgetCharge> {
  ChargeTypeQuotes? selectCharge;
  @override
  Widget build(BuildContext context) {
    final List<DropdownMenuEntry<ChargeTypeQuotes>> chargeEntries =
        <DropdownMenuEntry<ChargeTypeQuotes>>[];
    for (final charge in quoteController.listCharge) {
      chargeEntries.add(
        DropdownMenuEntry<ChargeTypeQuotes>(
          value: charge,
          label: charge.chargeType!,
        ),
      );
    }
    return Container(
      margin: EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Charge'),
          SizedBox(
            height: 5,
          ),
          Container(
            width: 200,
            child: DropdownMenu<ChargeTypeQuotes>(
              menuHeight: 500,
              inputDecorationTheme: InputDecorationTheme(
                isDense: true,
                constraints: BoxConstraints(maxHeight: 40, maxWidth: 200),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              dropdownMenuEntries: chargeEntries,
              onSelected: (ChargeTypeQuotes? charge) {
                selectCharge = charge;
                quoteController.chargeTypeId.value =
                    selectCharge?.chargeTypeId ?? '';
                quoteController.chargeName.value =
                    selectCharge?.chargeTypeCode ?? '';
              },
            ),
          ),
        ],
      ),
    );
  }
}
