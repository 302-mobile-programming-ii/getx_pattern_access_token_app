import 'package:get/get.dart';
import 'package:getx_pattern_access_token_app/core/repositories/post_repository.dart';
import 'package:getx_pattern_access_token_app/core/repositories/post_repository_impl.dart';

import '../core/api/api_service.dart';
import '../core/api/api_service_impl.dart';
import '../features/admin/dashboard/dashboard_controller.dart';
import '../features/admin/post/form/post_form_binding.dart';
import '../features/auth/login/login_controller.dart';
import '../features/home/home_controller.dart';
import '../features/splash/splash_controller.dart';

class InitialBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=> LoginController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(()=> SplashController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(()=> DashboardController());
    Get.lazyPut(() => PostFormBinding());
    Get.lazyPut<ApiService>(()=>ApiServiceImpl(), fenix: true);
    Get.lazyPut<PostRepository>(()=> PostRepositoryImpl(),fenix: true);
  }

}