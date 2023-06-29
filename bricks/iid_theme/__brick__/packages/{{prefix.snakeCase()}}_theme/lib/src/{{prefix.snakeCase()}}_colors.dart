import 'package:flutter/material.dart';

class {{prefix.pascalCase()}}Colors {
  /// Private Constructor to hide it from Creating
  {{prefix.pascalCase()}}Colors._();

  static const primary = Color(0xFF{{primaryColor}});

  static const error = Color(0xFFFF0000);
}

extension ColorX on Color {
  Color get inverse {
    return Color.fromARGB(alpha, 255 - red, 255 - green, 255 - blue);
  }
}
