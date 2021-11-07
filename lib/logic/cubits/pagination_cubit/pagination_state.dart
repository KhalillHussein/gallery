part of 'pagination_cubit.dart';

class PaginationState<T> extends Equatable {
  const PaginationState({
    this.itemList,
    this.error,
    this.firstPageKey = 1,
    this.nextPageKey = 1,
  });

  final List<T>? itemList;
  final String? error;
  final int? firstPageKey;
  final int? nextPageKey;

  PaginationState<T> copyWith({
    List<T>? itemList,
    String? error,
    int? firstPageKey,
    int? nextPageKey,
  }) {
    return PaginationState<T>(
      itemList: itemList ?? this.itemList,
      error: error ?? this.error,
      firstPageKey: firstPageKey ?? this.firstPageKey,
      nextPageKey: nextPageKey ?? this.nextPageKey,
    );
  }

  @override
  String toString() => '(next page:$nextPageKey, $itemList, $error)';

  @override
  List<Object?> get props => [
        itemList,
        error,
        firstPageKey,
        nextPageKey,
      ];
}
