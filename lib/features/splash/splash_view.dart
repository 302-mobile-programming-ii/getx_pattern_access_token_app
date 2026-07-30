import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_pattern_access_token_app/features/splash/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx((){
      return  Scaffold(
        backgroundColor: Colors.cyan,
        body:
        controller.onLoading == false ? Text("") :
        Center(child: CircularProgressIndicator(color: Colors.white)),
      );
    });

  }
}
