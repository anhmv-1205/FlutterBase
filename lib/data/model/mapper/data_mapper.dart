import 'package:flutter_base_project/data/model/data_model.dart';
import 'package:flutter_base_project/domain/entities/entity.dart';

abstract class DataMapper<D extends DataModel, E extends Entity> {
  D mapToData(E entity);

  E mapToDomain(D data);
}
