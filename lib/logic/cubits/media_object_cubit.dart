import 'dart:async';

import 'package:dio/dio.dart';
import 'package:gallery/core/api_query/media_object.dart';
import 'package:gallery/data/models/media_object.dart';
import 'package:gallery/data/repositories/media_object.dart';
import 'package:gallery/logic/cubits/photos_cubit.dart';
import 'package:gallery/logic/cubits/request_cubit/request_cubit.dart';
import '../../core/exceptions/api_exceptions.dart';

class MediaObjectCubit
    extends RequestCubit<MediaObjectRepository, MediaObject> {
  MediaObjectCubit(MediaObjectRepository repository) : super(repository) {
    getMediaStream();
  }

  StreamSubscription? photosCubitSubscription;
  late final PhotosCubit photosCubit;

  void getMediaStream() {
    photosCubitSubscription = photosCubit.stream.listen((state) {
      if (state.status.isSuccess) {
        for (final photo in state.value!) {
          loadData(
            MediaObjectApiQuery(id: photo.id!).toMap(),
          );
        }
      }
    });
  }

  @override
  Future<void> loadData([Map<String, dynamic>? apiQuery]) async {
    emit(RequestState.loading(state.value));
    try {
      final data = await repository.fetchData(apiQuery);

      emit(RequestState.loaded(data));
    } on DioError catch (e) {
      emit(RequestState.error(ApiException.fromDioError(e).message));
    } catch (e) {
      emit(RequestState.error(e.toString()));
    }
  }

  @override
  Future<void> close() {
    photosCubitSubscription?.cancel();
    return super.close();
  }
}
