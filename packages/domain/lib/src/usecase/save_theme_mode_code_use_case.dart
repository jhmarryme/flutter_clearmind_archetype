import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../domain.dart';

part 'save_theme_mode_code_use_case.freezed.dart';

@Injectable()
class SaveThemeModeCodeUseCase extends BaseFutureUseCase<SaveThemeModeCodeInput, SaveThemeModeCodeOutput> {
  SaveThemeModeCodeUseCase(this._repository);

  final AppRepository _repository;

  @protected
  @override
  Future<SaveThemeModeCodeOutput> buildUseCase(SaveThemeModeCodeInput input) async {
    await _repository.saveThemeModeCode(input.themeModeCode);

    return const SaveThemeModeCodeOutput();
  }
}

@freezed
class SaveThemeModeCodeInput extends BaseInput with _$SaveThemeModeCodeInput {
  const factory SaveThemeModeCodeInput({
    required ThemeModeCode themeModeCode,
  }) = _SaveThemeModeCodeInput;
}

@freezed
class SaveThemeModeCodeOutput extends BaseOutput with _$SaveThemeModeCodeOutput {
  const SaveThemeModeCodeOutput._();

  const factory SaveThemeModeCodeOutput() = _SaveThemeModeCodeOutput;
}
