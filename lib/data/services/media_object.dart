import 'package:dio/dio.dart';
import 'package:gallery/core/network/auth_interceptor.dart';
import '../../core/constants/url.dart';
import 'base.dart';

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
