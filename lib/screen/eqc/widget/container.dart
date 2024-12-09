import 'package:flutter/material.dart';
import 'package:web_lotus/controller/init_quote_controller.dart';
import 'package:web_lotus/model/model_init_quote.dart';
import 'package:web_lotus/widgets/container/ContainerLabel.dart';
import 'package:web_lotus/widgets/container/WidgetTextField.dart';
import 'package:web_lotus/widgets/container/combobox.dart';

Row WidgetDepo({required TextEditingController controller}) {
  return Row(
    children: [
      WidgetContainerLabel(label: 'Depot'),
      WidgetTextField(controller: controller),
    ],
  );
}

Row WidgetQuoteNo({required TextEditingController controller}) {
  return Row(
    children: [
      WidgetContainerLabel(label: 'Quote No.'),
      WidgetTextField(controller: controller),
    ],
  );
}

Row WidgetCntr({required TextEditingController controller}) {
  return Row(
    children: [
      WidgetContainerLabel(label: 'Container'),
      WidgetTextField(controller: controller),
    ],
  );
}

Row WidgetCurrency({required TextEditingController controller}) {
  return Row(
    children: [
      WidgetContainerLabel(label: 'Currency'),
      Combobox<CurrencyQuotes>(
        controllerCombobox: controller,
        list: quoteController.listCurrency,
        valueName: (element) => element.currency!,
        onChanged: (p0) {},
      ),
    ],
  );
}

Row WidgetStatus({required TextEditingController controller}) {
  return Row(
    children: [
      WidgetContainerLabel(label: 'Status'),
      WidgetTextField(controller: controller),
    ],
  );
}

Row WidgetCharge({required TextEditingController controller}) {
  return Row(
    children: [
      WidgetContainerLabel(label: 'Charge'),
      Combobox<ChargeTypeQuotes>(
        controllerCombobox: controller,
        list: quoteController.listCharge,
        valueName: (element) => element.chargeTypeCode!,
        onChanged: (p0) {},
      ),
    ],
  );
}

Row WidgetComponent({required TextEditingController controller}) {
  return Row(
    children: [
      WidgetContainerLabel(label: 'Component'),
      Combobox<ComponentQuotes>(
        controllerCombobox: controller,
        list: quoteController.listComponent,
        valueName: (element) => element.componentCode!,
        onChanged: (p0) {},
      ),
    ],
  );
}

Row WidgetDamage({required TextEditingController controller}) {
  return Row(
    children: [
      WidgetContainerLabel(label: 'Damage'),
      Combobox<ErrorQuotes>(
        controllerCombobox: controller,
        list: quoteController.listError,
        valueName: (element) => element.errorCode!,
        onChanged: (p0) {},
      ),
    ],
  );
}

Row WidgetDamageDetail({required TextEditingController controller}) {
  return Row(
    children: [
      WidgetContainerLabel(label: 'Damage Detail'),
      WidgetTextField(controller: controller),
    ],
  );
}

Row WidgetCategory({required TextEditingController controller}) {
  return Row(
    children: [
      WidgetContainerLabel(label: 'Category'),
      Combobox<CategoryQuotes>(
        controllerCombobox: controller,
        list: quoteController.listCategory,
        valueName: (element) => element.categoryCode!,
        onChanged: (p0) {},
      ),
    ],
  );
}

Row WidgetLocation({required TextEditingController controller}) {
  return Row(
    children: [
      WidgetContainerLabel(label: 'Location'),
      WidgetTextField(controller: controller),
    ],
  );
}

Row WidgetPayer({required TextEditingController controller}) {
  return Row(
    children: [
      WidgetContainerLabel(label: 'Payer'),
      WidgetTextField(controller: controller),
    ],
  );
}
