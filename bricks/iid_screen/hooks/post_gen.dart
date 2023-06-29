import 'dart:io';

import 'package:mason/mason.dart';

Future<void> run(HookContext context) async {
  final path = context.vars['path'];
  final baseName = (context.vars['screen'] as String).snakeCase;
  final formatProgress = context.logger.progress('Formatting');
  await Process.run('dart', ['format', 'lib/$path/${baseName}_screen.dart']);
  await Process.run('dart', [
    'format',
    'test/$path/${baseName}_screen_test.dart',
  ]);
  formatProgress.complete('Formatted');

  await Process.run('flutter', [
    'test',
    'test/$path/${baseName}_screen_test.dart',
    '--update-goldens',
  ]);
  final testProgress = context.logger.progress('Running Tests');
  final tests = await Process.run('flutter', [
    'test',
    'test/$path/${baseName}_screen_test.dart',
    '--update-goldens',
  ]);
  if (tests.exitCode == 0) {
    testProgress.complete('Tests completed');
  } else {
    testProgress.fail('Tests failed');
    throw tests.stderr;
  }
}
