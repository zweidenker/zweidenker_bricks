import 'dart:io';

import 'package:mason/mason.dart';

Future run(HookContext context) async {
  const fileName = '.gitignore';

  final writeCommand = '''
grep -qF ".mason" "$fileName" || echo ".mason" >> "$fileName"
''';

  await Process.run('bash', ['-c', writeCommand]);

  final progress = context.logger.progress('Mason get');
  await Process.run('mason', ['get']);
  progress.complete();
}
