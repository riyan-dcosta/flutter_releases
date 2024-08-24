import 'package:flutter/material.dart';
import 'package:flutter_releases/features/button_bar/button_bar_page.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ButtonBarPage(),
                  ));
            },
            child: Text("Button Bar Page"))
      ],
    );
  }
}
