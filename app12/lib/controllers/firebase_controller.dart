import 'package:app12/screens/home_builder.dart';
import 'package:app12/screens/login_builder.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'app_controller.dart';

final AppController appController = Get.put(AppController());

class FirebaseController extends GetxService {
  // 1
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // 2
  final Rxn<User> _firebaseUser = Rxn<User>();
  get currentUser => _auth.currentUser;

  @override
  void onInit() {
    super.onInit();
    _firebaseUser.bindStream(_auth.authStateChanges());
  }

  // (3) create user with email and password
  void createUser(
      {required String username,
      required String email,
      required String password}) async {
    appController.updateShowSpinner(true);
    // (3.1) create
    await _auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      // (3.2) if successful show notification
      Get.snackbar('success', 'your lue.user?.email} is ready!');

      // (3.3) go to login page
      Get.offAll(const LoginBuilder());
    }).catchError((e) {
      Get.snackbar('Create user Error', e.message);
    });
    appController.updateShowSpinner(false);
  }

  // (4) login with email and password
  void login({
    required String email,
    required String password,
  }) async {
    appController.updateShowSpinner(true);
    await _auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      _firebaseUser.refresh();
      Get.offAll(const HomeBuilder());
    }).catchError((error) {
      Get.snackbar('error', 'something went wrong, try again!');
    });
    appController.updateShowSpinner(false);
  }

  // logout
  void logout() {
    appController.updateShowSpinner(true);
    _auth.signOut();
    appController.updateShowSpinner(false);
    Get.snackbar('logged out', 'see you later 👋');
  }

  // check login status
  void isLoggedIn() {
    appController.updateShowSpinner(true);
    _auth.authStateChanges().listen((User? user) {
      if (user == null) {
        Get.offAll(const LoginBuilder());
        if (kDebugMode) {
          print('User is currently signed out!');
        }
      } else {
        Get.offAll(const HomeBuilder());
        Get.snackbar(user.email.toString(), 'welcome');
      }
    });
    appController.updateShowSpinner(false);
  }
}
