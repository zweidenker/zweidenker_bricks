import 'dart:io';

import 'package:mason/mason.dart';

Future<void> run(HookContext context) async {
  final themeDirectory = 'packages/${context.vars['prefix']}_theme';


  final dependeciesProgress = context.logger.progress('Adding dependencies');
  final dependencies = [
    'universal_platform',
  ];
  for (final dependency in dependencies) {
    dependeciesProgress.update('Adding $dependency');
    await Process.run(
      'flutter',
      ['pub', 'add', dependency],
      workingDirectory: themeDirectory,
    );
  }

  final devDependencies = [
    'flutter_lints',
    'alchemist',
    'golden_toolkit',
  ];

  for (final devDependency in devDependencies) {
    dependeciesProgress.update('Adding $devDependency');
    await Process.run(
      'flutter',
      ['pub', 'add', devDependency, '--dev'],
      workingDirectory: themeDirectory,
    );
  }
  dependeciesProgress.complete('Dependencies added.');

  // Update Goldens:
  final testProgress = context.logger.progress('Running Tests');
  final tests = await Process.run('flutter', ['test', '--update-goldens'],
      workingDirectory: themeDirectory,);
  if (tests.exitCode == 0) {
  testProgress.complete('Tests completed');
  } else {
    testProgress.fail('Tests failed');
    throw tests.stderr;
  }

  // Format
  await Process.run('flutter', ['format', '.'],
      workingDirectory: themeDirectory,);
}
