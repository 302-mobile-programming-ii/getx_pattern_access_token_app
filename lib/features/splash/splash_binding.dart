import 'package:get/get.dart';
import 'package:getx_pattern_access_token_app/features/splash/splash_controller.dart';

class SplashBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(()=> SplashController());
  }

}