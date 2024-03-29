import 'package:injectable/injectable.dart';

import 'package:flutter_clearmind_archetype_shared/shared.dart';
import '../../../../../../data.dart';

@Injectable()
class LineErrorResponseMapper extends BaseErrorResponseMapper<Map<String, dynamic>> {
  @override
  ServerError mapToServerError(Map<String, dynamic>? json) {
    return ServerError(generalMessage: json?['error_description'] as String?);
  }
}
