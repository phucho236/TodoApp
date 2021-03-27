import 'package:shared_preferences/shared_preferences.dart';

const String keyTodos = "keyTodos";
Future<bool> setTodos({String newValue}) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.setString(keyTodos, newValue);
}

Future<String> getTodos() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString(keyTodos);
}
