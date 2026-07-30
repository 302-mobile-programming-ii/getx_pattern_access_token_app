import 'package:get_storage/get_storage.dart';

class StoreToken {
  static final storage = GetStorage();
  static const _accessToken = "ACCESS_TOKEN";
  static const _refreshToken = "REFRESH_TOKEN";
  static void setToken(String token) {
    storage.write(_accessToken, token);
  }

  static void setRefresh(String token) {
    storage.write(_refreshToken, token);
  }

  static String getToken() {
    return storage.read(_accessToken) ?? "";
  }

  static String getRefreshToken() {
    return storage.read(_refreshToken) ?? "";
  }

  static void removeToken() {
    storage.remove(_accessToken);
    storage.remove(_accessToken);
  }
}
