import 'dart:convert';

import 'package:get/get.dart';
import 'package:getx_pattern_access_token_app/constants/constants_uri.dart';
import 'package:getx_pattern_access_token_app/core/api/api_service.dart';
import 'package:getx_pattern_access_token_app/core/models/auth/RefreshTokenRequest.dart';
import 'package:getx_pattern_access_token_app/data/local/store_token.dart';
import 'package:http/http.dart' as httpClient;

import '../models/auth/LoginRequest.dart';
import '../models/auth/LoginResponse.dart';

class ApiServiceImpl extends GetxService implements ApiService {
  var headers = {"Content-type": "application/json"};
  @override
  Future<LoginResponse> login(LoginRequest request) async {
    var loginResponse = LoginResponse();
    var url = Uri.parse(ConstantsUri.loginPath);
    var response = await httpClient.post(
      url,
      body: jsonEncode(request.toJson()),
      headers: headers,
    );
    if (response.statusCode == 200) {
      loginResponse = LoginResponse.fromJson(jsonDecode(response.body));
    }
    return loginResponse;
  }

  @override
  Future<LoginResponse> refreshToken(RefreshTokenRequest req) async {
    var loginResponse = LoginResponse();
    var url = Uri.parse(ConstantsUri.refreshToken);
    var response = await httpClient.post(
      url,
      body: jsonEncode(req.toJson()),
      headers: headers,
    );
    if (response.statusCode == 200) {
      loginResponse = LoginResponse.fromJson(jsonDecode(response.body));
    }
    return loginResponse;
  }

  @override
  Future get(String url) async {
    headers["Authorization"] = "Bearer ${StoreToken.getToken()}";
    var uri = Uri.parse(url);
    var response = await httpClient.get(uri, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    }
    if (response.statusCode == 401) {
      // call refresh token
      var responseRefreshToken = await refreshToken(
        RefreshTokenRequest(refreshToken: StoreToken.getRefreshToken()),
      );
      if (responseRefreshToken.accessToken == null) {
        StoreToken.removeToken();
        Get.offNamed("/login");
        return null;
      } else {
        StoreToken.setRefresh(responseRefreshToken.refreshToken ?? "");
        StoreToken.setToken(responseRefreshToken.accessToken ?? "");
        // Retry
        headers["Authorization"] = "Bearer ${StoreToken.getToken()}";
        var retryResponse = await httpClient.get(uri, headers: headers);
        if (retryResponse.statusCode == 200) {
          return retryResponse.body;
        } else {
          return null;
        }
      }
    }
    return null;
  }

  @override
  Future delete(String url) async {
    headers["Authorization"] = "Bearer ${StoreToken.getToken()}";
    var uri = Uri.parse(url);
    var response = await httpClient.delete(uri, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    }
    if (response.statusCode == 401) {
      // call refresh token
      var responseRefreshToken = await refreshToken(
        RefreshTokenRequest(refreshToken: StoreToken.getRefreshToken()),
      );
      if (responseRefreshToken.accessToken == null) {
        StoreToken.removeToken();
        Get.offNamed("/login");
        return null;
      } else {
        StoreToken.setRefresh(responseRefreshToken.refreshToken ?? "");
        StoreToken.setToken(responseRefreshToken.accessToken ?? "");
        // Retry
        headers["Authorization"] = "Bearer ${StoreToken.getToken()}";
        var retryResponse = await httpClient.delete(uri, headers: headers);
        if (retryResponse.statusCode == 200) {
          return retryResponse.body;
        } else {
          return null;
        }
      }
    }
    return null;
  }

  @override
  Future post(String url, {body}) async {
    headers["Authorization"] = "Bearer ${StoreToken.getToken()}";
    var uri = Uri.parse(url);
    var response = await httpClient.post(uri, headers: headers, body: body);
    if (response.statusCode == 200) {
      return response.body;
    }
    if (response.statusCode == 401) {
      // call refresh token
      var responseRefreshToken = await refreshToken(
        RefreshTokenRequest(refreshToken: StoreToken.getRefreshToken()),
      );
      if (responseRefreshToken.accessToken == null) {
        StoreToken.removeToken();
        Get.offNamed("/login");
        return null;
      } else {
        StoreToken.setRefresh(responseRefreshToken.refreshToken ?? "");
        StoreToken.setToken(responseRefreshToken.accessToken ?? "");
        // Retry
        headers["Authorization"] = "Bearer ${StoreToken.getToken()}";
        var retryResponse = await httpClient.post(
          uri,
          headers: headers,
          body: body,
        );
        if (retryResponse.statusCode == 200) {
          return retryResponse.body;
        } else {
          return null;
        }
      }
    }
    return null;
  }

  @override
  Future put(String url, {body}) async {
    headers["Authorization"] = "Bearer ${StoreToken.getToken()}";
    var uri = Uri.parse(url);
    var response = await httpClient.put(uri, headers: headers, body: body);
    if (response.statusCode == 200) {
      return response.body;
    }
    if (response.statusCode == 401) {
      // call refresh token
      var responseRefreshToken = await refreshToken(
        RefreshTokenRequest(refreshToken: StoreToken.getRefreshToken()),
      );
      if (responseRefreshToken.accessToken == null) {
        StoreToken.removeToken();
        Get.offNamed("/login");
        return null;
      } else {
        StoreToken.setRefresh(responseRefreshToken.refreshToken ?? "");
        StoreToken.setToken(responseRefreshToken.accessToken ?? "");
        // Retry
        headers["Authorization"] = "Bearer ${StoreToken.getToken()}";
        var retryResponse = await httpClient.put(
          uri,
          headers: headers,
          body: body,
        );
        if (retryResponse.statusCode == 200) {
          return retryResponse.body;
        } else {
          return null;
        }
      }
    }
    return null;
  }
}
