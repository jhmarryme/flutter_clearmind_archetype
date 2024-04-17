import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain.dart';

part 'paing_output.freezed.dart';

@freezed
class PagingOutput<T> extends BaseOutput with _$PagingOutput<T> {
  const PagingOutput._();

  const factory PagingOutput({
    required List<T> records,
    // 当前页
    @Default(0) int current,
    // 每页显示条数
    @Default(0) int size,
    // 总记录数
    @Default(0) int total,
    // 总页数
    @Default(0) int totalPage,
    // 单页分页条数限制
    @Default(0) int maxLimit,
    // 是否是最后一页
    @Default(true) bool isLastPage,
  }) = _PagingOutput;

  /// 返回 下一页
  /// 如果当前是最后一页, 则返回当前页
  int get nextPage {
    int next = current + 1;
    if (next <= totalPage) {
      return next;
    }
    return current;
  }

  /// 返回 上一页
  /// 如果当前是第一页 则返回当前页
  int get previousPage {
    int previous = current - 1;
    if (previous >= 0) {
      return previous;
    }
    return current;
  }
}
