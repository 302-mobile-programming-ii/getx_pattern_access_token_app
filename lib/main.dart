import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_pattern_access_token_app/binding/initial_binding.dart';
import 'package:getx_pattern_access_token_app/routes/routes.dart';

import 'localization/messages.dart';

Future<void> main() async {
  await GetStorage.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: Messages(), // your translations
      locale: Locale('km', 'KM'), // translations will be displayed in that locale
      fallbackLocale: Locale('km', 'KM'), // specify the fallback locale in case an invalid locale is selected.
      initialBinding: InitialBinding(),
      title: 'Getx Design Pattern',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: "/",
      getPages: Routes.getAllRoutes(),
    );
  }
}
