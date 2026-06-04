import 'package:flutter/material.dart';
import '../core/services/storage_service.dart';

class SettingsViewModel extends ChangeNotifier {
  bool _darkMode = false;
  bool _notifications = true;

  bool get darkMode => _darkMode;
  bool get notifications => _notifications;

  ThemeMode get themeMode => _darkMode ? ThemeMode.dark : ThemeMode.light; //pal modo oscuro real

  SettingsViewModel() {
    _loadSettings();
  }

  void _loadSettings() {
    _darkMode = StorageService.getDarkMode();
    _notifications = StorageService.getNotifications();
  }

  void toggleDarkMode(bool value) {
    _darkMode = value; //si es true o false
    StorageService.saveDarkMode(value);
    notifyListeners();
  }

  void toggleNotifications(bool value) {
    _notifications = value; //si es true o false
    StorageService.saveNotifications(value);
    notifyListeners();
  }

  void refreshSettings() {
    _loadSettings();
    notifyListeners();
  }
}