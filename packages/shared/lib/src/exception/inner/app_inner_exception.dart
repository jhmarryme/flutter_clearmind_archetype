import '../../../shared.dart';

class AppInnerException extends AppException {
  const AppInnerException(this.msg) : super(AppExceptionType.inner);

  // 这里存放需要提示的异常信息
  final String? msg;

  @override
  String toString() {
    return 'rootError: ${msg?.toString()}';
  }
}
