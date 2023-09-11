import 'package:prune/data/sources/shared/models/book.dart';

abstract class ContentRepo {
  Future<List<Book>> getBooks({required int page, required int itemsPerPage, required List<String> filters});
}
