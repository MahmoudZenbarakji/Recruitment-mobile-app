/*import 'package:flutter_bloc/flutter_bloc.dart';
import 'pagination_state.dart';

typedef DataFetcher<T> = Future<List<T>> Function(int page, int limit);

class PaginationCubit<T> extends Cubit<PaginationState<T>> {
  final DataFetcher<T> fetcher;
  final int limit;
  int _currentPage = 1;
  bool _hasMore = true;
  List<T> _items = [];

  PaginationCubit(this.fetcher, {this.limit = 20})
      : super(PaginationInitial<T>());

  void fetchInitial() async {
    emit(PaginationLoading<T>());
    _currentPage = 1;
    _items.clear();
    try {
      final newItems = await fetcher(_currentPage, limit);
      _hasMore = newItems.length == limit;
      _items = newItems;
      emit(PaginationLoaded<T>(_items, hasMore: _hasMore));
    } catch (e) {
      emit(PaginationError<T>(e.toString()));
    }
  }

  void fetchMore() async {
    if (!_hasMore || state is PaginationLoading<T>) return;
    emit(PaginationLoading<T>());
    try {
      _currentPage++;
      final newItems = await fetcher(_currentPage, limit);
      _hasMore = newItems.length == limit;
      _items.addAll(newItems);
      emit(PaginationLoaded<T>(_items, hasMore: _hasMore));
    } catch (e) {
      emit(PaginationError<T>(e.toString()));
    }
  }
}
*/