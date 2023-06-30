import 'package:flutter/material.dart';
import 'package:{{name.snakeCase()}}/src/screens/home_screen.dart';

class {{name.pascalCase()}}App extends StatelessWidget {
  const {{name.pascalCase()}}App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: HomeScreen(),
      ),
    );
  }
}