// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'books.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Books _$BooksFromJson(Map<String, dynamic> json) => Books(
      id: json['id'] as int,
      bookAuthor: (json['book_author'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      bookTitle: json['book_title'] as String,
      publicationYear: json['book_publication_year'] as int,
      publicationCountry: json['book_publication_country'] as String,
      publicationCity: json['book_publication_city'] as String,
      bookPage: json['book_pages'] as int,
    );

Map<String, dynamic> _$BooksToJson(Books instance) => <String, dynamic>{
      'id': instance.id,
      'book_author': instance.bookAuthor,
      'book_title': instance.bookTitle,
      'book_publication_year': instance.publicationYear,
      'book_publication_country': instance.publicationCountry,
      'book_publication_city': instance.publicationCity,
      'book_pages': instance.bookPage,
    };
