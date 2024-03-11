import 'package:meta/meta.dart';
import 'package:flutter_clearmind_archetype_shared/shared.dart';

import '../../../domain.dart';

abstract class BaseUseCase<Input extends BaseInput, Output> with LogMixin {
  const BaseUseCase();

  @protected
  Output buildUseCase(Input input);
}
