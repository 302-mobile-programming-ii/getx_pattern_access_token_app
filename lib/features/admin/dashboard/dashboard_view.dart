import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_pattern_access_token_app/constants/constants.dart';
import 'package:getx_pattern_access_token_app/features/admin/dashboard/dashboard_controller.dart';
import 'package:getx_pattern_access_token_app/features/admin/dashboard/models/menu.dart';
import 'package:getx_pattern_access_token_app/routes/route_name.dart';
import 'package:getx_pattern_access_token_app/widgets/app_bar_custom_widget.dart';

import '../../../constants/constant_language.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBarCustomWidget(title: ConstantLanguage.dashboard.tr),
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                    itemCount: controller.menus.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 1,
                        ),
                    itemBuilder: (context, index) {
                      var menu = controller.menus[index];
                      return GestureDetector(
                        onTap: () {
                          Get.toNamed(menu.routeName??"");
                        },
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.cyan,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          child: Center(
                            child: Text(
                              Get.locale?.languageCode == Constants.km
                                  ? ' ${menu.nameKh}'
                                  : ' ${menu.name}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
