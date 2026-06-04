import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static late SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }


  //modo oscuro
  static Future<void> saveDarkMode(bool value) async =>
      _prefs.setBool('dark_mode', value);

  static bool getDarkMode() =>
      _prefs.getBool('dark_mode') ?? false;

  //notificaciones
  static Future<void> saveNotifications(bool value) async =>
      _prefs.setBool('notifications_enabled', value);

  static bool getNotifications() =>
      _prefs.getBool('notifications_enabled') ?? true;
}