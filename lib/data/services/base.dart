part of service;

abstract class BaseService<S> {
  final S client;

  const BaseService(this.client);
}
