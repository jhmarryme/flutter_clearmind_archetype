import 'package:flutter_clearmind_archetype_shared/shared.dart';

import '../../../../../data.dart';

class SimpleDataJsonObjectResponseMapper<T extends Object>
    extends BaseSuccessResponseMapper<T, SimpleDataResponse<T>> {
  @override
  // ignore: avoid-dynamic
  SimpleDataResponse<T>? mapToDataModel({
    required dynamic response,
    Decoder<T>? decoder,
  }) {
    return decoder != null && response is Map<String, dynamic>
        ? SimpleDataResponse.fromJson(response, (json) => decoder(json))
        : null;
  }
}
