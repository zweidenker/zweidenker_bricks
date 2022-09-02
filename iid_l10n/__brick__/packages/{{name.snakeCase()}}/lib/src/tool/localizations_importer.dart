import 'package:flutter/widgets.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// Helper Class for easier importing of generated AppLocalizations
class L10n {
  L10n._();

  static AppLocalizations of(context) {
    return AppLocalizations.of(context)!;
  }

  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      AppLocalizations.localizationsDelegates;

  static const List<Locale> supportedLocales =
      AppLocalizations.supportedLocales;
}
