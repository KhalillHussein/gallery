part of 'request_cubit.dart';

enum RequestStatus { initial, loading, success, failure }

class RequestState<T> extends Equatable {
  final RequestStatus status;

  final T? value;

  final String? errorMessage;

  final int? nextPage;

  const RequestState._({
    required this.status,
    this.value,
    this.errorMessage,
    this.nextPage = 1,
  });

  factory RequestState.fromJson(Map<String, dynamic> json) {
    return RequestState._(
      status: RequestStatus.values[json['status']],
      value: json['value'],
      errorMessage: json['errorMessage'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status.index,
      'value': value,
      'errorMessage': errorMessage,
    };
  }

  const RequestState.init()
      : this._(
          status: RequestStatus.initial,
        );

  const RequestState.loading([T? previousValue])
      : this._(
          value: previousValue,
          status: RequestStatus.loading,
        );
  const RequestState.loaded(T data, [int? page])
      : this._(status: RequestStatus.success, value: data, nextPage: page);

  const RequestState.error(String error)
      : this._(
          status: RequestStatus.failure,
          errorMessage: error,
        );

  @override
  List<Object?> get props => [
        status.index,
        value.toString(),
        errorMessage,
      ];

  @override
  String toString() => '($status: $value, $errorMessage)';
}

extension RequestStatusX on RequestStatus {
  bool get isInitial => this == RequestStatus.initial;
  bool get isLoading => this == RequestStatus.loading;
  bool get isSuccess => this == RequestStatus.success;
  bool get isFailure => this == RequestStatus.failure;
}
