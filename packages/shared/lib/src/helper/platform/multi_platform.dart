import 'dart:io';

import 'package:flutter/foundation.dart';

class MultiPlatform {
  static bool get isIos {
    return !kIsWeb && Platform.isIOS;
  }

  static bool get isAndroid {
    return !kIsWeb && Platform.isAndroid;
  }

  static bool get isWeb {
    return kIsWeb;
  }

  static bool get isWindows {
    return !kIsWeb && Platform.isWindows;
  }

  static bool get isMacOS {
    return !kIsWeb && Platform.isMacOS;
  }

  static bool get isLinux {
    return !kIsWeb && Platform.isLinux;
  }

  static bool get isFuchsia {
    return !kIsWeb && Platform.isFuchsia;
  }
}
