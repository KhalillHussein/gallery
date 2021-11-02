class PhotosApiQuery {
  final bool? newImg;
  final bool? popularImg;
  final int page;
  final int limit;
  final String? name;
  final int? userId;
  final String? description;
  final String? image;

  PhotosApiQuery({
    this.newImg = true,
    this.popularImg = true,
    this.page = 1,
    this.limit = 10,
    this.userId,
    this.name,
    this.description,
    this.image,
  });

  Map<String, dynamic> toMap() {
    return {
      'new': newImg,
      'popular': popularImg,
      'page': page,
      'limit': limit,
      'user.id': userId,
      'name': name,
      'image': image,
    }..removeWhere((key, value) => value == null);
  }
}
