import 'package:flutter/material.dart';

import '../../resources.dart';
import '../generated/intl/messages_all.dart';

class ClearmindArchetypeResourceLocalizations {
  /// Delegate.
  static TranslateLocalizationsDelegate<S> delegate =
      TranslateLocalizationsDelegate(
    isLocaleSupported: S.delegate.isSupported,
    initializeMessages: initializeMessages,
    builder: (locale) async {
      await S.load(Locale(locale));
      return S();
    },
  );
}
