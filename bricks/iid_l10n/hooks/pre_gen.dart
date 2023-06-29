import 'dart:io';

import 'package:mason/mason.dart';

import 'package:yaml/yaml.dart';
import 'package:yaml_writer/yaml_writer.dart';

Future<void> run(HookContext context) async {
  context.vars['languages'] =
      (context.vars['rawLanguages'] as String).split(',');

  final directory = 'packages/${(context.vars['name'] as String).snakeCase}';
  // Check if flutter generate is true
  final checkProgress = context.logger.progress('Checking Flutter Generate');
  final pubspecPath = '$directory/pubspec.yaml';
  final pubspecFile = File(pubspecPath);
  final pubspecContent = await pubspecFile.readAsString();
  final pubspec = loadYaml(pubspecContent);
  final flutterGenerate = pubspec['flutter']['generate'];

  if (flutterGenerate != true) {
    // Flutter Generate is not enabled
    checkProgress.update(
      'Flutter generate: true is not set in pubspec.yaml. Updating now',
    );
    final adjustedPubspec = Map.of(pubspec);
    adjustedPubspec['flutter'] = Map.of(pubspec['flutter']);
    adjustedPubspec['flutter']['generate'] = true;
    await pubspecFile.writeAsString(YAMLWriter().write(adjustedPubspec));
  }
  checkProgress.complete('Flutter Generate Enabled');
  final pubProgress = context.logger.progress('Adding Dependencies');
  // Add pub dependencies
  await Process.run('mkdir', ['-p', 'lib/l10n'], workingDirectory: directory);
  await Process.run('flutter', ['pub', 'add', 'intl'],
      workingDirectory: directory);
  await Process.run(
    'flutter',
    ['pub', 'add', 'flutter_localizations', '--sdk=flutter'],
    workingDirectory: directory,
  );

  pubProgress.complete('Dependencies Added');
}
