import 'package:get/get.dart';

class AppController extends GetxController {
  final bottomNavigationIndex = 0.obs;
  final selectedCurrency = 'NONE'.obs;
  final btcChangeRate = 0.0.obs;
  final ethChangeRate = 0.0.obs;
  final ltcChangeRate = 0.0.obs;

  void updateBottomNavigationIndex({required int bottomNavigationIndex}) {
    this.bottomNavigationIndex(bottomNavigationIndex);
  }

  void updateSelectedCurrency({required String selectedCurrency}) {
    this.selectedCurrency(selectedCurrency);
  }

  void updateBtcChangeRate({required double btcChangeRate}) {
    this.btcChangeRate(btcChangeRate);
  }

  void updateEthChangeRate({required double ethChangeRate}) {
    this.ethChangeRate(ethChangeRate);
  }

  void updateLtcChangeRate({required double ltcChangeRate}) {
    this.ltcChangeRate(ltcChangeRate);
  }
}
