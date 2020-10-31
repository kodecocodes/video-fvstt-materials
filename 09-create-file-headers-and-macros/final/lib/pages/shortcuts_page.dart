import 'package:flutter/material.dart';

import '../models/shortcut.dart';
import '../widgets/shortcut_list.dart';

class ShortcutsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Future<String> winJsonString = DefaultAssetBundle.of(context)
        .loadString('assets/data/vscode_shortcuts_win.json');
    final Future<String> macJsonString = DefaultAssetBundle.of(context)
        .loadString('assets/data/vscode_shortcuts_mac.json');
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('VS Code Shortcuts App'),
          bottom: TabBar(
            tabs: [
              Tab(child: Text("Windows")),
              Tab(child: Text("MacOs")),
            ],
          ),
        ),
        body: FutureBuilder(
          future: Future.wait([winJsonString, macJsonString]),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final ShortcutData shortcutDataWin =
                  shortcutDataFromJson(snapshot.data[0]);
              final ShortcutData shortcutDataMac =
                  shortcutDataFromJson(snapshot.data[1]);
              return TabBarView(
                children: [
                  ShortcutList(
                    key: PageStorageKey("Windows"),
                    shortcuts: shortcutDataWin.shortcuts,
                  ),
                  ShortcutList(
                    key: PageStorageKey("Mac"),
                    shortcuts: shortcutDataMac.shortcuts,
                  ),
                ],
              );
            }
            return Center(child: Text("Loading"));
          },
        ),
      ),
    );
  }
}
