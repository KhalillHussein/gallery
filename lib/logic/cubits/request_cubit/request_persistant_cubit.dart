import 'package:gallery/data/repositories/repositories_import.dart';
import 'package:gallery/logic/cubits/request_cubit/request_cubit.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

abstract class RequestPersistantCubit<R extends BaseRepository, T>
    extends RequestCubit<R, T> with HydratedMixin {
  RequestPersistantCubit(R repository) : super(repository) {
    hydrate();
  }

  @override
  RequestState<T> fromJson(Map<String, dynamic> json) {
    return RequestState<T>.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(RequestState<T> state) {
    return state.toJson();
  }
}
