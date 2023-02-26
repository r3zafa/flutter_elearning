import 'package:app12/controllers/firebase_controller.dart';
import 'package:app12/controllers/login_controller.dart';
import 'package:app12/controllers/registration_controller.dart';
import 'package:get/get.dart';
import 'app_controller.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AppController());
    Get.lazyPut(() => LoginController());
    Get.lazyPut(() => RegistrationController());
    Get.lazyPut(() => FirebaseController());
  }
}
