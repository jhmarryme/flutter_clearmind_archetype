import '../../domain.dart';

abstract class AppRepository {
  bool get isLoggedIn;

  bool get isDarkMode;

  LanguageCode get languageCode;

  Future<void> clearCurrentUserData();

  Future<bool> saveIsDarkMode(bool isDarkMode);

  Future<bool> saveLanguageCode(LanguageCode languageCode);

}
