import 'package:flutter/material.dart';
import 'package:flutter_clearmind_archetype_resource/resources.dart';
import 'package:flutter_clearmind_archetype_shared/shared.dart';

enum InitialAppRoute {
  login,
  main,
}

enum Gender {
  male(ServerRequestResponseConstants.male),
  female(ServerRequestResponseConstants.female),
  other(ServerRequestResponseConstants.other),
  unknown(ServerRequestResponseConstants.unknown);

  const Gender(this.serverValue);

  final int serverValue;

  static const defaultValue = unknown;
}

enum LanguageCode {
  en(
    localeCode: LocaleConstants.en,
    serverValue: ServerRequestResponseConstants.en,
  ),
  ja(
    localeCode: LocaleConstants.ja,
    serverValue: ServerRequestResponseConstants.ja,
  ),
  zhCn(
    localeCode: LocaleConstants.zhCn,
    serverValue: ServerRequestResponseConstants.zhCn,
  ),
  zhTw(
    localeCode: LocaleConstants.zhTw,
    serverValue: ServerRequestResponseConstants.zhTw,
  ),
  ;

  const LanguageCode({
    required this.localeCode,
    required this.serverValue,
  });

  final String localeCode;
  final String serverValue;

  static const defaultValue = zhCn;

  /// 获取languageCode, 从zh_TW取出zh部分
  String get languageCode => localeCode.substring(0, 2);

  /// 获取countryCode, 从zh_TW取出TW部分
  String get countryCode {
    if (localeCode.length <= 2) {
      return '';
    }
    return localeCode.substring(3, 5);
  }
}

enum NotificationType {
  unknown,
  newPost,
  liked;

  static const defaultValue = unknown;
}

enum BottomTab {
  home(icon: Icon(Icons.home), activeIcon: Icon(Icons.home)),
  search(icon: Icon(Icons.search), activeIcon: Icon(Icons.search)),
  myPage(icon: Icon(Icons.people), activeIcon: Icon(Icons.people));

  const BottomTab({
    required this.icon,
    required this.activeIcon,
  });

  final Icon icon;
  final Icon activeIcon;

  String get title {
    switch (this) {
      case BottomTab.home:
        return S.current.home;
      case BottomTab.search:
        return S.current.search;
      case BottomTab.myPage:
        return S.current.myPage;
    }
  }
}
