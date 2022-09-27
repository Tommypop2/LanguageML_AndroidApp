import 'dart:convert';

import 'package:flutter/material.dart';
import "storagehandler.dart";

Future<List<String>> getList(String lstName) async {
  // print(await getData(lstName));
  final String data = await getData(lstName);
  if (data != "") {
    return List<String>.from(jsonDecode(await getData(lstName)));
  }
  return [];
}

Future<void> setList(String lstName, List<String> lst) async {
  setStr(lstName, jsonEncode(lst));
}

class SettingsHolder {
  static final SettingsHolder _settingsHolder =
      SettingsHolder._settingsHolderConstructor();
  static Color appBarBackgroundColour = Colors.green;
  static Color mainBackgroundColour = Colors.white;
  static Color navigationAccentColour = Colors.grey;
  static Color appBarAccentColour = Colors.white;
  static Color inputFieldColour = Colors.black;
  static Color buttonColour = Colors.blue;
  static Color navigationBackgroundColour = Colors.white;
  static Future<void> loadSettings([List<String>? settingsList]) async {
    final List<String> settings;
    if (settingsList == null) {
      settings = await getList("settings");
    } else {
      settings = settingsList;
    }

    if (settings.length >= 7) {
      appBarBackgroundColour = Color(int.parse(settings[0]));
      mainBackgroundColour = Color(int.parse(settings[1]));
      navigationAccentColour = Color(int.parse(settings[2]));
      appBarAccentColour = Color(int.parse(settings[3]));
      inputFieldColour = Color(int.parse(settings[4]));
      buttonColour = Color(int.parse(settings[5]));
      navigationBackgroundColour = Color(int.parse(settings[6]));
    }
  }

  static List<String> getSettingsList() {
    List<String> data = [
      appBarBackgroundColour.value.toString(),
      mainBackgroundColour.value.toString(),
      navigationAccentColour.value.toString(),
      appBarAccentColour.value.toString(),
      inputFieldColour.value.toString(),
      buttonColour.value.toString(),
      navigationBackgroundColour.value.toString(),
    ];
    return (data);
  }

  static void serialiseSettings() async {
    setList("settings", getSettingsList());
  }

  static void resetSettings() {
    appBarBackgroundColour = Colors.green;
    mainBackgroundColour = Colors.white;
    navigationAccentColour = Colors.grey;
    appBarAccentColour = Colors.white;
    inputFieldColour = Colors.black;
    buttonColour = Colors.blue;
    navigationBackgroundColour = Colors.white;
  }

  factory SettingsHolder() {
    return _settingsHolder;
  }

  SettingsHolder._settingsHolderConstructor();
}
