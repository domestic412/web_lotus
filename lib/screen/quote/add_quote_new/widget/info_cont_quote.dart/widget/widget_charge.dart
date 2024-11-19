import 'package:flutter/material.dart';
import 'package:web_lotus/controller/init_quote_controller.dart';
import 'package:web_lotus/model/model_init_quote.dart';
import 'package:web_lotus/widgets/container/combobox.dart';
import 'package:web_lotus/widgets/container/container_label.dart';

class WidgetCharge extends StatefulWidget {
  const WidgetCharge({super.key});

  @override
  State<WidgetCharge> createState() => _WidgetChargeState();
}

class _WidgetChargeState extends State<WidgetCharge> {
  // ChargeTypeQuotes? selectCharge;
  TextEditingController controllerCombobox = TextEditingController();
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
        ContainerLabel(label: 'Charge'),
        Combobox(
            controllerCombobox: controllerCombobox,
            list: quoteController.listCharge,
            valueName: 'chargeTypeCode',
            valueId: 'chargeTypeId',
            valueSend: quoteController.chargeTypeId.value)
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
