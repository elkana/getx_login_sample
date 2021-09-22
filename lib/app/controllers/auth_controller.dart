import 'package:get/get.dart';
import 'package:getx_login_sample/app/data/models/user_model.dart';

import 'pref_controller.dart';

class AuthController extends GetxController {
  var authenticated = false.obs;

  final pref = Get.find<PrefController>();

  AuthController() {
    // authenticated(pref.hasLoggedUser());
  }

  Future<void> autoLogin() async {
    if (pref.hasLoggedUser()) {
      User _user = pref.getLoggedUser();

      login(_user.userId!, _user.pwd!, _user.rememberMe!);
    }
  }

  Future login(String userId, String pwd, bool rememberMe) async {
    // Get.snackbar('Login', 'Validating $userId',
    //     snackPosition: SnackPosition.BOTTOM);

    await Future.delayed(const Duration(seconds: 1));

    pref.setLoggedUser(User(userId: userId, pwd: pwd, rememberMe: rememberMe));

    authenticated.value = true;
  }

  logout() async {
    if (pref.hasLoggedUser()) {
      User user = pref.getLoggedUser();

      if (!user.rememberMe!) await pref.cleanLoggedUser();
    }

    authenticated.value = false;
  }
}
