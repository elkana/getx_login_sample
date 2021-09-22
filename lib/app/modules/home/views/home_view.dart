import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_login_sample/app/controllers/pref_controller.dart';
import 'package:getx_login_sample/app/modules/home/controllers/home_controller.dart';
import 'package:getx_login_sample/generated/locales.g.dart';

class HomeView extends GetView<HomeController> {
  final pref = Get.find<PrefController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () => controller.logout(),
          )
        ],
      ),
      body: Center(
        child: Text(
          LocaleKeys.message_welcome_user
              .trParams({'userid': pref.getLoggedUser().userId!}),
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
