import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

ThemeData light_mode = ThemeData(
  brightness: Brightness.light,
);

ThemeData dark_mode = ThemeData(
  brightness: Brightness.dark,
);

class ThemeNotifier extends ChangeNotifier {
  final String key = "theme";
  final String language = "locale";
  SharedPreferences? _preferences;
  late bool _darkMode;
  late String _locale;

  bool get darkMode => _darkMode;
  Locale get locale => Locale(_locale);

  ThemeNotifier() {
    _darkMode = true;
    _locale = 'pt';
    _loadFromPreferences();
    _loadFromPreferencesLanguage();
  }

  // _initialPreferences() async {
  //   if (_preferences == null)
  //     _preferences = await SharedPreferences.getInstance();
  // }

  _savePreferences() async {
    // await _initialPreferences();
    _preferences = await SharedPreferences.getInstance();
    _preferences!.setBool(key, _darkMode);
  }

  _savePreferencesLanguage(String locale) async {
    // await _initialPreferences();
    _preferences = await SharedPreferences.getInstance();
    _preferences!.setString(language, locale);
  }

  _loadFromPreferences() async {
    // await _initialPreferences();
    _preferences = await SharedPreferences.getInstance();
    _darkMode = _preferences!.getBool(key) ?? true;
    notifyListeners();
  }

  _loadFromPreferencesLanguage() async {
    // await _initialPreferences();
    _preferences = await SharedPreferences.getInstance();
    _locale = _preferences!.getString(language) ?? 'pt';
    notifyListeners();
  }

  toggleChangeTheme() {
    _darkMode = !_darkMode;
    _savePreferences();
    notifyListeners();
  }

  toogleChangeLanguage(String locale) {
    _locale = locale;
    _savePreferencesLanguage(locale);
    notifyListeners();
  }
}
