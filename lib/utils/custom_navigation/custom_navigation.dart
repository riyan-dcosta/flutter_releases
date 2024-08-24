import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class CustomNavigation extends Navigator {
  const CustomNavigation({super.key});

  static Future<void> pop({bool? animated}) async {
    await SystemChannels.platform
        .invokeMethod<void>('SystemNavigator.pop', animated);
  }
}
