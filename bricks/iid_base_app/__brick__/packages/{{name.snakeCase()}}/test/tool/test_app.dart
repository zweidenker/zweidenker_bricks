import 'package:{{name.snakeCase()}}/src/providers.dart';
import 'package:{{name.snakeCase()}}/src/repository.dart';
import 'package:flutter/material.dart';

class TestApp extends StatelessWidget {
  const TestApp({
    super.key,
    this.locale,
    this.repository,
    required this.child,
  });

  final Widget child;
  final Locale? locale;
  final Repository? repository;

  @override
  Widget build(BuildContext context) {
    return Providers(
      repository: repository,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        locale: locale,
        home: Material(
          child: child,
        ),
      ),
    );
  }
}
