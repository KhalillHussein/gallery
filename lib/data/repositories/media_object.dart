import 'package:gallery/data/models/media_object.dart';
import 'package:gallery/data/repositories/base.dart';
import 'package:gallery/data/services/media_object.dart';

class MediaObjectRepository
    extends BaseRepository<MediaObjectService, MediaObject> {
  const MediaObjectRepository(MediaObjectService service) : super(service);

  @override
  Future<MediaObject> fetchData([Map<String, dynamic>? apiQuery]) async {
    final response = await service.getMediaObject(apiQuery);
    return MediaObject.fromMap(response.data);
  }
}
