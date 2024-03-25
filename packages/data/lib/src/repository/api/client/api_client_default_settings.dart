import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../../../data.dart';

class ApiClientDefaultSetting {
  const ApiClientDefaultSetting._();

  static const defaultErrorResponseMapperType = ErrorResponseMapperType.simpleJsonObject;
  static const defaultSuccessResponseMapperType = SuccessResponseMapperType.simpleJsonObject;

  // required interceptors
  static List<Interceptor> requiredInterceptors(Dio dio) => [
        if (kDebugMode) CustomLogInterceptor(),
        ConnectivityInterceptor(),
        RetryOnErrorInterceptor(dio),
      ];
}
