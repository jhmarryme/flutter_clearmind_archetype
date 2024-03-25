import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'simple_data_response.freezed.dart';
part 'simple_data_response.g.dart';

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
class SimlpeDataListResponse<T> with _$SimlpeDataListResponse<T> {
  const factory SimlpeDataListResponse({
    @JsonKey(name: 'code') int? code,
    @JsonKey(name: 'msg') String? msg,
    @JsonKey(name: 'data') List<T>? data,
  }) = _SimlpeDataListResponse;

  factory SimlpeDataListResponse.fromJson(Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$SimlpeDataListResponseFromJson(json, fromJsonT);
}
