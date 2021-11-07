part of repository;

class PhotosRepository extends BaseRepository<PhotosService, List<Photo>> {
  PhotosRepository(PhotosService service) : super(service);

  int? _totalItems;

  int? get totalItems => _totalItems;

  @override
  Future<List<Photo>> fetchData([Map<String, dynamic>? apiQuery]) async {
    final response = await service.getPhotos(apiQuery);
    _totalItems = response.data[Strings.totalItems];
    return [
      for (final item in response.data[Strings.data]) Photo.fromMap(item)
    ];
  }
}
