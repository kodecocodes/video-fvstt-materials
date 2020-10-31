import 'package:flutter/material.dart';
import 'package:flutter_vscode_tips_tricks/pages/shortcuts_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ShortcutsPage(),
    );
  }
}
