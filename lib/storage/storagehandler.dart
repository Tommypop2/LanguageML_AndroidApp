import 'package:shared_preferences/shared_preferences.dart';

Future<void> setStr(String str, String data) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString(str, data);
}

Future<String> getData(String str) async {
  final prefs = await SharedPreferences.getInstance();
  final String result = prefs.getString(str) ?? "";
  return result;
}
