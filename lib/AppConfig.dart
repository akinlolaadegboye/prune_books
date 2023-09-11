import 'dart:convert';
import 'package:flutter/services.dart';

class AppConfig {
  final String apiUrl;

  AppConfig({required this.apiUrl});

  static const String dev = 'dev';
  static const String staging = 'staging';
  static const String prod = 'prod';

  static String _getConfig({String? env}) {
    switch (env) {
      case AppConfig.dev:
        return AppConfig.dev;
      case AppConfig.prod:
        return AppConfig.prod;
      case AppConfig.staging:
        return AppConfig.staging;
      default:
        return 'dev';
    }
  }

  static Future<AppConfig> forEnvironment({String? env}) async {
    final contents = await rootBundle.loadString(
      'assets/config/${_getConfig(env: env)}.json',
    );
    final json = jsonDecode(contents);
    return AppConfig(apiUrl: json['apiUrl']);
  }
}
