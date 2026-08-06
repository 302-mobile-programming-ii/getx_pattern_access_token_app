import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_pattern_access_token_app/features/admin/post/post_controller.dart';
class PostView extends GetView<PostController> {
  const PostView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text("List Post", style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            onPressed: () {
            },
            icon: Icon(Icons.add, color: Colors.white),
          ),
        ],
      ),
      body: Obx(() {
        return controller.loading.value == true
            ? Center(child: CircularProgressIndicator(color: Colors.cyan))
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
