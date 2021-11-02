part of repository;

class MediaObjectRepository
    extends BaseRepository<MediaObjectService, MediaObject> {
  const MediaObjectRepository(MediaObjectService service) : super(service);

  @override
  Future<MediaObject> fetchData([Map<String, dynamic>? apiQuery]) async {
    final response = await service.postMediaObject(apiQuery);
    return MediaObject.fromMap(response.data);
  }
}
