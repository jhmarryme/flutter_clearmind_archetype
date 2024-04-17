import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain.dart';

part 'paging_input.freezed.dart';

@freezed
class PagingInput extends BaseInput with _$PagingInput {
  const factory PagingInput({
    // 当前页
    @Default(0) int current,
    // 每页显示条数
    @Default(0) int size,
    // 搜索关键字
    @Default('') String keyword,
  }) = _PagingInput;

  // 声明一个工厂构造方法，用于创建PagingInput实例
  factory PagingInput.fromBaseInput({
    int? current,
    int? size,
    String? keyword,
  }) =>
      PagingInput(
        current: current ?? 0,
        size: size ?? 0,
        keyword: keyword ?? '',
      );
}
