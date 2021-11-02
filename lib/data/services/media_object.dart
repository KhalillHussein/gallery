part of service;

//Service that creates media object
class MediaObjectService extends BaseService<Dio> {
  MediaObjectService(Dio client) : super(client);

  Future<Response> postMediaObject(Map<String, dynamic>? apiQuery) async {
    client.interceptors.clear();
    client.interceptors.add(AuthInterceptor(client));
    return client.post(
      Url.mediaObject,
      data: FormData.fromMap(apiQuery!),
    );
  }
}
