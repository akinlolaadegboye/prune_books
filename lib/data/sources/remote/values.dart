import 'package:prune/AppInstance.dart';

class Values {
  static get baseUrl => AppInstance().config()!.apiUrl;
}