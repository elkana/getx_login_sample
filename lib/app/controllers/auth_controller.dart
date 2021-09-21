import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_login_sample/app/data/models/user_model.dart';

class AuthController extends GetxController {
  var authenticated = false.obs;

  final box = GetStorage();

  AuthController() {
    authenticated(box.hasData('auth'));
  }

  Future<void> autoLogin() async {
    if (box.hasData('auth') && box.hasData('last.server')) {
      User _user = box.read('auth');

      login(_user.userId!, _user.pwd!, _user.rememberMe!);
    }
  }

  Future login(String userId, String pwd, bool rememberMe) async {
    // Get.snackbar('Login', 'Validating $userId',
    //     snackPosition: SnackPosition.BOTTOM);

    await Future.delayed(const Duration(seconds: 1));

    box.write('auth', User(userId: userId, pwd: pwd, rememberMe: rememberMe));

    authenticated.value = true;
  }

  logout() async {
    if (box.hasData('auth')) {
      User user = box.read('auth');

      if (!user.rememberMe!) await GetStorage().remove('auth');
    }

    authenticated.value = false;
  }
}
