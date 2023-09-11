import "package:json_annotation/json_annotation.dart";
import 'package:prune/data/sources/remote/requests/base.dart';
part 'books.g.dart';

@JsonSerializable(includeIfNull: true, fieldRename: FieldRename.snake)
class BooksRequest extends BaseRequest{


  @JsonKey(name: 'page')
  final int page;
  @JsonKey(name: 'itemPerPage')
  final int itemsPerPage;
  @JsonKey(name: 'filters')
  final List<String> filters;

  BooksRequest({required this.page, required this.itemsPerPage, required this.filters});

  @override
  Map<String, dynamic> toJson() => _$BooksRequestToJson(this);

}
