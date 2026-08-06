import 'package:get/get.dart';
import 'package:getx_pattern_access_token_app/features/admin/post/list/post_controller.dart';
import 'package:getx_pattern_access_token_app/features/home/home_controller.dart';

class PostFormBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => PostFormBinding());
  }
}
