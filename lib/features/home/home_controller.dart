import 'dart:ui';

import 'package:get/get.dart';
import 'package:getx_pattern_access_token_app/constants/constants.dart';

class HomeController extends GetxController {
  var loading = false.obs;
  onChangeLanguage() {
    if (Get.locale?.languageCode == Constants.km) {
      var locale = Locale(Constants.en, Constants.US);
      Get.updateLocale(locale);
    } else {
      var locale = Locale(Constants.km, Constants.KM);
      Get.updateLocale(locale);
    }
  }
}
