import "package:json_annotation/json_annotation.dart";
part 'book.g.dart';

@JsonSerializable(includeIfNull: true, fieldRename: FieldRename.snake)
class Book {

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

  Book(
      {required this.id,
        required this.bookAuthor,
        required this.bookTitle,
        required this.publicationYear,
        required this.publicationCountry,
        required this.publicationCity,
        required this.bookPage,
      });

  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);

  Map<String, dynamic> toJson() => _$BookToJson(this);

}



