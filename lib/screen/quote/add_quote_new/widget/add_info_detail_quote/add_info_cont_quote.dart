import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:web_lotus/controller/init_quote_controller.dart';
import 'package:web_lotus/model/model_input_quote_detail.dart';
import 'package:web_lotus/screen/quote/add_quote_new/widget/add_info_quote/widget/search_name.dart';
import 'package:web_lotus/screen/quote/widget/upload_image_zip.dart';
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

class InfoContQuote extends StatelessWidget {
  InfoContQuote(this.refresh);
  final VoidCallback refresh;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
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
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.all(5),
              child: ElevatedButton(
                onPressed: () {
                  if (checkDigit(quoteController.container.value.text) ==
                      true) {
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

                    // quoteController.countRow.value =
                    //     quoteController.countRow.value + 1;

                    InputQuoteDetail _listInputQuoteDetail_show =
                        InputQuoteDetail(
                      chargeTypeId: findChargeName(
                          chargeId: quoteController.chargeTypeId.value),
                      componentId: findComponentName(
                          componentId: quoteController.componentId.value),
                      categoryId: findCategoryName(
                          categoryId: quoteController.categoryId.value),
                      errorId:
                          findErrorName(errorId: quoteController.errorId.value),
                      container: quoteController.container.value.text,
                      inGateDate: quoteController.gateInDate_text.value,
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
                      isImgUpload: false,
                    );
                    quoteController.listInputQuoteDetail_show
                        .add(_listInputQuoteDetail_show);
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
                        WidgetStatePropertyAll<Color>(Colors.orange),
                    minimumSize: WidgetStateProperty.all(Size(100, 40))),
                child: Text('ADD ROW'),
              ),
            ),
            Container(
              margin: EdgeInsets.all(5),
              child: ElevatedButton(
                  onPressed: () {
                    SelectFileZip(refresh);
                  },
                  child: Text('Upload Image (.zip)')),
            )
          ],
        ),
        Container(
          height: 10,
        )
      ],
    );
  }
}
