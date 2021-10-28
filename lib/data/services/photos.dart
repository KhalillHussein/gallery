import 'package:dio/dio.dart';
import '../../core/constants/url.dart';
import 'base.dart';

class PhotosService extends BaseService<Dio> {
  PhotosService(Dio client) : super(client);

  Future<Response> getPhotos(Map<String, dynamic>? apiQuery) async {
    return client.get(
      Url.photos,
      queryParameters: apiQuery,
    );
  }
}
