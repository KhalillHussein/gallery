import 'package:gallery/core/constants/strings.dart';
import 'package:gallery/data/models/photo.dart';
import 'package:gallery/data/repositories/base.dart';
import 'package:gallery/data/services/photos.dart';

class PhotosRepository extends BaseRepository<PhotosService, List<Photo>> {
  const PhotosRepository(PhotosService service) : super(service);

  @override
  Future<List<Photo>> fetchData([Map<String, dynamic>? apiQuery]) async {
    final response = await service.getPhotos(apiQuery);
    return [
      for (final item in response.data[Strings.dataObject]) Photo.fromMap(item)
    ];
  }
}
