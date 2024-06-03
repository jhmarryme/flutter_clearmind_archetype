import 'package:flutter_clearmind_archetype_shared/shared.dart';

import '../../../../../data.dart';

class SimpleDataJsonArrayResponseMapper<T extends Object>
    extends BaseSuccessResponseMapper<T, SimpleDataListResponse<T>> {
  @override
  // ignore: avoid-dynamic
  SimpleDataListResponse<T>? mapToDataModel({
    required dynamic response,
    Decoder<T>? decoder,
  }) {
    return decoder != null && response is Map<String, dynamic>
        ? SimpleDataListResponse.fromJson(response, (json) => decoder(json))
        : null;
  }
}
