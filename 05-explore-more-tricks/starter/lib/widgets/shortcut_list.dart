import 'package:flutter/material.dart';
import 'package:flutter_vscode_tips_tricks/models/shortcut.dart';
import 'package:flutter_vscode_tips_tricks/utils/strings.dart';

class ShortcutList extends StatelessWidget {
  final Map<String, List<Shortcut>> shortcuts;

  const ShortcutList({Key key, this.shortcuts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: shortcuts.length,
      itemBuilder: (context, index) {
        String key = shortcuts.keys.elementAt(index);
        String category = camelCaseToTitle(key);
        return new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            GroupTitle(category: category),
            for (Shortcut s in shortcuts[key])
              ListTile(
                title: Text("${s.keyBinding}"),
                subtitle: Text("${s.command}"),
              ),
          ],
        );
      },
    );
  }
}

class GroupTitle extends StatelessWidget {
  const GroupTitle({
    Key key,
    @required this.category,
  }) : super(key: key);

  final String category;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Text("$category"),
      color: Colors.grey[400],
    );
  }
}
