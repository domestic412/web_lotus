import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:web_lotus/controller/init_quote_controller.dart';
import 'package:web_lotus/model/model_input_quote_detail.dart';
import 'package:web_lotus/widgets/check_digit/check_digit.dart';

import 'widget/widget_category.dart';
import 'widget/widget_component.dart';
import 'widget/widget_gateInDate.dart';
import 'widget/widget_charge.dart';
import 'widget/widget_container.dart';
import 'widget/widget_demension.dart';
import 'widget/widget_detailDamage.dart';
import 'widget/widget_error.dart';
import 'widget/widget_laborCost.dart';
import 'widget/widget_length.dart';
import 'widget/widget_location.dart';
import 'widget/widget_mrCost.dart';
import 'widget/widget_quantity.dart';
import 'widget/widget_totalCost.dart';
import 'widget/widget_width.dart';

class InfoContQuote extends StatefulWidget {
  const InfoContQuote({super.key});

  @override
  State<InfoContQuote> createState() => _InfoContQuoteState();
}

class _InfoContQuoteState extends State<InfoContQuote> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.all(5),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WidgetContainer(),
              WidgetGetInDate(),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.all(5),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WidgetCharge(),
              WidgetComponent(),
              WidgetError(),
              WidgetDetailDamage(),
              WidgetQuantity(),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.all(5),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WidgetCategory(),
              WidgetLocation(),
              WidgetDemension(),
              WidgetLength(),
              WidgetWidth(),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.all(5),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WidgetLaborCost(),
              WidgetMrCost(),
              WidgetTotalCost(),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                if (checkDigit(quoteController.container.value.text) == true) {
                  InputQuoteDetail _listInputQuoteDetail = InputQuoteDetail(
                      eqcQuoteId: quoteController.eqcQuoteId.value,
                      chargeTypeId: quoteController.chargeTypeId.value,
                      componentId: quoteController.componentId.value,
                      categoryId: quoteController.categoryId.value,
                      errorId: quoteController.errorId.value,
                      container: quoteController.container.value.text,
                      inGateDate: quoteController.gateInDate_send.value,
                      damageDetail: quoteController.detailDamage.value.text,
                      quantity:
                          double.parse(quoteController.quantity.value.text),
                      dimension: quoteController.dimension.value.text,
                      length: double.parse(quoteController.length.value.text),
                      width: double.parse(quoteController.width.value.text),
                      location: quoteController.location.value.text,
                      laborCost:
                          double.parse(quoteController.laborCost.value.text),
                      mrCost: double.parse(quoteController.mrCost.value.text),
                      totalCost:
                          double.parse(quoteController.totalCost.value.text),
                      estimateDate: quoteController.currentDate_send.value,
                      isImgUpload: false,
                      edit: 'I');
                  quoteController.listInputQuoteDetail
                      .add(_listInputQuoteDetail);
                  quoteController.countRow.value =
                      quoteController.countRow.value + 1;

                  InputQuoteDetail _listInputQuoteDetail_show =
                      InputQuoteDetail(
                    chargeTypeId: quoteController.chargeName.value,
                    componentId: quoteController.componentName.value,
                    categoryId: quoteController.categoryName.value,
                    errorId: quoteController.errorName.value,
                    container: quoteController.container.value.text,
                    inGateDate: quoteController.gateInDate_text.value,
                    damageDetail: quoteController.detailDamage.value.text,
                    quantity: double.parse(quoteController.quantity.value.text),
                    dimension: quoteController.dimension.value.text,
                    length: double.parse(quoteController.length.value.text),
                    width: double.parse(quoteController.width.value.text),
                    location: quoteController.location.value.text,
                    laborCost:
                        double.parse(quoteController.laborCost.value.text),
                    mrCost: double.parse(quoteController.mrCost.value.text),
                    totalCost:
                        double.parse(quoteController.totalCost.value.text),
                    isImgUpload: false,
                  );
                  quoteController.listInputQuoteDetail_show
                      .add(_listInputQuoteDetail_show);
                  // print(quoteController.listInputQuoteDetail);
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      content: Text('Error Container Number'),
                    ),
                  );
                }
              },
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll<Color>(Colors.orange),
                  minimumSize: MaterialStateProperty.all(Size(100, 40))),
              child: Text('ADD ROW'),
            ),
          ],
        ),
        Container(
          height: 10,
        )
      ],
    );
  }
}
