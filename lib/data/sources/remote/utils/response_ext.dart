import 'dart:convert';
import 'dart:io';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:prune/data/sources/remote/utils/api_error.dart';
import 'package:prune/values/strings.dart';

extension ResponseExt on Response{

  dynamic unwrap() {
    try {
      return _doUnwrap();
    } on ApiError {
      rethrow;
    } catch(e){
      throw ApiError.withException(e);
    }
  }

  dynamic _doUnwrap() {
    throwIf(
        statusCode == HttpStatus.unauthorized,
        ApiError(Strings.unauthorizedError, code: HttpStatus.unauthorized)
    );
    throwIf(
        statusCode == HttpStatus.internalServerError,
        ApiError(Strings.internalServerError, code: HttpStatus.internalServerError)
    );
    throwIf(
        statusCode == HttpStatus.serviceUnavailable,
        ApiError(Strings.unauthorizedShortMessage, code: HttpStatus.unauthorized)
    );

    if (_isSuccessful) {
      if(_isResultListOfJson){
        return _result;
      }

      if (_hasErrors) {
        throw ApiError.withErrors(_errors);
      } else {
        return _decodedResult;
      }
    } else {
      throw ApiError.withResponseException(this);
    }
  }

  bool get _isSuccessful => statusCode != 0;

  bool get _isResultListOfJson {
    return _result.toString().startsWith('[{') && _result.toString().endsWith('}]');
  }

  bool get _hasData => _result.containsKey('books');

  dynamic get _data => _result['books'];


  dynamic get _errors => _result['error'];

  bool get _hasErrors => _result.containsKey('error');

  dynamic get _decodedResult {
    if(_hasData){
      return _data;
    }
    return _result;
  }

  dynamic get _result => json.decode(body);

}
