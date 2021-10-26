import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../logic/cubit/request_cubit.dart';

typedef RequestWidgetBuilderInit<T> = Widget Function(
  BuildContext context,
  RequestState<T> state,
);

typedef RequestWidgetBuilderLoaded<T> = Widget Function(
  BuildContext context,
  RequestState<T> state,
  T? value,
);

typedef RequestWidgetBuilderError<T> = Widget Function(
  BuildContext context,
  RequestState<T> state,
  String? errorMessage,
);

class RequestBuilder<C extends RequestCubit, T> extends StatelessWidget {
  final RequestWidgetBuilderInit<T>? onInit;

  final RequestWidgetBuilderLoaded<T>? onLoading;

  final RequestWidgetBuilderLoaded<T>? onLoaded;

  final RequestWidgetBuilderError<T>? onError;

  const RequestBuilder({
    Key? key,
    this.onInit,
    this.onLoading,
    this.onLoaded,
    this.onError,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<C, RequestState>(
      listener: (context, state) {
        return;
      },
      builder: (context, state) {
        switch (state.status) {
          case RequestStatus.initial:
            if (onInit != null) {
              return onInit!(context, state as RequestState<T>);
            }
            break;

          case RequestStatus.loading:
            if (onLoading != null) {
              return onLoading!(context, state as RequestState<T>, state.value);
            }
            break;

          case RequestStatus.success:
            if (onLoaded != null) {
              return onLoaded!(context, state as RequestState<T>, state.value);
            }
            break;

          case RequestStatus.failure:
            if (onError != null) {
              return onError!(
                context,
                state as RequestState<T>,
                state.errorMessage,
              );
            }
            break;
        }

        return const SizedBox();
      },
    );
  }
}
