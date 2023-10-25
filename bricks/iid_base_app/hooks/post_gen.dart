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
  final directory = 'packages/$name';

  final testSetupProgress = context.logger.progress('Setting up Tests');
  // Add Dependencies for Golden Tests
  final devDependencies = [
    'flutter_lints',
    'alchemist',
    'golden_toolkit',
  ];

  for (final devDependency in devDependencies) {
    testSetupProgress.update('Adding $devDependency');
    await Process.run(
      'flutter',
      ['pub', 'add', devDependency, '--dev'],
      workingDirectory: directory,
    );
  }

  // Adjust gitignore
  testSetupProgress.update('Setup .gitignore');

  const lines = [
    '**/coverage/',
    r'test/**/goldens/**/*.*',
    r'test/**/failures/**/*.*',
    r'!test/**/goldens/ci/*.*',
  ];

  for (final line in lines) {
    final writeCommand = '''
grep -qF "$line" "$fileName" || echo "$line" >> "$fileName"
''';

    await Process.run(
      'bash',
      ['-c', writeCommand],
      workingDirectory: directory,
    );
  }

  testSetupProgress.complete('Tests setup');

  final testProgress = context.logger.progress('Running Tests');
  await Process.run('flutter', ['pub get'], workingDirectory: directory);
  final tests = await Process.run(
    'flutter',
    ['test', '--update-goldens'],
    workingDirectory: directory,
  );
  if (tests.exitCode == 0) {
    testProgress.complete('Tests completed');
  } else {
    testProgress.fail('Tests failed');
    throw tests.stderr;
  }

  final formattingProgress = context.logger.progress('Formatting');
  final formatting = await Process.run('dart', ['format', '.'], workingDirectory: directory);
  if (formatting.exitCode == 0) {
    formattingProgress.complete('Formatting completed\n${formatting.stdout}');
  } else {
    formattingProgress.fail('Formatting failed');
    throw tests.stderr;
  }
}
