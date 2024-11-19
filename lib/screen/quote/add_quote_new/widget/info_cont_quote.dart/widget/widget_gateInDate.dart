import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_popup/flutter_popup.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:web_lotus/assets/color.dart';
import 'package:web_lotus/assets/style.dart';
import 'package:web_lotus/assets/variable.dart';
import 'package:web_lotus/controller/init_quote_controller.dart';
import 'package:web_lotus/widgets/container/ContainerLabel.dart';

class WidgetGetInDate extends StatefulWidget {
  const WidgetGetInDate({super.key});

  @override
  State<WidgetGetInDate> createState() => _WidgetGetInDateState();
}

class _WidgetGetInDateState extends State<WidgetGetInDate> {
  @override
  void initState() {
    super.initState();
    quoteController.gateInDate_text.value =
        changeDatetoShow(date: DateTime.now());
    quoteController.gateInDate_send.value =
        changeDatetoSend(date: DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        WidgetContainerLabel(label: 'Gate In Date'),
        CustomPopup(
          showArrow: false,
          content: SizedBox(
            height: 250,
            width: 250,
            child: CalendarDatePicker(
              initialDate:
                  dateFormat.parse(quoteController.gateInDate_text.value),
              firstDate: DateTime(2024),
              lastDate: DateTime(2123),
              onDateChanged: (value) {
                quoteController.gateInDate_text.value =
                    DateFormat('dd/MM/yyyy').format(value);
                quoteController.gateInDate_send.value =
                    DateFormat('MM/dd/yyyy').format(value);
                setState(() {
                  Get.back();
                });
              },
            ),
          ),
          child: Container(
            width: 100,
            height: 28,
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
            child: Text(
              quoteController.gateInDate_text.value,
              style: style12_black,
            ),
          ),
        ),
      ],
    );
  }
}
