part of repository;

class UploadPhotoRepository extends BaseRepository<UploadPhotoService, Photo> {
  const UploadPhotoRepository(UploadPhotoService service) : super(service);

  @override
  Future<Photo> fetchData([Map<String, dynamic>? apiQuery]) async {
    final response = await service.uploadPhoto(apiQuery);
    return Photo.fromMap(response.data);
  }
}
