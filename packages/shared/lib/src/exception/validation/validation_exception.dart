import '../base/app_exception.dart';

class ValidationException extends AppException {
  const ValidationException(this.kind, {this.msg})
      : super(AppExceptionType.validation);

  final ValidationExceptionKind kind;

  final String? msg;

  @override
  String toString() {
    return 'ValidationException: {kind: $kind}';
  }
}

enum ValidationExceptionKind {
  custom,
  invalidEmail,
  emptyEmail,
  invalidPassword,
  invalidUserName,
  invalidPhoneNumber,
  invalidDateTime,
  passwordsAreNotMatch,
}
