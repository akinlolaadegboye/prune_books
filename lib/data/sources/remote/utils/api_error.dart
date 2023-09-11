import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:prune/data/sources/remote/service/api_service.dart';
import 'package:prune/values/strings.dart';

class ApiError implements Exception {

  int? code = -1;
  final String? _message;
  static const int _networkErrorCode = 999;

  ApiError(this._message, {this.code}) : super();

  String get message {
    if (_isUnauthorizedError) {
      return Strings.unauthorizedError;
    } else if (_isBadRequestError || _isForbiddenError) {
      return Strings.badRequestError;
    } else if (_isNetworkError) {
      return Strings.connectionLostMiniText;
    } else {
      return _message ?? '';
    }
  }

  bool get _isUnauthorizedError {
    return code == HttpStatus.unauthorized;
  }

  bool get _isBadRequestError {
    return code == HttpStatus.badRequest;
  }

  bool get _isForbiddenError {
    return code == HttpStatus.forbidden;
  }

  bool get _isNetworkError{
    return code == _networkErrorCode || code == HttpStatus.networkConnectTimeoutError || (_message ?? '').contains('socket');
  }

  static ApiError withMessage(String e){
    return ApiError(e);
  }

  static ApiError withErrors(dynamic error) {
    if(error.toString().contains('[')){
      String errorMessage = error.toString().replaceAll('[', '').replaceAll(']', '');
      return ApiError(errorMessage);
    } else if (error is Map<String, dynamic>) {
      return ApiError((error).values.first[0]);
    } else if (error is List<dynamic>){
      return ApiError(error[0]);
    } else if(error is String){
      return ApiError(error);
    }
    return ApiError('Please try again later.');
  }

  static ApiError withResponseException(Response response){
    final result = json.decode(response.body);
    if(result.hasErrors){
      final errorBody = result.errors;
      final firstErrorMessage = errorBody.values.first[0];
      return ApiError(firstErrorMessage, code: response.statusCode);
    }
    return ApiError(response.body, code: response.statusCode);
  }

  static ApiError withException(dynamic exception){
    String error = '';

    if(exception is StateError){
      error = exception.message;
    }else if(exception is ApiError){
      error = exception.message;
    }else{
      error = exception.toString().toLowerCase().replaceFirst('exception: ', '');
    }

    final bool isNetworkError = error.contains(ApiService.baseUrl) && error.contains('failed host lookup');

    int errorCode = -1;
    if(isNetworkError){
      error = Strings.connectionLostMiniText;
      errorCode = _networkErrorCode;
    }
    return ApiError(error, code: errorCode);
  }

}