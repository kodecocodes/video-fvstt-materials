// To parse this JSON data, do
//
//     final shortcutData = shortcutDataFromJson(jsonString);

import 'dart:convert';

ShortcutData shortcutDataFromJson(String str) =>
    ShortcutData.fromJson(json.decode(str));

String shortcutDataToJson(ShortcutData data) => json.encode(data.toJson());

class ShortcutData {
  String name;
  int version;
  Map<String, List<Shortcut>> shortcuts;

  ShortcutData({
    this.name,
    this.version,
    this.shortcuts,
  });

  factory ShortcutData.fromJson(Map<String, dynamic> json) => ShortcutData(
        name: json["name"],
        version: json["version"],
        shortcuts: Map.from(json["shortcuts"]).map((k, v) =>
            MapEntry<String, List<Shortcut>>(
                k, List<Shortcut>.from(v.map((x) => Shortcut.fromJson(x))))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "version": version,
        "shortcuts": Map.from(shortcuts).map((k, v) =>
            MapEntry<String, dynamic>(
                k, List<dynamic>.from(v.map((x) => x.toJson())))),
      };
}

class Shortcut {
  String keyBinding;
  String command;

  Shortcut({
    this.keyBinding,
    this.command,
  });

  factory Shortcut.fromJson(Map<String, dynamic> json) => Shortcut(
        keyBinding: json["keyBinding"],
        command: json["command"],
      );

  Map<String, dynamic> toJson() => {
        "keyBinding": keyBinding,
        "command": command,
      };
}
