import 'package:{{prefix.snakeCase()}}_theme/src/{{prefix.snakeCase()}}_colors.dart';
import 'package:flutter/material.dart';
import 'package:universal_platform/universal_platform.dart';

/// The {{prefix.pascalCase()}} Theme
///
/// A theme for all colors and fonts used in {{prefix.pascalCase()}} apps
class {{prefix.pascalCase()}}Theme {
  {{prefix.pascalCase()}}Theme._({required this.brightness});

  /// Creates a light [{{prefix.pascalCase()}}Theme]
  static ThemeData light() {
    return {{prefix.pascalCase()}}Theme._(brightness: Brightness.light)._theme;
  }

  /// Creates a dark [{{prefix.pascalCase()}}Theme]
  static ThemeData dark() {
    return {{prefix.pascalCase()}}Theme._(brightness: Brightness.dark)._theme;
  }

  /// The brightness of the theme
  final Brightness brightness;

  /// Creates the theme
  ThemeData get _theme {
    late final Color darkWindowBackground;
    if (UniversalPlatform.isIOS) {
      darkWindowBackground = Colors.black;
    } else {
      darkWindowBackground = const Color(0xFF282625);
    }
    final windowBackground = _withBrightness(
      light: const Color(0xFFF7F7F7),
      dark: darkWindowBackground,
    );
    final baseTheme =
        _withBrightness(light: ThemeData.light(), dark: ThemeData.dark());
    final textTheme = _textTheme(baseTheme.textTheme);

    final colorScheme = baseTheme.colorScheme.copyWith(
      primary: {{prefix.pascalCase()}}Colors.primary,
      secondary: {{prefix.pascalCase()}}Colors.primary,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      background: windowBackground,
      error: {{prefix.pascalCase()}}Colors.error,
    );
    return baseTheme.copyWith(
      primaryColor: colorScheme.primary,
      indicatorColor: colorScheme.primary,
      colorScheme: colorScheme,
      textSelectionTheme: baseTheme.textSelectionTheme.copyWith(
        selectionHandleColor: colorScheme.primary,
        selectionColor: colorScheme.primary.withOpacity(0.4),
      ),
      floatingActionButtonTheme: baseTheme.floatingActionButtonTheme.copyWith(
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
      ),
      tabBarTheme: baseTheme.tabBarTheme.copyWith(
        labelColor: colorScheme.primary,
        unselectedLabelColor: _withBrightness(
          light: Colors.black45,
          dark: Colors.white54,
        ),
      ),
      scaffoldBackgroundColor: windowBackground,
      textTheme: textTheme,
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return null;
          }
          if (states.contains(MaterialState.selected)) {
            return colorScheme.primary;
          }
          return null;
        }),
      ),
      radioTheme: RadioThemeData(
        fillColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return null;
          }
          if (states.contains(MaterialState.selected)) {
            return colorScheme.primary;
          }
          return null;
        }),
      ),
      switchTheme: SwitchThemeData(
        thumbColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return null;
          }
          if (states.contains(MaterialState.selected)) {
            return colorScheme.primary;
          }
          return null;
        }),
        trackColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return null;
          }
          if (states.contains(MaterialState.selected)) {
            return colorScheme.primary;
          }
          return null;
        }),
      ),
    );
  }

  TextTheme _textTheme(TextTheme baseTheme) {
    const fontPackage = '{{prefix.snakeCase()}}_theme';
    final theme = TextTheme(
      displayLarge: baseTheme.displayLarge?.copyWith(
        package: fontPackage,
      ),
      displayMedium: baseTheme.displayMedium?.copyWith(
        package: fontPackage,
      ),
      displaySmall: baseTheme.displaySmall?.copyWith(
        package: fontPackage,
      ),
      headlineLarge: baseTheme.headlineLarge?.copyWith(
        package: fontPackage,
      ),
      headlineMedium: baseTheme.headlineMedium?.copyWith(
        package: fontPackage,
      ),
      headlineSmall: baseTheme.headlineSmall?.copyWith(
        package: fontPackage,
      ),
      titleLarge: baseTheme.titleLarge?.copyWith(
        package: fontPackage,
      ),
      titleMedium: baseTheme.titleMedium?.copyWith(
        package: fontPackage,
      ),
      titleSmall: baseTheme.titleSmall?.copyWith(
        package: fontPackage,
      ),
      bodyLarge: baseTheme.bodyLarge?.copyWith(
        package: fontPackage,
      ),
      bodyMedium: baseTheme.bodyMedium?.copyWith(
        package: fontPackage,
      ),
      bodySmall: baseTheme.bodySmall?.copyWith(
        package: fontPackage,
      ),
      labelLarge: baseTheme.labelLarge?.copyWith(
        package: fontPackage,
      ),
      labelMedium: baseTheme.labelMedium?.copyWith(
        package: fontPackage,
      ),
      labelSmall: baseTheme.labelSmall?.copyWith(
        package: fontPackage,
        letterSpacing: 1.4,
      ),
    );
    return theme.apply(
      bodyColor: _withBrightness(
        light: Colors.black54,
        dark: Colors.white54,
      ),
      displayColor: _withBrightness(
        light: Colors.black87,
        dark: Colors.white,
      ),
    );
  }

  T _withBrightness<T>({required T light, required T dark}) {
    if (brightness == Brightness.dark) {
      return dark;
    } else {
      return light;
    }
  }
}
