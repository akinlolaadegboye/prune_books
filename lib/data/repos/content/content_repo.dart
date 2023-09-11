import 'package:prune/data/sources/shared/models/books.dart';

abstract class ContentRepo {
  Future<List<Books>> getBooks({required int page, required int itemsPerPage, required List<String> filters});
}
