// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'books.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BooksRequest _$BooksRequestFromJson(Map<String, dynamic> json) => BooksRequest(
      page: json['page'] as int,
      itemsPerPage: json['itemPerPage'] as int,
      filters:
          (json['filters'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$BooksRequestToJson(BooksRequest instance) =>
    <String, dynamic>{
      'page': instance.page,
      'itemPerPage': instance.itemsPerPage,
      'filters': instance.filters,
    };
