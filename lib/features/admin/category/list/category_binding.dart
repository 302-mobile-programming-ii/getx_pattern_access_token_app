import 'package:get/get.dart';
import 'package:getx_pattern_access_token_app/features/admin/category/list/category_controller.dart';

class CategoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => CategoryController(categoryRepository: Get.find()),
      fenix: true,
    );
  }
}
