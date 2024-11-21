import 'package:web_lotus/controller/init_quote_controller.dart';

findChargeName({required String chargeId}) {
  for (var charge in quoteController.listCharge) {
    if (charge.chargeTypeId!.trim() == chargeId.trim()) {
      return charge.chargeTypeCode;
    }
  }
}

findComponentName({required String componentId}) {
  for (var component in quoteController.listComponent) {
    if (component.componentId!.trim() == componentId.trim()) {
      return component.componentCode;
    }
  }
}

findErrorName({required String errorId}) {
  for (var error in quoteController.listError) {
    if (error.errorId!.trim() == errorId.trim()) {
      return error.errorCode;
    }
  }
}

findCategoryName({required String categoryId}) {
  for (var category in quoteController.listCategory) {
    if (category.categoryId!.trim() == categoryId.trim()) {
      return category.categoryCode;
    }
  }
}
