import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  bool _darkTheme = false;
  ThemeData _currentTheme = ThemeData.light();

  bool get darkTheme => _darkTheme;
  ThemeData get currentTheme => _currentTheme;

  void setDarkTheme(bool value) {
    _darkTheme = value;
    _currentTheme = value ? _buildDarkTheme() : _buildLightTheme();
    notifyListeners(); // Notify listeners when theme changes
  }

  ThemeData _buildDarkTheme() {
    return ThemeData.dark().copyWith(
      primaryColor: const Color(0x4895EF),
      appBarTheme: const AppBarTheme(color: Color(0x4895EF)),
      backgroundColor: const Color(0x23E8A),
      scaffoldBackgroundColor: const Color(0x23E8A),
      textTheme: _buildTextTheme(textColor: const Color(0xFFFFFFFF)),
    );
  }

  ThemeData _buildLightTheme() {
    return ThemeData.light().copyWith(
      primaryColor: const Color(0x560BAD),
      appBarTheme: const AppBarTheme(color: Color(0x560BAD)),
      backgroundColor: Colors.white,
      scaffoldBackgroundColor: Colors.white,
      textTheme: _buildTextTheme(textColor: const Color(0x23E8A)),
    );
  }

  TextTheme _buildTextTheme({required Color textColor}) {
    return _currentTheme.textTheme.copyWith(
      bodyText1: _currentTheme.textTheme.bodyText1!.copyWith(color: textColor),
      bodyText2: _currentTheme.textTheme.bodyText2!.copyWith(color: textColor),
    );
  }
}