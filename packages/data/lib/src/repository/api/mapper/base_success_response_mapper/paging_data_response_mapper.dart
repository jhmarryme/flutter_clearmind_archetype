import 'package:flutter_clearmind_archetype_data/src/repository/api/model/paging_data_response.dart';
import 'package:flutter_clearmind_archetype_shared/shared.dart';

import '../../../../../../data.dart';

class SimpleRecordsJsonArrayResponseMapper<T extends Object>
    extends BaseSuccessResponseMapper<T, PagingDataResponse<T>> {
  @override
  // ignore: avoid-dynamic
  PagingDataResponse<T>? mapToDataModel({
    required dynamic response,
    Decoder<T>? decoder,
  }) {
    return decoder != null && response is Map<String, dynamic>
        ? PagingDataResponse.fromJson(response, (json) => decoder(json))
        : null;
  }
}
