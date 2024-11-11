import 'package:assignment_app/screen/dark_light_theme/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'screen.dart';

void main() {
  // Register ThemeController as a dependency
  Get.put(ThemeController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();
    return Obx(
          () => GetMaterialApp(
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        themeMode: themeController.isDarkMode.value ? ThemeMode.dark : ThemeMode.light,
        home: HomeScreen(),
      ),
    );
  }
}