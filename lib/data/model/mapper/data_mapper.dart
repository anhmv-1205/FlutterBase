import 'package:flutter_base_project/data/model/base/data_model.dart';
import 'package:flutter_base_project/domain/entities/entity.dart';

abstract class DataMapper<D extends DataModel, E extends Entity> {
  E mapToEntity(D data);

  List<E> mapToListEntity(List<D>? list) {
    return list?.map(mapToEntity).toList() ?? List.empty();
  }
}
