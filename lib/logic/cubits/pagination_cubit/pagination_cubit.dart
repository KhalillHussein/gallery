import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gallery/logic/cubits/request_cubit/request_cubit.dart';

part 'pagination_state.dart';

abstract class PaginationCubit<C extends RequestCubit, T>
    extends Cubit<PaginationState<T>> {
  final C cubit;
  final int pageSize;

  late final StreamSubscription<RequestState> cubitSubscription;

  PaginationCubit(this.cubit, this.pageSize) : super(PaginationState());

  void refresh();

  void retryLastFailedRequest();

  @override
  Future<void> close() {
    cubitSubscription.cancel();
    return super.close();
  }
}
