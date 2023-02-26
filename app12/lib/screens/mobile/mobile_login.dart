import 'package:app12/controllers/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'package:app12/controllers/firebase_controller.dart';
import 'package:app12/controllers/login_controller.dart';
import 'package:app12/screens/register_builder.dart';
import 'package:app12/widgets/primary_button.dart';
import 'package:app12/widgets/secondary_button.dart';
import 'package:app12/widgets/input_field_with_icon.dart';

class MobileLogin extends GetWidget<FirebaseController> {
  MobileLogin({Key? key}) : super(key: key);

  final LoginController login = Get.put(LoginController());
  final AppController appController = Get.put(AppController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.deepPurple.shade400,
        body: Obx(
          () => ModalProgressHUD(
            inAsyncCall: appController.showSpinner.value,
            child: OrientationBuilder(
              builder: (BuildContext context, Orientation orientation) {
                return SafeArea(
                  child: Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: double.infinity,
                    padding: EdgeInsets.all(20.sp),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InputFieldWithIcon(
                          controller: login.usernameController,
                          borderRadius: 5,
                          hintText: 'Username',
                          icon: Icons.person,
                          iconSize: 36,
                        ),
                        const SizedBox(height: 10),
                        InputFieldWithIcon(
                          controller: login.passwordController,
                          borderRadius: 5,
                          hintText: 'Password',
                          icon: Icons.key,
                          iconSize: 36,
                          hideText: true,
                        ),
                        const SizedBox(height: 60),
                        PrimaryButton(
                            title: 'Login',
                            function: () {
                              loginUser();
                            }),
                        const SizedBox(height: 10),
                        SecondaryButton(
                          title: 'Create new account',
                          route: RegisterBuilder.route,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  void loginUser() {
    controller.login(
      email: login.usernameController.text,
      password: login.passwordController.text,
    );
  }
}
