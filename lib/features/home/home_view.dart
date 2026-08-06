import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_pattern_access_token_app/data/local/store_token.dart';
import 'package:getx_pattern_access_token_app/features/home/home_controller.dart';
import 'package:getx_pattern_access_token_app/routes/route_name.dart';

import '../../widgets/app_bar_custom_widget.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.cyan,
        child: ListView(
          children: [
            Container(width: double.infinity, height: 200),
            Divider(height: 1, color: Colors.black12),
            ListTile(
              onTap: () {
                Navigator.pop(context);
                Get.toNamed(RouteName.adminDashboard);
              },
              leading: Icon(Icons.dashboard, color: Colors.white),
              trailing: Icon(Icons.navigate_next, color: Colors.white),
              title: Text("Dashboard", style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      appBar: AppBarCustomWidget(
        centerTitle: true,
        title: "Home",
        actions: [
          IconButton(
            onPressed: () {
              StoreToken.removeToken();
              Get.offNamed("/");
            },
            icon: Icon(Icons.logout, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
