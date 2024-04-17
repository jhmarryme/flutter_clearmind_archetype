import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'simple_data_response.freezed.dart';
part 'simple_data_response.g.dart';

/// 支持的数据结构如下
/// data 可以为自定义类型
/*
{
	"code": 200,
	"msg": "",
	"data": null
}
 */
@Freezed(genericArgumentFactories: true)
class SimpleDataResponse<T> with _$SimpleDataResponse<T> {
  const factory SimpleDataResponse({
    @JsonKey(name: 'code') int? code,
    @JsonKey(name: 'msg') String? msg,
    @JsonKey(name: 'data') T? data,
  }) = _SimpleDataResponse;

  factory SimpleDataResponse.fromJson(Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$SimpleDataResponseFromJson(json, fromJsonT);
}

@Freezed(genericArgumentFactories: true)
class SimpleDataListResponse<T> with _$SimpleDataListResponse<T> {
  const factory SimpleDataListResponse({
    @JsonKey(name: 'code') int? code,
    @JsonKey(name: 'msg') String? msg,
    @JsonKey(name: 'data') List<T>? data,
  }) = _SimpleDataListResponse;

  factory SimpleDataListResponse.fromJson(Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$SimpleDataListResponseFromJson(json, fromJsonT);
}
