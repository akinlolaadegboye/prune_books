import 'package:prune/data/sources/remote/requests/books.dart';
import 'package:prune/data/sources/shared/models/books.dart';
import 'package:dio/dio.dart';
import 'package:prune/data/sources/remote/utils/api_endpoints.dart';
import 'package:retrofit/retrofit.dart';
part 'api_service.g.dart';

@RestApi(baseUrl: ApiService.baseUrl)
abstract class ApiService {
  static const String baseUrl = 'http://nyx.vima.ekt.gr:3000/';

  factory ApiService(Dio dio) = _ApiService;

  @POST(EndPoints.getBooks)
  Future<List<Books>> getBooks(BooksRequest request);


}
