import 'dart:io';

import 'package:mason/mason.dart';

Future<void> run(HookContext context) async {
  const pattern = '**/coverage/';
  const fileName = '.gitignore';
  const writeCommand = '''
grep -qF "$pattern" "$fileName" || echo "$pattern" >> "$fileName"
''';

  await Process.run('bash', ['-c', writeCommand]);

  final name = (context.vars['name'] as String).snakeCase;

  final flutterProgress = context.logger.progress('Pub get');
  await Process.run('flutter', ['pub get'], workingDirectory: 'packages/$name');
  flutterProgress.cancel();
}
