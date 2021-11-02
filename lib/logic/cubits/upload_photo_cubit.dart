import 'dart:async';

import 'package:dio/dio.dart';
import 'package:gallery/core/api_query/media_object.dart';
import 'package:gallery/core/api_query/photos.dart';
import 'package:gallery/data/models/photo.dart';
import 'package:gallery/data/repositories/media_object.dart';
import 'package:gallery/data/repositories/upload_photo.dart';

import '../../core/exceptions/api_exceptions.dart';
import 'request_cubit/request_cubit.dart';

class UploadPhotoCubit extends RequestCubit<UploadPhotoRepository, Photo> {
  UploadPhotoCubit(
    UploadPhotoRepository repository,
    this.mediaObjectRepository,
  ) : super(repository);

  final MediaObjectRepository mediaObjectRepository;

  @override
  Future<void> loadData([Map<String, dynamic>? apiQuery]) async {
    emit(RequestState.loading(state.value));
    try {
      final mediaObjectData = await mediaObjectRepository
          .fetchData(MediaObjectApiQuery(file: apiQuery!['file']).toMap());
      final data = await repository.fetchData(PhotosApiQuery(
              name: apiQuery['name'],
              description: apiQuery['description'],
              popularImg: false,
              image: 'api/media_objects/${mediaObjectData.id}')
          .toMap());
      emit(RequestState.loaded(data));
    } on DioError catch (e) {
      emit(RequestState.error(ApiException.fromDioError(e).message));
    } catch (e) {
      emit(RequestState.error(e.toString()));
    }
  }
}
