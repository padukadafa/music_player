import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:music_player/app/themes/color_schemes.g.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Application",
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
