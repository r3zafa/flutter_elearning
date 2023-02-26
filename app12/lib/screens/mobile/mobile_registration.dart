import 'package:app12/controllers/firebase_controller.dart';
import 'package:app12/controllers/registration_controller.dart';
import 'package:app12/widgets/primary_button.dart';
import 'package:app12/widgets/secondary_button.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';

import '../../controllers/app_controller.dart';
import '../../widgets/input_field_with_icon.dart';
import '../login_builder.dart';

class MobileRegistration extends GetWidget<FirebaseController> {
  MobileRegistration({Key? key}) : super(key: key);

  final RegistrationController register = Get.put(RegistrationController());
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
                        /*
                    InputFieldWithIcon(
                      controller: register.usernameController,
                      borderRadius: 5,
                      hintText: 'Username',
                      icon: Icons.person,
                      iconSize: 36,
                    ),
                    const SizedBox(height: 10),

                     */
                        InputFieldWithIcon(
                          controller: register.emailController,
                          borderRadius: 5,
                          hintText: 'Email',
                          icon: Icons.mail,
                          iconSize: 36,
                        ),
                        const SizedBox(height: 10),
                        InputFieldWithIcon(
                          controller: register.passwordController,
                          borderRadius: 5,
                          hintText: 'Password',
                          icon: Icons.key,
                          iconSize: 36,
                          hideText: true,
                        ),
                        const SizedBox(height: 60),
                        PrimaryButton(
                            title: 'Create account',
                            function: () {
                              registerUser();
                            }),
                        const SizedBox(height: 10),
                        SecondaryButton(
                            title: 'Login', route: LoginBuilder.route),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        ));
  }

  void registerUser() {
    controller.createUser(
      username: register.usernameController.text,
      email: register.emailController.text,
      password: register.passwordController.text,
    );
  }
}
