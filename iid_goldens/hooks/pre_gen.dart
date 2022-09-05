import 'dart:io';

import 'package:mason/mason.dart';
import 'package:yaml/yaml.dart';
import 'package:yaml_writer/yaml_writer.dart';

Future<void> run(HookContext context) async {
  final directory = 'packages/${context.vars['package']}';
  // Add dependencies
  final dependenciesProgress = context.logger.progress('Adding Dependencies');
  final devDependencies = [
    'flutter_lints',
    'alchemist',
    'golden_toolkit',
  ];

  for (final devDependency in devDependencies) {
    await Process.run(
      'flutter',
      ['pub', 'add', devDependency, '--dev'],
      workingDirectory: directory,
    );
  }

  dependenciesProgress.complete('Dependencies added');

  // Enable Material
  final materialProgress = context.logger.progress('Enable Material');

  final property = 'uses-material-design';
  final pubspecPath = '$directory/pubspec.yaml';
  final pubspecFile = File(pubspecPath);
  final pubspecContent = await pubspecFile.readAsString();
  final pubspec = loadYaml(pubspecContent);
  final enabled = pubspec['flutter'][property];

  if (enabled != true) {
    // Flutter Generate is not enabled
    materialProgress.update(
        'Flutter $property: true is not set in pubspec.yaml. Updating now');
    final adjustedPubspec = Map.of(pubspec);
    adjustedPubspec['flutter'] = Map.of(pubspec['flutter']);
    adjustedPubspec['flutter'][property] = true;
    await pubspecFile.writeAsString(YAMLWriter().write(adjustedPubspec));
  }

  materialProgress.complete('Material enabled');

  // Adjust gitignore
  final gitignoreProgress = context.logger.progress('Adjusting gitignore');
  
  const lines = [
    r'test/**/goldens/**/*.*',
    r'test/**/failures/**/*.*',
    r'!test/**/goldens/ci/*.*',
  ];

  const fileName = '.gitignore';
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
  gitignoreProgress.complete('Adjusting gitignore');
}
