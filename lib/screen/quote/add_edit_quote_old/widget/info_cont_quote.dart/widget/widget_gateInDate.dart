import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_popup/flutter_popup.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:web_lotus/assets/color.dart';
import 'package:web_lotus/assets/variable.dart';
import 'package:web_lotus/controller/init_quote_controller.dart';

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
    return Container(
      margin: EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Gate In Date'),
          SizedBox(
            height: 5,
          ),
          CustomPopup(
            showArrow: false,
            content: SizedBox(
              width: 300,
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
              decoration: BoxDecoration(
                  border: Border.all(color: grey),
                  borderRadius: BorderRadius.circular(5)),
              // margin: EdgeInsets.symmetric(horizontal: 10),
              padding: const EdgeInsets.all(10),
              child: Text(quoteController.gateInDate_text.value),
            ),
          ),
        ],
      ),
    );
  }
}
