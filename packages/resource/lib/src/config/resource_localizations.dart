import 'package:flutter/material.dart';

import '../../resources.dart';
import '../generated/intl/messages_all.dart';

class ClearmindArchetypeResourceLocalizations {
  /// Delegate.
  static TranslateLocalizationsDelegate<ClearmindArchtypeS> delegate =
      TranslateLocalizationsDelegate(
    isLocaleSupported: ClearmindArchtypeS.delegate.isSupported,
    initializeMessages: initializeMessages,
    builder: (locale) async {
      await ClearmindArchtypeS.load(Locale(locale));
      return ClearmindArchtypeS();
    },
  );
}
