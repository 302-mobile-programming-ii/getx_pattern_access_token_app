import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_pattern_access_token_app/features/admin/post/list/post_controller.dart';
import 'package:getx_pattern_access_token_app/routes/route_name.dart';
import 'package:getx_pattern_access_token_app/widgets/app_bar_custom_widget.dart';
import 'package:getx_pattern_access_token_app/widgets/loading_widget.dart';

class PostView extends GetView<PostController> {
  const PostView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarCustomWidget(title: "List Post",
      actions: [
        IconButton(onPressed: (){
          Get.toNamed(RouteName.adminPostForm);
        }, icon: Icon(Icons.add))
      ],
      ),
      body: Obx(() {
        return controller.loading.value == true
            ? LoadingWidget()
            : RefreshIndicator(
                onRefresh: () async {
                  controller.getAllPost();
                },
                child: ListView.builder(
                  itemCount: controller.postList.length,
                  itemBuilder: (context, index) {
                    var post = controller.postList[index];
                    return Container(
                      padding: EdgeInsets.only(left: 16, right: 16, top: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.network("${post.image}"),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 5,
                              vertical: 10,
                            ),
                            width: double.infinity,
                            child: Text(
                              "${post.title}",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 5,
                              vertical: 10,
                            ),
                            width: double.infinity,
                            child: Text(
                              "${post.body}",
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
      }),
    );
  }
}
