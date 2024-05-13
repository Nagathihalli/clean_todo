import 'package:flutter/foundation.dart' show immutable;

@immutable
class AppKeys {
  const AppKeys._();

  static String isDarkMode = 'isDarkMode';
  static String dbTable = 'tasks';
}