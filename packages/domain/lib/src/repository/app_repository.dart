import '../../domain.dart';

abstract class AppRepository {
  bool get isLoggedIn;

  LanguageCode get languageCode;
  
  ThemeModeCode get themeModeCode;

  Future<void> clearCurrentUserData();

  Future<bool> saveThemeModeCode(ThemeModeCode themeCode);

  Future<bool> saveLanguageCode(LanguageCode languageCode);

}
