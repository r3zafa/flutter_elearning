import 'package:flutter/material.dart';
import 'package:get/get_utils/src/platform/platform.dart';

class PlatformSpecificUI extends StatelessWidget {
  const PlatformSpecificUI({
    super.key,
    required this.materialWidget,
    required this.cupertinoWidget,
  });

  final Widget materialWidget;
  final Widget cupertinoWidget;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (GetPlatform.isAndroid) {
          return materialWidget;
        } else if (GetPlatform.isIOS) {
          return cupertinoWidget;
        } else {
          return materialWidget;
        }
      },
    );
  }
}
