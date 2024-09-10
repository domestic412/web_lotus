import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:web_lotus/model/model_init_quote.dart';
import 'package:web_lotus/model/model_input_quote_detail.dart';

final QuoteController quoteController = Get.put(QuoteController());

class QuoteController extends GetxController {
  Future<InitEQCQuote>? initEQC;

  RxList<ChargeTypeQuotes> listCharge = <ChargeTypeQuotes>[].obs;
  RxList<ComponentQuotes> listComponent = <ComponentQuotes>[].obs;
  RxList<ErrorQuotes> listError = <ErrorQuotes>[].obs;
  RxList<CategoryQuotes> listCategory = <CategoryQuotes>[].obs;

  var boolApprove = false.obs;

  var currentDate_send = ''.obs;
  RxList<XFile>? listImg;
  var pathImg = ''.obs;

  var fromDate = TextEditingController().obs;
  var toDate = TextEditingController().obs;

  var fromDate_send = ''.obs;
  var toDate_send = ''.obs;

  var eqcQuoteId = ''.obs;
  var quoteNo = ''.obs;

// var port_select = TextEditingController().obs;
  var portDepotId = '84B9B9A3-99CE-4865-81B7-74070F075EAB'.obs;

// var currency_select = TextEditingController().obs;
  var currency = ''.obs;

  var exRate = TextEditingController().obs;

  var chargeName = ''.obs;
  var chargeTypeId = ''.obs;

  var container = TextEditingController().obs;

  var gateInDate = TextEditingController().obs;

  var gateInDate_send = ''.obs;

  var componentName = ''.obs;
  var componentId = ''.obs;

  var detailDamage = TextEditingController().obs;

  var errorName = ''.obs;
  var errorId = ''.obs;

  var quantity = TextEditingController().obs;

  var dimension = TextEditingController().obs;

  var length = TextEditingController().obs;

  var width = TextEditingController().obs;

  var location = TextEditingController().obs;

  var categoryName = ''.obs;
  var categoryId = ''.obs;

  var laborCost = TextEditingController().obs;

  var mrCost = TextEditingController().obs;

  var totalCost = TextEditingController().obs;

  var payerName = ''.obs;
  var payerId = 0.obs;

  var errorImport = 0.obs;
  var notify_error = ''.obs;

  RxList<InputQuoteDetail> listInputQuoteDetail = <InputQuoteDetail>[].obs;
  RxList<InputQuoteDetail> listInputQuoteDetail_show = <InputQuoteDetail>[].obs;
  var countRow = 0.obs;
}
