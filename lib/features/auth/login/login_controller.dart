import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getx_pattern_access_token_app/core/api/api_service.dart';
import 'package:getx_pattern_access_token_app/data/local/store_token.dart';

import '../../../core/models/auth/LoginRequest.dart';

class LoginController extends GetxController {
  var usernameController = TextEditingController().obs;
  var passwordController = TextEditingController().obs;
  var apiService = Get.find<ApiService>();
  var onLoading = false.obs;

  Future<void> onLogin() async {
    var username = usernameController.value.text.trim();
    var password = passwordController.value.text.trim();

    if (username.isEmpty) {
      Get.snackbar("Error", "Username is required");
      return;
    }
    if (password.isEmpty) {
      Get.snackbar("Error", "Password is required");
      return;
    }
    onLoading.value = true;
    var responseLogin = await apiService.login(
      LoginRequest(phoneNumber: username, password: password),
    );
    onLoading.value = false;
    if (responseLogin.accessToken == null) {
      Get.snackbar("Error", "Your username and password incorrect");
    } else {
      StoreToken.setToken(responseLogin.accessToken ?? "");
      StoreToken.setRefresh(responseLogin.refreshToken ?? "");
      Get.snackbar("Success", "Login Success");
      Get.offNamed("/home");
    }
  }
}
