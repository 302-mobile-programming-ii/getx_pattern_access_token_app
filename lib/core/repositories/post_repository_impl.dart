import 'dart:convert';

import 'package:get/get.dart';
import 'package:getx_pattern_access_token_app/constants/constants_uri.dart';
import 'package:getx_pattern_access_token_app/core/models/post/Content.dart';
import 'package:getx_pattern_access_token_app/core/models/post/PostResponse.dart';
import 'package:getx_pattern_access_token_app/core/repositories/post_repository.dart';

import '../api/api_service.dart';

class PostRepositoryImpl extends PostRepository {
  var apiService = Get.find<ApiService>();

  @override
  Future<List<Content>> getAllPosts({String? page, String? limit, String? status}) async {
    List<Content> listResponse = [];
    var response = await apiService.get("${ConstantsUri.postPath}?page=${page??0}&size=${limit??10}&status=${status??"ACT"}");
    if(response != null){
      var mapResponse = PostResponse.fromJson(jsonDecode(response));
      if(mapResponse.data?.content!= null){
        listResponse =   mapResponse.data?.content??[];
      }
    }
    return listResponse;
  }
}
