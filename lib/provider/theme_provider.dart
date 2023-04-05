import 'package:flutter/material.dart';

class MyTheme {
  static final darkTheme = ThemeData(
      appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.white70)),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      scaffoldBackgroundColor: Colors.grey.shade900,
      colorScheme: const ColorScheme.dark(),
      primaryColor: Colors.white,
      textTheme: const TextTheme(bodyLarge: TextStyle(color: Colors.white)),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.white,
          extendedTextStyle: TextStyle(color: Colors.grey.shade900)),
      iconTheme: const IconThemeData(color: Colors.white));

  static final lightTheme = ThemeData(
    appBarTheme: AppBarTheme(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.grey.shade900,
        elevation: 0),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: Colors.white,
    // colorScheme: const ColorScheme.light(),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Colors.grey.shade900,
        extendedTextStyle: const TextStyle(color: Colors.white)),
    iconTheme: const IconThemeData(
      color: Colors.white,
      // primaryColor: Colors.white
    ),
  );
}

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.dark;

  bool get isDarkMode => themeMode == ThemeMode.dark;

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}
