part of 'photos_filter_cubit.dart';

class PhotosFilterState extends Equatable {
  const PhotosFilterState({
    this.newCategory = true,
    this.popularCategory = false,
    this.keyword,
    this.userId,
  });

  final bool? newCategory;
  final bool? popularCategory;
  final String? keyword;
  final int? userId;

  PhotosFilterState copyWith({
    String? keyword,
    bool? newCategory,
    bool? popularCategory,
    int? userId,
  }) {
    return PhotosFilterState(
      keyword: keyword ?? this.keyword,
      newCategory: newCategory ?? this.newCategory,
      popularCategory: popularCategory ?? this.popularCategory,
      userId: userId ?? this.userId,
    );
  }

  @override
  List<Object?> get props => [
        keyword,
        newCategory,
        popularCategory,
        userId,
      ];
}
