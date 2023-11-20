import 'package:flutter/widgets.dart' show BuildContext;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:collection/collection.dart';
import 'package:universal_io/io.dart' hide HttpClient;

export 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension AppLocalizationsX on BuildContext {
  AppLocalizations get l10n {
    return AppLocalizations.of(this) ?? generateLocationWithoutContext();
  }
}

AppLocalizations generateLocationWithoutContext() {
  return lookupAppLocalizations(
    AppLocalizations.supportedLocales.firstWhereOrNull(
          (locale) => (locale.languageCode.compareTo(Platform.localeName)) == 0,
        ) ??
        AppLocalizations.supportedLocales.first,
  );
}
