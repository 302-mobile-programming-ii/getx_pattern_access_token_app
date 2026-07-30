import 'package:get/get.dart';
import 'package:getx_pattern_access_token_app/data/local/store_token.dart';

class SplashController extends GetxController {
  var onLoading = true.obs;
  @override
  void onInit() {
    _checkToken();
    super.onInit();
  }

  _checkToken() async {
    onLoading.value = true;
    await Future.delayed(Duration(seconds: 2));
    if (StoreToken.getToken().isNotEmpty) {
      Get.offNamed("/home");
    } else {
      Get.offNamed("/auth");
    }
    onLoading.value = false;
  }
}
