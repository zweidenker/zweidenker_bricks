import 'dart:io';

import 'package:mason/mason.dart';


Future<void> run(HookContext context) async {
  final directory = 'packages/${(context.vars['name'] as String).snakeCase}';
  // Write to gitignore if Line does not exist yet
  const pattern = '**/poeditor.properties';
  const fileName = '.gitignore';
  const writeCommand = '''
grep -qF "$pattern" "$fileName" || echo "$pattern" >> "$fileName"
''';

  await Process.run('bash', ['-c', writeCommand], workingDirectory: directory);

  // Add Languages to iOS Bundle
  const runnerPath = 'ios/Runner';
  const key = 'CFBundleLocalizations';
  const infoFile = 'Info.plist';
  const plutil = 'plutil';
  // Clear Array
  await Process.run(plutil, ['-replace', key, '-array', infoFile], workingDirectory: '$directory/$runnerPath');
  // Add Languages
  for (final String language in context.vars['languages']) {
    await Process.run(plutil, ['-insert', key, '-string', language, '-append', infoFile], workingDirectory: '$directory/$runnerPath');
  }

  // Run Flutter gen-l10n
  final genProgress = context.logger.progress('Downloading Translations');
  await Process.run('sh', ['update_languages.sh'], workingDirectory: '$directory/tool');
  genProgress.update('Generating Translations');
  await Process.run('flutter', ['gen-l10n'], workingDirectory: directory);
  genProgress.complete('Translations generated');

}
