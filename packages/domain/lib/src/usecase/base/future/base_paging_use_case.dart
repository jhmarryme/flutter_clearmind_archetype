import 'package:flutter_clearmind_archetype_shared/shared.dart';

import '../../../../domain.dart';

abstract class BasePagingUseCase<Input extends BaseInput, Output>
    extends BaseUseCase<Input, Future<PagingList<Output>>> {
  BasePagingUseCase()
      : _output = PagingOutput<Output>(records: <Output>[]),
        _oldOutput = PagingOutput<Output>(records: <Output>[]);

  /// 解析后的结果
  PagingOutput<Output> _output;

  /// 用于保存最近一次成功的结果, 以便结果解析失败时还原
  PagingOutput<Output> _oldOutput;

  /// 当前页数
  int get current => _output.current;

  /// 当前页大小
  int get size => _output.size;

  Future<PagingOutput<Output>> execute(Input input, bool isInitialLoad) async {
    try {
      if (isInitialLoad) {
        _output = PagingOutput<Output>(records: <Output>[]);
      }
      if (LogConfig.enableLogUseCaseInput) {
        logD('LoadMoreUseCase Input: $input, isInitialLoad: $isInitialLoad,');
      }
      final pagedList = await buildUseCase(input);
      final newOutput = pagedList.toPagingOutput();

      _output = newOutput;
      _oldOutput = newOutput;
      if (LogConfig.enableLogUseCaseOutput) {
        logD(
          'LoadMoreUseCase Output: pagedList: $pagedList, newOutput: $newOutput',
        );
      }

      return newOutput;
    } catch (e) {
      if (LogConfig.enableLogUseCaseError) {
        logE('FutureUseCase Error: $e');
      }
      _output = _oldOutput;

      throw e is AppException ? e : AppUncaughtException(e);
    }
  }
}
