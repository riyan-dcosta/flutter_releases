import 'package:flutter/material.dart';

class ButtonBarPage extends StatefulWidget {
  const ButtonBarPage({super.key});

  @override
  State<ButtonBarPage> createState() => _ButtonBarPageState();
}

class _ButtonBarPageState extends State<ButtonBarPage> {
  List<Widget> _textButtons = [];

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (didPop, result) {

      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Button Bar Page"),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pop<String>(context, "Hello");
                },
                icon: Icon(Icons.exit_to_app))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _textButtons.add(TextButton(
                              onPressed: () {},
                              child: Text("Button "
                                  "${_textButtons.length + 1}")));
                        });
                      },
                      child: Text("add buttons")),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _textButtons.removeLast();
                        });
                      },
                      child: Text("remove last")),
                ],
              ),
              Divider(),
              const Text(
                "Button Bar",
              ),
              const Text("Button Bar depreciated (3.24);  to Overflow Bar"),
              ColoredBox(
                color: Colors.transparent,
                child: ButtonBarTheme(
                  data: const ButtonBarThemeData(
                    alignment: MainAxisAlignment.center,
                    buttonTextTheme: ButtonTextTheme.accent,
                  ),
                  child: ButtonBar(
                    children: _textButtons,
                  ),
                ),
              ),
              const Text("Overflow bar"),
              OverflowBar(
                children: _textButtons,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
