import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain.dart';

part 'paging_list.freezed.dart';

/// 用于分页结果的entity
/// 仅满足个人的接口习惯, 可以自定义
@freezed
class PagingList<T> with _$PagingList<T> {
  const PagingList._();

  const factory PagingList({
    // 不允许null, 如果没有数据, 请使用[]
    required List<T> records,
    @Default(-99) int? current,
    @Default(-99) int? size,
    @Default(-99) int? total,
    @Default(-99) int? totalPage,
    @Default(-99) int? maxLimit,
  }) = _PagingList;

  /// 计算当前页是否是最后一页
  bool get isLastPage {
    if (records.isEmpty) {
      return true;
    }
    if (size == null || total == null || current == null) {
      return true;
    }
    if (totalPage != null) {
      return current == totalPage;
    }
    double pages = total! / size!;
    return current! >= pages.ceil();
    ;
  }

  PagingOutput<T> toPagingOutput() {
    return PagingOutput(
      records: records,
      isLastPage: isLastPage,
      current: current ?? -99,
      size: size ?? -99,
      total: total ?? -99,
      totalPage: totalPage ?? -99,
      maxLimit: maxLimit ?? -99,
    );
  }
}
