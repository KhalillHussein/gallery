import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gallery/data/repositories/base.dart';

part 'request_state.dart';

abstract class RequestCubit<R extends BaseRepository, T>
    extends Cubit<RequestState<T>> {
  final R repository;

  final bool autoLoad;

  RequestCubit(this.repository, {this.autoLoad = false})
      : super(RequestState.init()) {
    if (autoLoad == true) loadData();
  }

  Future<void> loadData([Map<String, dynamic> apiQuery]);
}
