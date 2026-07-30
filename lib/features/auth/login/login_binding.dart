import 'package:get/get.dart';
import 'package:getx_pattern_access_token_app/features/auth/login/login_controller.dart';
import 'package:getx_pattern_access_token_app/features/home/home_controller.dart';

class LoginBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(()=> LoginController());
  }

}