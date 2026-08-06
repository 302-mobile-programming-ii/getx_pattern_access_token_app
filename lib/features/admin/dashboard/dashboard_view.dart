import 'package:flutter/material.dart';
import 'package:getx_pattern_access_token_app/widgets/app_bar_custom_widget.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> menus = [];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarCustomWidget(
        title: "Dashboard",
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  itemCount: 20,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 1,
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.cyan
                      ),
                      child: Center(
                        child: Text('Item ${index + 1}', style: TextStyle(color: Colors.white),),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
