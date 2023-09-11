import "package:json_annotation/json_annotation.dart";
part 'books.g.dart';

@JsonSerializable(includeIfNull: true, fieldRename: FieldRename.snake)
class Books {

  int id;
  @JsonKey(name: 'book_author')
  List<String> bookAuthor;
  @JsonKey(name: 'book_title')
  String bookTitle;
  @JsonKey(name: 'book_publication_year')
  int publicationYear;
  @JsonKey(name: 'book_publication_country')
  String publicationCountry;
  @JsonKey(name: 'book_publication_city')
  String publicationCity;
  @JsonKey(name: 'book_pages')
  int bookPage;

  Books(
      {required this.id,
        required this.bookAuthor,
        required this.bookTitle,
        required this.publicationYear,
        required this.publicationCountry,
        required this.publicationCity,
        required this.bookPage,
      });

  factory Books.fromJson(Map<String, dynamic> json) => _$BooksFromJson(json);

  Map<String, dynamic> toJson() => _$BooksToJson(this);

}



