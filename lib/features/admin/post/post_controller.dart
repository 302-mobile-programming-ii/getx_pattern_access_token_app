import 'package:get/get.dart';
import 'package:getx_pattern_access_token_app/core/models/post/Content.dart';
import 'package:getx_pattern_access_token_app/core/repositories/post_repository.dart';

class PostController extends GetxController {
  var loading = false.obs;
  var postList = <Content>[].obs;
  var postRepository = Get.find<PostRepository>();
  getAllPost() async {
    loading.value = true;
    var response = await postRepository.getAllPosts();
    if (response.isNotEmpty) {
      postList.value = response;
    }
    loading.value = false;
  }

  @override
  void onInit() {
    getAllPost();
    super.onInit();
  }
}
