import 'package:mason/mason.dart';
import 'dart:io';

Future<void> run(HookContext context) async {
  final melos = context.logger.progress('Updating melos');
  await Process.run('flutter', ['pub global activate melos']);
  melos.update('Bootstraping');
  await Process.run('melos', ['bootstrap']);
  melos.complete('Boostrap completed');
}
