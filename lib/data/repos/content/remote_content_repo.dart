import 'package:prune/data/repos/content/content_repo.dart';
import 'package:prune/data/sources/remote/requests/books.dart';
import 'package:prune/data/sources/remote/service/api_service.dart';
import 'package:prune/data/sources/shared/models/books.dart';


class RemoteContentRepo extends ContentRepo {

  final ApiService _apiService;


  RemoteContentRepo(this._apiService);

  @override
  Future<List<Books>> getBooks({required int page, required int itemsPerPage, required List<String> filters}) async {
    BooksRequest request = BooksRequest(page: page, itemsPerPage: itemsPerPage, filters: filters);
    List<Books> books = await _apiService.getBooks(request);
    return books;
  }

}
