import 'package:flutter/material.dart';
import 'package:flutter_releases/utils/custom_navigation/custom_navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App Title',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Navigator(
        pages: CustomNavigation().pages,
        onDidRemovePage: (page) {
          // todo: not  completed. needs more rnd
          if (page.name == 'dashboard') {}
        },
      ),
    );
  }
}
