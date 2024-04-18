import 'package:dio/dio.dart';

import 'package:flutter_clearmind_archetype_shared/shared.dart';
import '../../../../../data.dart';

enum RestMethod { get, post, put, patch, delete }

class RestApiClient {
  RestApiClient({
    required this.dio,
    this.errorResponseMapperType = ApiClientDefaultSetting.defaultErrorResponseMapperType,
    this.successResponseMapperType = ApiClientDefaultSetting.defaultSuccessResponseMapperType,
  });

  final SuccessResponseMapperType successResponseMapperType;
  final ErrorResponseMapperType errorResponseMapperType;
  final Dio dio;

  Future<T?> request<D extends Object, T extends Object>({
    required RestMethod method,
    required String path,
    Map<String, dynamic>? queryParameters,
    Object? body,
    Decoder<D>? decoder,
    SuccessResponseMapperType? successResponseMapperType,
    ErrorResponseMapperType? errorResponseMapperType,
    SuccessResponseMapperTypeExtension? successResponseMapperTypeExtension,
    ErrorResponseMapperTypeExtension? errorResponseMapperTypeExtension,
    Options? options,
  }) async {
    assert(
        method != RestMethod.get ||
            (successResponseMapperType ?? this.successResponseMapperType) ==
                SuccessResponseMapperType.plain ||
            decoder != null,
        'decoder must not be null if method is GET');
    try {
      final response = await _requestByMethod(
        method: method,
        path: path.startsWith(dio.options.baseUrl)
            ? path.substring(dio.options.baseUrl.length)
            : path,
        queryParameters: queryParameters,
        body: body,
        options: Options(
          headers: options?.headers,
          contentType: options?.contentType,
          responseType: options?.responseType,
          sendTimeout: options?.sendTimeout,
          receiveTimeout: options?.receiveTimeout,
        ),
      );

      if (response.data == null) {
        return null;
      }
      // 优先支持拓展的类型
      if (successResponseMapperTypeExtension != null) {
        return handleResponseI<D, T>(
          response,
          decoder,
          successResponseMapperTypeExtension,
        );
      } else {
        return handleResponse<D, T>(
          response,
          decoder,
          successResponseMapperType ?? this.successResponseMapperType,
        );
      }

    } catch (error) {
      // 优先支持拓展的类型
      if (errorResponseMapperTypeExtension != null) {
        handleErrorI(
          errorResponseMapperTypeExtension,
          error,
        );
      } else {
        handleError(
          errorResponseMapperType ?? this.errorResponseMapperType,
          error,
        );
      }
      return null;
    }
  }

  /// 预定义异常解析逻辑,
  void handleError (
      ErrorResponseMapperType errorResponseMapperType, Object error) {
    throw DioExceptionMapper(
      BaseErrorResponseMapper.fromType(errorResponseMapperType),
    ).map(error);
  }

  /// 预定义解析逻辑
  Future<T?> handleResponse<D extends Object, T extends Object>(
    Response<dynamic> response,
    Decoder<D>? decoder,
    SuccessResponseMapperType successResponseMapperType,
  ) async {
    return BaseSuccessResponseMapper<D, T>.fromType(successResponseMapperType)
        .map(response: response.data, decoder: decoder);
  }

  /// 可以自定义自己的异常解析逻辑, 预留一个拓展入口
  void handleErrorI (
      ErrorResponseMapperTypeExtension errorResponseMapperType, Object error) {
    throw UnimplementedError("please implement your handleErrorI method");
  }

  /// 可以自定义自己的解析逻辑, 预留一个拓展入口
  Future<T?> handleResponseI<D extends Object, T extends Object>(
    Response<dynamic> response,
    Decoder<D>? decoder,
      SuccessResponseMapperTypeExtension successResponseMapperType,
  ) async {
    throw UnimplementedError("please implement your handleResponseI method");
  }

  Future<Response<dynamic>> _requestByMethod({
    required RestMethod method,
    required String path,
    Map<String, dynamic>? queryParameters,
    Object? body,
    Options? options,
  }) {
    switch (method) {
      case RestMethod.get:
        return dio.get(
          path,
          data: body,
          queryParameters: queryParameters,
          options: options,
        );
      case RestMethod.post:
        return dio.post(
          path,
          data: body,
          queryParameters: queryParameters,
          options: options,
        );
      case RestMethod.patch:
        return dio.patch(
          path,
          data: body,
          queryParameters: queryParameters,
          options: options,
        );
      case RestMethod.put:
        return dio.put(
          path,
          data: body,
          queryParameters: queryParameters,
          options: options,
        );
      case RestMethod.delete:
        return dio.delete(
          path,
          data: body,
          queryParameters: queryParameters,
          options: options,
        );
    }
  }
}
