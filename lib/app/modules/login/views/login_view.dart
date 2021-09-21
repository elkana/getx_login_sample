import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_login_sample/app/modules/login/controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: controller.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: controller.ctrlUserId,
              validator: (val) => controller.validateUserId(val!),
              onSaved: (val) => controller.ctrlUserId.text = val!,
              autofocus: false,
              decoration: const InputDecoration(
                hintText: 'Who are you ?',
                contentPadding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
              ),
            ),
            const SizedBox(height: 10.0),
            // password
            Obx(
              () => TextFormField(
                controller: controller.ctrlPwd,
                validator: (val) => controller.validatePassword(val!),
                onSaved: (val) => controller.ctrlPwd.text = val!,
                decoration: InputDecoration(
                  hintText: 'Secret Code',
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.remove_red_eye),
                    onPressed: () => controller.obscurePwd.toggle(),
                  ),
                  contentPadding:
                      const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
                ),
                obscureText: controller.obscurePwd.value,
              ),
            ),
            const SizedBox(height: 10.0),
            Align(
              alignment: Alignment.topLeft,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Obx(
                    () => Switch(
                      value: controller.rememberPwd.value,
                      onChanged: (value) => controller.rememberPwd.toggle(),
                    ),
                  ),
                  Text('buttons_rememberme'.tr,
                      style: const TextStyle(fontSize: 12)),
                ],
              ),
            ),
            Obx(
              () => controller.loading.value
                  ? const CircularProgressIndicator()
                  : ElevatedButton.icon(
                      onPressed: () => controller.login(),
                      icon: const Icon(Icons.login_rounded),
                      label: Text('buttons_login'.tr),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
