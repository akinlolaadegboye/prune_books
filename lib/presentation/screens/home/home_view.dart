import 'package:prune/data/sources/shared/models/books.dart';
import 'package:prune/presentation/screens/base_view_state.dart';
import 'package:flutter/widgets.dart';

abstract class HomeScreenIntent {}

class LoadData extends HomeScreenIntent {}

class LiveLessonReloaded extends HomeScreenIntent {}

@immutable
class HomeViewState extends BaseViewState {
  final int? pageNo;
  final List<Books>? books;

  HomeViewState(
      {this.pageNo,
      this.books,
      Exception? error,
      bool showLoading = false})
      : super(showLoading: showLoading, error: error);

  @override
  bool get showMainView => books != null;


  HomeViewState copy(
      {int? pageNo,
      List<Books>? books,
      Exception? error,
      bool? showLoading,
      }) {
    return HomeViewState(
        pageNo: pageNo ?? this.pageNo,
        books: books ?? this.books,
        showLoading: showLoading ?? this.showLoading,
        error: error);
  }
}
