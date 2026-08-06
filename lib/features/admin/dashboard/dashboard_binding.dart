import 'package:get/get.dart';
import 'package:getx_pattern_access_token_app/features/admin/dashboard/dashboard_controller.dart';

class DashboardBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(()=> DashboardController());
  }

}