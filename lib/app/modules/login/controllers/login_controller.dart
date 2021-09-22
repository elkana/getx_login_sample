import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_login_sample/app/controllers/auth_controller.dart';
import 'package:getx_login_sample/app/controllers/pref_controller.dart';
import 'package:getx_login_sample/app/data/models/user_model.dart';
import 'package:getx_login_sample/app/routes/app_pages.dart';

class LoginController extends GetxController {
  final auth = Get.find<AuthController>();
  final pref = Get.find<PrefController>();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final box = GetStorage();

  late TextEditingController ctrlUserId, ctrlPwd;

  var obscurePwd = true.obs;
  var rememberPwd = false.obs;
  var loading = false.obs;

  @override
  void onInit() {
    super.onInit();

    ctrlUserId = TextEditingController();
    ctrlPwd = TextEditingController();

    if (pref.hasLoggedUser()) {
      User data = pref.getLoggedUser();

      ctrlUserId.text = data.userId!;
      ctrlPwd.text = data.pwd!;
      rememberPwd.value = data.rememberMe ?? false;
    }
  }

  @override
  void onReady() {
    super.onReady();
    sessionCheck();
  }

  Future sessionCheck() async {
    try {
      await auth.autoLogin();

      if (auth.authenticated.isTrue) Get.offAllNamed(Routes.HOME);
    } catch (e) {
      StackTrace.current;

      print('$e');
    }
  }

  @override
  void onClose() {
    ctrlPwd.dispose();
    ctrlUserId.dispose();
  }

  String? validateUserId(String value) {
    if (GetUtils.isLengthLessThan(value, 4)) return 'Length must be of 4 chars';

    return null;
  }

  String? validatePassword(String value) {
    if (GetUtils.isLengthLessThan(value, 6)) {
      return 'Password must be of 6 chars';
    }

    return null;
  }

  clear() {
    ctrlPwd.text = '';
    ctrlUserId.text = '';
  }

  login() async {
    final form = formKey.currentState;

    if (form == null) return;

    if (!form.validate()) return;

    form.save();

    loading.value = true;
    try {
      await auth.login(ctrlUserId.text, ctrlPwd.text, rememberPwd.value);

      Get.offNamed(Routes.HOME);
    } finally {
      loading.value = false;
    }
  }
}
