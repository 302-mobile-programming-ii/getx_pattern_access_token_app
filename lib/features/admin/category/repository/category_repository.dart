import 'package:getx_pattern_access_token_app/core/models/api_base_response.dart';
import 'package:getx_pattern_access_token_app/features/admin/category/models/Category.dart';
import 'package:getx_pattern_access_token_app/features/admin/category/models/Category_request.dart';

abstract class CategoryRepository {
  Future<List<Category>> getAllCategory({
    String? page,
    String? limit,
    String? status,
  });
  Future<String> createCategory(CategoryRequest request);
  Future<String> updateCategory(CategoryRequest request);
  Future<String> deleteCategory(String id);
  Future<Category> getCategoryById(String id);
}
