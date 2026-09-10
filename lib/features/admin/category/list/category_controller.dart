import 'package:get/get.dart';
import 'package:getx_pattern_access_token_app/features/admin/category/models/Category.dart';
import 'package:getx_pattern_access_token_app/features/admin/category/repository/category_repository.dart';

class CategoryController extends GetxController {
  final CategoryRepository categoryRepository;
  var loading = true.obs;
  var categoryList = <Category>[].obs;

  CategoryController({required this.categoryRepository});

  getAllCategory() async {
    loading.value = true;
    var list = await categoryRepository.getAllCategory();
    print(list.toString());
    if (list.isNotEmpty) {
      categoryList.value = list;
    }
    loading.value = false;
  }

  @override
  void onInit() {
    getAllCategory();
    super.onInit();
  }
}
