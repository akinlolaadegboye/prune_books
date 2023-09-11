import 'package:prune/AppConfig.dart';

class AppInstance {
  AppConfig? _appConfig;
  static final AppInstance _singleton = AppInstance._internal();
  factory AppInstance() {
    return _singleton;
  }

  void setConfig(AppConfig appConfig) {
    _appConfig = appConfig;
  }

  AppConfig? config() => _appConfig;
  AppInstance._internal();
}
