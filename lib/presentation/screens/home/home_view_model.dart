import 'package:prune/data/sources/shared/models/book.dart';
import 'package:prune/presentation/screens/home/home_view.dart';
import 'package:flutter/widgets.dart';
import 'package:prune/data/repos/content/content_repo.dart';
import 'package:prune/utils/change_notifier.dart';
import 'package:prune/values/strings.dart';

class HomeViewModel extends ChangeNotifier {
  final ContentRepo _contentRepo;

  HomeViewModel(this._contentRepo);

  HomeViewState _state = HomeViewState();

  HomeViewState get state => _state;

  set state(HomeViewState value) {
    _state = value;
    notifyListenersSafely();
  }

  void onNext(HomeScreenIntent intent) async {
    if (intent is LoadData) {
      await _loadData();
    }
  }

  Future<void> _loadData() async {
    try {
      state = state.copy(pageNo: 1, showLoading: true);
      final List<Book> books = await _contentRepo.getBooks(page: state.pageNo!, itemsPerPage: 20, filters: []);
      state = state.copy(
          books: books,
          showLoading: false);
    } on Exception catch (error) {
      if('$error' == Strings.internetConnectionCheckString){
        state = state.copy(error: Exception(Strings.connectionLostMiniText), showLoading: false);
      }else {
        state = state.copy(error: error, showLoading: false);
      }
    }
  }

  //This is for pagination
  Future<void> _loadMoreBooks() async {
    try {
      state = state.copy(showLoading: true);
      final List<Book> books = await _contentRepo.getBooks(page: state.pageNo!, itemsPerPage: 20, filters: []);
      state = state.copy(
          books: books,
          showLoading: false
      );
    } on Exception catch (error) {
      state = state.copy(error: error, showLoading: false);
    }
  }

}
