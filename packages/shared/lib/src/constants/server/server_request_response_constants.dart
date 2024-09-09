class ServerRequestResponseConstants {
  const ServerRequestResponseConstants._();

  static const basicAuthorization = 'Authorization';
  static const jwtAuthorization = 'JWT-Authorization';
  static const userAgentKey = 'User-Agent';
  static const bearer = 'Bearer';

  /// language code
  static const en = 'EN';
  static const ja = 'JA';
  static const zhCn = 'ZH_CN';
  static const zhTw = 'ZH_TW';

  /// gender
  static const male = 0;
  static const female = 1;
  static const other = 2;
  static const unknown = -1;

  /// theme code
  static const system = 0;
  static const dark = 1;
  static const light = 2;
}
