import 'package:flutter/material.dart';
import 'package:flutter_releases/features/button_bar/button_bar_page.dart';
import 'package:flutter_releases/utils/custom_navigation/custom_navigation.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  bool _showOnPopConfirmExitDialog = false;

  _showConfirmExitDialog({
    required VoidCallback onConfirm,
  }) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Are you sure to exit the application?"),
        actions: [
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                onConfirm();
              },
              child: Text("Sure!"))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: !_showOnPopConfirmExitDialog,
      onPopInvokedWithResult: (didPop, result) {
        // todo: how to get the result??? must research.
        if (didPop) {
        } else {
          if (_showOnPopConfirmExitDialog) {
            _showConfirmExitDialog(
              onConfirm: () async {
                await CustomNavigation.pop();
                // _showOnPopConfirmExitDialog = true;
              },
            );
          }
        }
      },
      child: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                // Navigator().pages;
                Navigator.of(context).push(
                    // context,
                    MaterialPageRoute(
                  builder: (context) => ButtonBarPage(),
                ));
              },
              child: Text("Button Bar Page")),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("show on exit confirm dialog? : "
                  "(${_showOnPopConfirmExitDialog ? "show" : "skip"})"),
              Switch(
                value: _showOnPopConfirmExitDialog,
                onChanged: (value) => setState(() {
                  _showOnPopConfirmExitDialog = value;
                }),
              )
            ],
          )
        ],
      ),
    );
  }
}
