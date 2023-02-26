import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class AppController extends GetxController {
  final bottomNavigationIndex = 0.obs;

  RxBool showSpinner = false.obs;

  TextEditingController message = TextEditingController();

  ItemScrollController itemScrollController = ItemScrollController();
  ItemPositionsListener itemPositionsListener = ItemPositionsListener.create();

  updateShowSpinner(bool showSpinner) {
    this.showSpinner(showSpinner);
  }

  void updateBottomNavigationIndex({required int bottomNavigationIndex}) {
    this.bottomNavigationIndex(bottomNavigationIndex);
  }

  @override
  void dispose() {
    super.dispose();
    message.dispose();
  }
}
