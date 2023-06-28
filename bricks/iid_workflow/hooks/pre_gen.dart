import 'package:mason/mason.dart';
import 'dart:io';

void run(HookContext context) {
  final currentDirectory = Directory.current;
  final folderName = currentDirectory.path.split('/').last;

  context.vars = {...context.vars, 'workingDir': folderName};
}
