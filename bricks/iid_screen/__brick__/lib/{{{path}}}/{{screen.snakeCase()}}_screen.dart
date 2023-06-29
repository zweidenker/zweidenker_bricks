import 'package:flutter/material.dart';

class {{screen.pascalCase()}}Screen extends StatelessWidget {
  const {{screen.pascalCase()}}Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('{{app.titleCase()}} - {{screen.titleCase()}}')),
    );
  }
}