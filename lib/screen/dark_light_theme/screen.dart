import 'package:get/get.dart';
import 'package:assignment_app/screen/dark_light_theme/theme_controller.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dark/Light Theme'),
      ),
      body: Center(
        child: Obx(() => SwitchListTile(
          title: Text(themeController.isDarkMode.value
              ? 'Switch to Light Mode'
              : 'Switch to Dark Mode'),
          value: themeController.isDarkMode.value,
          onChanged: (value) {
            themeController.toggleTheme();
          },
          activeColor: Colors.blue, // Color for the active state
          inactiveThumbColor: Colors.grey, // Color for the inactive state
        )),
      ),
    );
  }
}