import 'package:get/get.dart';

DividerController dividerController = Get.put(DividerController());

class DividerController extends GetxController {
  var dividerPage = 'Tracking'.obs;
  var dividerCompQuote = 'QuoteList'.obs;
}
