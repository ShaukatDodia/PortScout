import 'package:shared_preferences/shared_preferences.dart';

class UserData {
  static late SharedPreferences _prefs;

  static Future init() async => _prefs = await SharedPreferences.getInstance();

  static Future setUserName(String username) async =>
      await _prefs.setString('username', username);

  static String? getUserName() => _prefs.getString('username');
}
