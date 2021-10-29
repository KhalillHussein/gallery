import 'package:dio/dio.dart';
import 'package:gallery/data/repositories/photos.dart';
import 'package:gallery/logic/cubits/request_cubit/request_cubit.dart';
import '../../core/exceptions/api_exceptions.dart';
import '../../data/models/photo.dart';

class PhotosCubit extends RequestCubit<PhotosRepository, List<Photo>> {
  PhotosCubit(PhotosRepository repository) : super(repository);

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
}
