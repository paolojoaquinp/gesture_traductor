

import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static final _instance = UserPreferences._internal();

  factory UserPreferences() => _instance;

  UserPreferences._internal();

  SharedPreferences? _prefs;

  initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // GET y SET de la "route" por default
  String get defaultRoute {
    return _prefs?.getString('defaultRoute') ?? '/onboarding';
  }

  set defaultRoute (String value) {
    _prefs?.setString('defaultRoute', value);
  }
}