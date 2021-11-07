import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gallery/core/api_query/photos.dart';
import 'package:gallery/logic/cubits/photos_cubit.dart';

part 'photos_filter_state.dart';

class PhotosFilterCubit extends Cubit<PhotosFilterState> {
  PhotosFilterCubit(PhotosCubit photosCubit)
      : _photosCubit = photosCubit,
        super(PhotosFilterState());

  final PhotosCubit _photosCubit;

  void applyCategory({bool? isNew, bool? isPopular}) {
    emit(state.copyWith(
      newCategory: isNew,
      popularCategory: isPopular,
    ));
  }

  void search(String? keyword) {
    emit(state.copyWith(keyword: keyword));
  }

  void byUser(int? userId) {
    emit(PhotosFilterState(
      newCategory: state.newCategory,
      popularCategory: state.popularCategory,
      keyword: state.keyword,
      userId: userId,
    ));
  }

  void loadWithFilters({required int currentPage}) {
    _photosCubit.loadData(PhotosApiQuery(
      page: currentPage,
      popularImg: state.userId != null ? null : state.popularCategory,
      newImg: state.userId != null ? null : state.newCategory,
      name: state.userId != null ? null : state.keyword,
      userId: state.userId,
    ).toMap());
  }
}
