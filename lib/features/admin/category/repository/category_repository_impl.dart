import 'dart:convert';

import 'package:getx_pattern_access_token_app/constants/constants_uri.dart';
import 'package:getx_pattern_access_token_app/core/api/api_service.dart';
import 'package:getx_pattern_access_token_app/core/models/api_base_response.dart';

import 'package:getx_pattern_access_token_app/features/admin/category/models/Category.dart';
import 'package:getx_pattern_access_token_app/features/admin/category/models/Category_request.dart';
import 'package:getx_pattern_access_token_app/features/admin/category/repository/category_repository.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final ApiService apiService;
  CategoryRepositoryImpl({required this.apiService});
  @override
  Future<String> createCategory(CategoryRequest request) async {
    ApiBaseResponse apiBaseResponse = ApiBaseResponse();
    var response = await apiService.post(
      ConstantsUri.categoryPath,
      body: jsonEncode(request.toJson()),
    );
    if (response != null) {
      apiBaseResponse = ApiBaseResponse.fromJson(
        json,
        (data) => data as String,
      );
    }
    return apiBaseResponse.message ?? "";
  }

  @override
  Future<String> deleteCategory(String id) async {
    ApiBaseResponse apiBaseResponse = ApiBaseResponse();
    var response = await apiService.delete(
      "${ConstantsUri.categoryPath}/${id}",
    );
    if (response != null) {
      apiBaseResponse = ApiBaseResponse.fromJson(
        json,
        (data) => data as String,
      );
    }
    return apiBaseResponse.message ?? "";
  }

  @override
  Future<List<Category>> getAllCategory({
    String? page,
    String? limit,
    String? status,
  }) async {
    final response = await apiService.post(ConstantsUri.categoryPath);

    if (response == null) {
      return [];
    }

    final apiBaseResponse = ApiBaseResponse<List<Category>>.fromJson(
      jsonDecode(response),
      (data) => (data as List)
          .map((item) => Category.fromJson(jsonDecode(item)))
          .toList(),
    );

    return apiBaseResponse.data ?? [];
  }

  @override
  Future<Category> getCategoryById(String id) async {
    final response = await apiService.post('${ConstantsUri.categoryPath}/$id');

    if (response == null) {
      return Category();
    }

    final apiBaseResponse = ApiBaseResponse<Category>.fromJson(
      response,
      (data) => Category.fromJson(data),
    );

    return apiBaseResponse.data ?? Category();
  }

  @override
  Future<String> updateCategory(CategoryRequest request) async {
    ApiBaseResponse apiBaseResponse = ApiBaseResponse();
    var response = await apiService.post(
      ConstantsUri.categoryPath,
      body: jsonEncode(request.toJson()),
    );
    if (response != null) {
      apiBaseResponse = ApiBaseResponse.fromJson(
        json,
        (data) => data as String,
      );
    }
    return apiBaseResponse.message ?? "";
  }
}
