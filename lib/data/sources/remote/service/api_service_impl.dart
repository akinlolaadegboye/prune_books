import 'dart:convert';
import 'dart:developer';
import 'package:prune/data/sources/remote/requests/books.dart';
import 'package:prune/data/sources/shared/models/book.dart';
import 'package:http/http.dart' as http;
import 'package:prune/data/sources/remote/requests/base.dart';
import 'package:prune/data/sources/remote/utils/api_endpoints.dart';
import 'package:prune/data/sources/remote/utils/api_error.dart';
import 'package:prune/data/sources/remote/utils/api_header.dart';
import 'package:prune/data/sources/remote/utils/response_ext.dart';
import 'package:prune/data/sources/remote/values.dart';
import 'package:prune/di/dependencies.dart';
import 'api_service.dart';

class ApiServiceImpl implements ApiService {

  @override
  Future<List<Book>> getBooks(BooksRequest request) async {
    final response = await _doPostRequest(EndPoints.getBooks, request: request);
    final mappedResponse = response.map((e) => Book.fromJson(e));
    return List<Book>.from(mappedResponse);
  }




  // Generic methods
  final String _baseUrl = Values.baseUrl;

  Future<Map<String, String>> get _header async {
    return await locator<ApiHeader>().value;
  }

  Future<dynamic> _doPostRequest(String endPoint, {required BaseRequest request}) async {
    late http.Response response;
    try {
      response = await http.post(
          Uri.parse('$_baseUrl$endPoint'),
          headers: await _header,
          body: jsonEncode(request.toJson())
      );

      print('RESPONSE_POST ::: $endPoint  => ${ response.unwrap()} :::: ${jsonEncode(request.toJson())}');
      return response.unwrap();
    } on ApiError catch (e) {
      log('POST Endpoint ($endPoint) throws error: ${e.message} || response: ${response.body} || request: ${request.toJson()}');
      throw Exception(e.message);
    }
  }

  Future<dynamic> _doPutRequest(String endPoint, {required BaseRequest request}) async {
    late http.Response response;
    try {
      response = await http.put(
          Uri.parse('$_baseUrl$endPoint'),
          headers: await _header,
          body: jsonEncode(request.toJson())
      );
      return response.unwrap();
    } on ApiError catch (e) {
      log('PUT Endpoint ($endPoint) throws error: ${e.message} || response: ${response.body} || request: ${request.toJson()}');
      throw Exception(e.message);
    }
  }

  Future<dynamic> _doGetRequest(String endPoint) async {
    late http.Response response;
    try {
      response = await http.get(
          Uri.parse('$_baseUrl$endPoint'),
          headers: await _header,
      );
      return response.unwrap();
    } on ApiError catch (e) {
      log('GET Endpoint ($endPoint) throws error: ${e.message} || response: ${response.body}');
      throw Exception(e.message);
    }
  }


}
