import 'package:mason/mason.dart';

Future<void> run(HookContext context) async {
  final iosPath = 'packages/${context.vars['app']}/ios';
  context.logger.success('Fastlane Configuration created');
  context.logger.warn('To create the provisioning profiles navigate to $iosPath and run `fastlane certificates`');
  context.logger.warn('If you need to create new provisioning profiles set `readonly: false` in $iosPath/fastlane/Fastfile');
}
