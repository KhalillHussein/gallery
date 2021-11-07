import 'dart:async';

import 'package:gallery/data/models/photo.dart';
import 'package:gallery/logic/cubits/pagination_cubit/pagination_cubit.dart';
import 'package:gallery/logic/cubits/photos_cubit.dart';
import 'package:gallery/logic/cubits/photos_filter_cubit/photos_filter_cubit.dart';
import 'package:gallery/logic/cubits/request_cubit/request_cubit.dart';

class PhotosPaginationCubit extends PaginationCubit<PhotosCubit, Photo> {
  PhotosPaginationCubit(
      PhotosCubit photosCubit, PhotosFilterCubit photosFilterCubit)
      : _photosFilterCubit = photosFilterCubit,
        super(photosCubit, 10) {
    cubitSubscription = photosCubit.stream.listen(updatePaginationList);
    _streamSubscription = _photosFilterCubit.stream.listen((event) {
      refresh();
    });
  }

  void updatePaginationList(RequestState<List<Photo>> event) {
    if (event.status.isSuccess) {
      if (event.value!.length < pageSize) {
        emit(
          PaginationState(
            itemList: {...state.itemList ?? [], ...event.value!}.toList(),
            nextPageKey: null,
          ),
        );
      } else {
        emit(
          PaginationState(
            nextPageKey: 1 + (state.nextPageKey ?? 1),
            itemList: {...state.itemList ?? [], ...event.value!}.toList(),
          ),
        );
      }
    } else if (event.status.isFailure) {
      emit(
        state.copyWith(
          error: event.errorMessage,
        ),
      );
    }
  }

  final PhotosFilterCubit _photosFilterCubit;
  late final StreamSubscription<PhotosFilterState> _streamSubscription;

  @override
  void refresh() {
    emit(PaginationState<Photo>(
      nextPageKey: state.firstPageKey,
    ));
  }

  @override
  void retryLastFailedRequest() {
    emit(PaginationState<Photo>(
      nextPageKey: state.nextPageKey,
      itemList: state.itemList,
    ));
  }

  @override
  Future<void> close() {
    _streamSubscription.cancel();
    return super.close();
  }

  void setNextPageKey(int pageKey) {
    emit(state.copyWith(nextPageKey: pageKey));
  }
}
