import 'package:flutter_clearmind_archetype_shared/shared.dart';
import 'package:injectable/injectable.dart';

import '../../../../../data.dart';

@Injectable()
class SimpleJsonObjectErrorResponseMapper
    extends BaseErrorResponseMapper<Map<String, dynamic>> {
  @override
  ServerError mapToServerError(Map<String, dynamic>? data) {
    return ServerError(
      generalServerStatusCode: data?['code'] as int?,
      generalMessage: data?['msg'] as String?,
    );
  }
}
