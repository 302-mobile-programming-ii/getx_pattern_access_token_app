import 'package:getx_pattern_access_token_app/core/models/auth/RefreshTokenRequest.dart';

import '../models/auth/LoginRequest.dart';
import '../models/auth/LoginResponse.dart';

abstract class ApiService {
  Future<LoginResponse> login(LoginRequest request);
  Future<LoginResponse> refreshToken(RefreshTokenRequest req);
  Future<dynamic> get(String url);
}
