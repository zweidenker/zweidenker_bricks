import 'dart:io';

import 'package:mason/mason.dart';

Future<void> run(HookContext context) async {
  context.vars['path'] = <String>['src/screens', context.vars['directory']]
      .where((element) => element.isNotEmpty)
      .join('/');

  final currentDirectory = Directory.current;
  final folderName = currentDirectory.path.split('/').last;

  context.vars['package'] = folderName;

  context.vars['testToolPath'] =
      List.generate(context.vars['path'].split('/').length, (_) => '../')
          .join('');
}
