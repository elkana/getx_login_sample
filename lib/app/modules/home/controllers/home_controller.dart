import 'package:get/get.dart';
import 'package:getx_login_sample/app/controllers/auth_controller.dart';
import 'package:getx_login_sample/app/routes/app_pages.dart';

class HomeController extends GetxController {
  final authController = Get.find<AuthController>();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  Future logout() async {
    await authController.logout();

    Get.offAllNamed(Routes.LOGIN);
  }
}
