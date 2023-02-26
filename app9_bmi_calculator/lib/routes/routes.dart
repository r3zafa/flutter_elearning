import 'package:flutter/cupertino.dart';

import '../screens/input_page.dart';
import '../screens/result_page.dart';

Map<String, Widget Function(BuildContext)> routes() {
  return {
    '/': (context) => const InputPage(),
    ResultPage.routeName: (context) => const ResultPage(),
  };
}
