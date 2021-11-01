class PhotosApiQuery {
  final bool newImg;
  final bool popularImg;
  final int page;
  final int limit;
  final int? userId;

  PhotosApiQuery({
    this.newImg = true,
    this.popularImg = true,
    this.page = 1,
    this.limit = 10,
    this.userId,
  });

  Map<String, dynamic> toMap() {
    return {
      'new': newImg,
      'popular': popularImg,
      'page': page,
      'limit': limit,
      'user.id': userId,
    }..removeWhere((key, value) => value == null);
  }
}
