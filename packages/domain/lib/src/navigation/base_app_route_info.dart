abstract class BaseAppRouteInfo {
  String get name;

  Map<String, dynamic> get extra;

  Map<String, String> get pathParameters;

  Map<String, dynamic> get queryParameters;
}