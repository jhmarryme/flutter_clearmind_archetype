import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clearmind_archetype_domain/domain.dart';
import 'package:injectable/injectable.dart';

import '../../../../app.dart';

@LazySingleton()
class AppBloc extends BaseBloc<AppEvent, AppState> {
  AppBloc(
    this._getInitialAppDataUseCase,
    this._saveThemeModeCodeUseCase,
    this._saveLanguageCodeUseCase,
  ) : super(const AppState()) {
    on<IsLoggedInStatusChanged>(
      _onIsLoggedInStatusChanged,
      transformer: log(),
    );

    on<AppThemeChanged>(
      _onAppThemeChanged,
      transformer: throttleTime(),
    );

    on<AppLanguageChanged>(
      _onAppLanguageChanged,
      transformer: log(),
    );

    on<AppInitiated>(
      _onAppInitiated,
      transformer: log(),
    );
  }

  final GetInitialAppDataUseCase _getInitialAppDataUseCase;
  final SaveThemeModeCodeUseCase _saveThemeModeCodeUseCase;
  final SaveLanguageCodeUseCase _saveLanguageCodeUseCase;

  void _onIsLoggedInStatusChanged(
      IsLoggedInStatusChanged event, Emitter<AppState> emit) {
    emit(state.copyWith(isLoggedIn: event.isLoggedIn));
  }

  Future<void> _onAppThemeChanged(
      AppThemeChanged event, Emitter<AppState> emit) async {
    await runBlocCatching(
      action: () async {
        await _saveThemeModeCodeUseCase.execute(
            SaveThemeModeCodeInput(themeModeCode: event.themeModeCode));
        _updateThemeSetting(event.themeModeCode);
        emit(state.copyWith(themeModeCode: event.themeModeCode));
      },
    );
  }

  Future<void> _onAppLanguageChanged(
      AppLanguageChanged event, Emitter<AppState> emit) async {
    await runBlocCatching(
      action: () async {
        await _saveLanguageCodeUseCase
            .execute(SaveLanguageCodeInput(languageCode: event.languageCode));
        emit(state.copyWith(languageCode: event.languageCode));
      },
    );
  }

  Future<void> _onAppInitiated(
      AppInitiated event, Emitter<AppState> emit) async {
    await runBlocCatching(
      action: () async {
        final output =
            _getInitialAppDataUseCase.execute(const GetInitialAppDataInput());
        _updateThemeSetting(output.themeModeCode);
        emit(state.copyWith(
          themeModeCode: output.themeModeCode,
          isLoggedIn: output.isLoggedIn,
          languageCode: output.languageCode,
        ));
      },
    );
  }

  void _updateThemeSetting(ThemeModeCode themeModeCode) {
    AppThemeSetting.currentAppThemeMode = themeModeCode;
  }
}
