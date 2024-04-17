import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'paging_data_response.freezed.dart';

part 'paging_data_response.g.dart';

/// 支持的数据结构如下
/*
{
  "code": 200,
  "msg": "success",
  "data": {
    "current": 4,
    "size": 5,
    "total": 16,
    "maxLimit": 5,
    "records": [
      {
        "id": "16",
        "name": "name",
        "age": 64
      }
    ],
  }
}
 */
@Freezed(genericArgumentFactories: true)
class PagingDataResponse<T> with _$PagingDataResponse<T> {
  const factory PagingDataResponse({
    @JsonKey(name: 'code') int? code,
    @JsonKey(name: 'msg') String? msg,
    @JsonKey(name: 'data') PagingMeta<T>? data,
  }) = _PagingDataResponse;

  /// 这里的泛型T, fromJsonT方法需要传递到PagingMeta中
  factory PagingDataResponse.fromJson(
      Map<String, dynamic> json, T Function(Object?) fromJsonT) {
    return PagingDataResponse(
      code: json['code'] as int?,
      msg: json['msg'] as String?,
      data: json['data'] != null
          ? PagingMeta.fromJson(json['data'], fromJsonT)
          : null,
    );
  }
}

@Freezed(genericArgumentFactories: true)
class PagingMeta<T> with _$PagingMeta<T> {
  const factory PagingMeta({
    @JsonKey(name: 'records') List<T>? records,
    @JsonKey(name: 'current') int? current,
    @JsonKey(name: 'total') int? total,
    @JsonKey(name: 'size') int? size,
    @JsonKey(name: 'maxLimit') int? maxLimit,
    // 保留字段
    @JsonKey(name: 'next') int? next,
    @JsonKey(name: 'prev') int? prev,
  }) = _PagingMeta;

  factory PagingMeta.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$PagingMetaFromJson(json, fromJsonT);
}
