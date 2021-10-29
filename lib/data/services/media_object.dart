import 'package:dio/dio.dart';
import '../../core/constants/url.dart';
import 'base.dart';

class MediaObjectService extends BaseService<Dio> {
  MediaObjectService(Dio client) : super(client);

  Future<Response> getMediaObject(Map<String, dynamic>? apiQuery) async {
    return client.get(
      '${Url.mediaObject}/${apiQuery!['id']}',
    );
  }
}
