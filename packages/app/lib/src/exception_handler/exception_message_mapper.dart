import 'package:flutter_clearmind_archetype_resource/resources.dart';
import 'package:flutter_clearmind_archetype_shared/shared.dart';

class ExceptionMessageMapper {
  const ExceptionMessageMapper();

  String map(AppException appException) {
    return switch (appException.appExceptionType) {
      AppExceptionType.remote => switch ((appException as RemoteException).kind) {
          RemoteExceptionKind.badCertificate => ClearmindArchtypeS.current.unknownException('UE-01'),
          RemoteExceptionKind.noInternet => ClearmindArchtypeS.current.noInternetException,
          RemoteExceptionKind.network => ClearmindArchtypeS.current.canNotConnectToHost,
          RemoteExceptionKind.serverDefined =>
            appException.generalServerMessage ?? ClearmindArchtypeS.current.unknownException('UE-02'),
          RemoteExceptionKind.serverUndefined =>
            appException.generalServerMessage ?? ClearmindArchtypeS.current.unknownException('UE-03'),
          RemoteExceptionKind.timeout => ClearmindArchtypeS.current.timeoutException,
          RemoteExceptionKind.cancellation => ClearmindArchtypeS.current.unknownException('UE-04'),
          RemoteExceptionKind.unknown => ClearmindArchtypeS.current.unknownException('UE-05'),
          RemoteExceptionKind.refreshTokenFailed => ClearmindArchtypeS.current.tokenExpired,
          RemoteExceptionKind.decodeError => ClearmindArchtypeS.current.unknownException('UE-06'),
        },
      AppExceptionType.parse => ClearmindArchtypeS.current.unknownException('UE-10'),
      AppExceptionType.uncaught => ClearmindArchtypeS.current.unknownException('UE-00'),
      AppExceptionType.validation => switch ((appException as ValidationException).kind) {
          // 支持自定义异常信息
          ValidationExceptionKind.custom => appException.msg ?? ClearmindArchtypeS.current.unknownException('UE-11'),
          ValidationExceptionKind.emptyEmail => ClearmindArchtypeS.current.emptyEmail,
          ValidationExceptionKind.invalidEmail => ClearmindArchtypeS.current.invalidEmail,
          ValidationExceptionKind.invalidPassword => ClearmindArchtypeS.current.invalidPassword,
          ValidationExceptionKind.invalidUserName => ClearmindArchtypeS.current.invalidUserName,
          ValidationExceptionKind.invalidPhoneNumber => ClearmindArchtypeS.current.invalidPhoneNumber,
          ValidationExceptionKind.invalidDateTime => ClearmindArchtypeS.current.invalidDateTime,
          ValidationExceptionKind.passwordsAreNotMatch => ClearmindArchtypeS.current.passwordsAreNotMatch,
        },
      AppExceptionType.remoteConfig => ClearmindArchtypeS.current.unknownException('UE-100'),
      AppExceptionType.inner => (appException as AppInnerException).msg ?? ClearmindArchtypeS.current.unknownException('UE-12')
    };
  }
}
