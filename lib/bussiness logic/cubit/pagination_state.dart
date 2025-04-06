/*abstract class PaginationState<T> {}

class PaginationInitial<T> extends PaginationState<T> {}

class PaginationLoading<T> extends PaginationState<T> {}

class PaginationLoaded<T> extends PaginationState<T> {
  final List<T> items;
  final bool hasMore;

  PaginationLoaded(this.items, {this.hasMore = true});
}

class PaginationError<T> extends PaginationState<T> {
  final String message;

  PaginationError(this.message);
}
*/