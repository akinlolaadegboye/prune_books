class ApiHeaderImpl implements ApiHeader{


  ApiHeaderImpl();
  @override
  Future<Map<String, String>> get value async {
    return <String, String>{
      'Content-type': 'application/json',
      'Accept': 'application/json'
    };
  }

}

abstract class ApiHeader {

  Future<Map<String, String>> get value;

}
