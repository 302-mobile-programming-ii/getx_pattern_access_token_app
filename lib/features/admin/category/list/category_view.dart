import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_pattern_access_token_app/features/admin/category/list/category_controller.dart';
import 'package:getx_pattern_access_token_app/widgets/app_bar_custom_widget.dart';
import 'package:getx_pattern_access_token_app/widgets/loading_widget.dart';

class CategoryView extends GetView<CategoryController> {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: AppBarCustomWidget(title: "Categories"),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: controller.loading.value == true
              ? LoadingWidget()
              : ListView.builder(
                  itemCount: controller.categoryList.length,
                  itemBuilder: (context, index) {
                    var category = controller.categoryList[index];
                    return Container(
                      decoration: BoxDecoration(color: Colors.black12),
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: ListTile(title: Text("${category.name}")),
                    );
                  },
                ),
        ),
      );
    });
  }
}
