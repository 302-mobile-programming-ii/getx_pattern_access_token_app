import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:getx_pattern_access_token_app/features/admin/dashboard/dashboard_binding.dart';
import 'package:getx_pattern_access_token_app/features/admin/dashboard/dashboard_view.dart';
import 'package:getx_pattern_access_token_app/features/admin/post/post_binding.dart';
import 'package:getx_pattern_access_token_app/features/admin/post/post_view.dart';
import 'package:getx_pattern_access_token_app/routes/route_name.dart';

import '../features/auth/login/login_binding.dart';
import '../features/auth/login/login_view.dart';
import '../features/home/home_binding.dart';
import '../features/home/home_view.dart';
import '../features/splash/splash_binding.dart';
import '../features/splash/splash_view.dart';

class Routes {
  Routes._();

  static getAllRoutes(){
    return [
      GetPage(name: RouteName.splash, page: ()=> SplashView(), binding: SplashBinding()),
      GetPage(name: RouteName.home, page: ()=> HomeView(), binding: HomeBinding()),
      GetPage(name: RouteName.login, page: ()=> LoginView(), binding: LoginBinding()),
      GetPage(name: RouteName.adminDashboard, page: ()=> DashboardView(), binding: DashboardBinding(), transition: Transition.cupertino),
      GetPage(name: RouteName.adminPost, page: ()=> PostView(), binding: PostBinding()),
    ];
  }
}