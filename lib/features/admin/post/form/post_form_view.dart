import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_pattern_access_token_app/features/admin/post/form/post_form_binding.dart';
import 'package:getx_pattern_access_token_app/features/admin/post/form/post_form_controller.dart';
import 'package:getx_pattern_access_token_app/features/admin/post/list/post_controller.dart';
import 'package:getx_pattern_access_token_app/widgets/app_bar_custom_widget.dart';
import 'package:getx_pattern_access_token_app/widgets/loading_widget.dart';

import '../../../../widgets/button_custom_widget.dart';
import '../../../../widgets/input_custom_widget.dart';

class PostFormView extends GetView<PostFormController> {
  const PostFormView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarCustomWidget(title: "Create Post"),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 35),
        child: Column(
          children: [
            InputCustomWidget(hint: "Title"),
            SizedBox(height: 10),
            InputCustomWidget(hint: "Body"),
            SizedBox(height: 10),
            InputCustomWidget(hint: "Description"),
            SizedBox(height: 10),
            InputCustomWidget(hint: "Select Category"),
            SizedBox(height: 35),
            ButtonCustomWidget(title: "Create"),
          ],
        ),
      ),
    );
  }
}
