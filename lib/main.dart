import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/controllers/auth_controller.dart';
import 'app/routes/app_pages.dart';
import 'generated/locales.g.dart';

void main() async {
  await GetStorage.init();

  Get.put(AuthController());

  runApp(
    GetMaterialApp(
      title: "Application",
      theme: ThemeData.dark(),
      translationsKeys: AppTranslation.translations,
      locale: const Locale('en', 'US'),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
