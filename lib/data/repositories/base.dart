import '../services/base.dart';

abstract class BaseRepository<S extends BaseService, T> {
  final S service;

  const BaseRepository(this.service);

  Future<T> fetchData([Map<String, dynamic>? apiQuery]);
}
