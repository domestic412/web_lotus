import 'package:web_lotus/controller/init_quote_controller.dart';

findChargeId({required String chargeCode}) {
  for (var charge in quoteController.listCharge) {
    if (charge.chargeTypeCode!.trim() == chargeCode.trim()) {
      return charge.chargeTypeId;
    }
  }
}

findComponentId({required String componentCode}) {
  for (var component in quoteController.listComponent) {
    if (component.componentCode!.trim() == componentCode.trim()) {
      return component.componentId;
    }
  }
}

findErrorId({required String errorCode}) {
  for (var error in quoteController.listError) {
    if (error.errorCode!.trim() == errorCode.trim()) {
      return error.errorId;
    }
  }
}

findCategoryId({required String categoryCode}) {
  for (var category in quoteController.listCategory) {
    if (category.categoryCode!.trim() == categoryCode.trim()) {
      return category.categoryId;
    }
  }
}
