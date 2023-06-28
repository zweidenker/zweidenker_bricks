import 'package:{{name.snakeCase()}}/src/providers.dart';
import 'package:flutter/widgets.dart';
import 'package:{{name.snakeCase()}}/src/{{name.snakeCase()}}_app.dart';

void main() {
  runApp(
    const Providers(
      child: {{name.pascalCase()}}App(),
    ),
  );
}
