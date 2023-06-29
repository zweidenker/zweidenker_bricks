import 'dart:io';

import 'package:mason/mason.dart';

Future run(HookContext context) async {
  await Process.run('rm', ['-rf', '.mason']);
  await Process.run('rm', ['-rf', 'mason.yaml']);
  await Process.run('rm', ['-rf', 'mason-lock.json']);
}
