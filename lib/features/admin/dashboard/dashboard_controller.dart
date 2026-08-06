import 'package:get/get.dart';
import 'package:getx_pattern_access_token_app/features/admin/dashboard/models/menu.dart';

class DashboardController extends GetxController {
  var menus = <Menu>[].obs;

  @override
  void onInit() {
    menus.value = Menu.getAllMenus();
    super.onInit();
  }
}
