import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_releases/features/button_bar/button_bar_page.dart';
import 'package:flutter_releases/features/dashboard/dashboard_page.dart';

class CustomNavigation {
  static Future<void> pop({bool? animated}) async {
    await SystemChannels.platform
        .invokeMethod<void>('SystemNavigator.pop', animated);
  }

  List<Page> pages = [
    MaterialPage(child: DashboardPage()),
    MaterialPage(child: ButtonBarPage()),
  ];
}
