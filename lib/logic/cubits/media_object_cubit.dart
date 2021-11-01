import 'dart:async';

import 'package:dio/dio.dart';
import 'package:gallery/data/models/media_object.dart';
import 'package:gallery/data/repositories/media_object.dart';
import 'package:gallery/logic/cubits/request_cubit/request_cubit.dart';
import '../../core/exceptions/api_exceptions.dart';

class MediaObjectCubit
    extends RequestCubit<MediaObjectRepository, List<MediaObject>> {
  MediaObjectCubit(MediaObjectRepository repository) : super(repository);
  final List<MediaObject> mediaObjects = [];

  @override
  Future<void> loadData([Map<String, dynamic>? apiQuery]) async {
    emit(RequestState.loading(state.value));
    try {
      final data = await repository.fetchData(apiQuery);
      emit(RequestState.loaded(mediaObjects..add(data)));
    } on DioError catch (e) {
      emit(RequestState.error(ApiException.fromDioError(e).message));
    } catch (e) {
      emit(RequestState.error(e.toString()));
    }
  }
}
