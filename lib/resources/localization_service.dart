import 'package:get/get.dart';

import 'langs/st_en_US.dart';
import 'langs/st_vi_VN.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': en,
        'vi_VN': vi,
      };
}
