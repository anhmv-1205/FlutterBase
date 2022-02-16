import 'package:flutter_base_project/data/source/local/preference/model/base/base_preference_data.dart';
import 'package:flutter_base_project/domain/entities/entity.dart';

abstract class BasePreferenceMapper<P extends BasePreferenceData, E extends Entity> {
  E mapToEntity(P data);

  List<E> mapToEntityList(List<P>? data) {
    return data?.map(mapToEntity).toList() ?? [];
  }
}

mixin BasePreferenceMapperMixin<P extends BasePreferenceData, E extends Entity> on BasePreferenceMapper<P, E> {
  P mapToPreferenceData(E data);

  List<P> mapToPreferenceDataList(List<E>? data) {
    return data?.map(mapToPreferenceData).toList() ?? [];
  }
}
