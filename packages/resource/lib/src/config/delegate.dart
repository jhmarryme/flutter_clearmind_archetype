import 'dart:async';

import 'package:flutter/material.dart';
import 'package:multiple_localization/multiple_localization.dart';

class TranslateLocalizationsDelegate<T> extends LocalizationsDelegate<T> {
  TranslateLocalizationsDelegate({
    required this.isLocaleSupported,
    required this.initializeMessages,
    required this.builder,
  });

  bool Function(Locale locale) isLocaleSupported;
  Future<bool> Function(String) initializeMessages;
  FutureOr<T> Function(String locale) builder;

  @override
  bool isSupported(Locale locale) => isLocaleSupported(locale);

  @override
  Future<T> load(Locale locale) {
    return MultipleLocalizations.load(
      initializeMessages,
      locale,
      builder,
      setDefaultLocale: true,
    );
  }

  @override
  bool shouldReload(LocalizationsDelegate<T> old) => false;
}
