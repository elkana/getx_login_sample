import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_login_sample/app/data/models/user_model.dart';

// manually made
class PrefController extends GetxController {
  final box = GetStorage();

  Future initStorage() => GetStorage.init();
  Future cleanLoggedUser() => box.remove('auth');
  Future cleanAll() => box.erase();

  bool hasLoggedUser() => box.hasData('auth');

  User getLoggedUser() {
    final map = box.read('auth') ?? {};
    return User.fromJson(map);
  }

  void setLoggedUser(User model) => box.write('auth', model.toJson());
}
