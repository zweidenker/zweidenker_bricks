import 'dart:io';

import 'package:mason/mason.dart';

Future<void> run(HookContext context) async {
  await Process.run('mkdir', ['packages']);

  final org = context.vars['orgId'];
  final name = (context.vars['name'] as String).snakeCase;

  final flutterProgress = context.logger.progress('Creating Flutter App');

  final platforms = (context.vars['platforms'] as Iterable).join(',');

  await Process.run(
    'flutter',
    [
      'create',
      '--empty',
      '--platforms=$platforms',
      '--org=$org',
      name,
    ],
    workingDirectory: 'packages',
  );
  await Process.run('rm', ['-rf', 'main.dart'],
      workingDirectory: 'packages/$name/lib');
  await Process.run(
    'rm',
    ['-rf', 'analysis_options.yaml'],
    workingDirectory: 'packages/$name',
  );
  await Process.run(
    'mkdir',
    ['test'],
    workingDirectory: 'packages/$name',
  );
  await Process.run(
    'rm',
    ['-rf', 'widget_test.dart'],
    workingDirectory: 'packages/$name/test',
  );
  await Process.run(
    'flutter',
    ['pub', 'add', 'provider'],
    workingDirectory: 'packages/$name',
  );
  await Process.run(
    'flutter',
    ['pub', 'add', 'zweidenker_heinzelmen'],
    workingDirectory: 'packages/$name',
  );
  await Process.run('flutter', ['pub', 'add', 'mocktail', '--dev'],
      workingDirectory: 'packages/$name');
  flutterProgress.complete(
    'Created Flutter App',
  );
}
