// @dart=2.9
import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prune/AppConfig.dart';
import 'package:prune/AppInstance.dart';
import 'package:prune/app.dart';
import 'package:prune/di/dependencies.dart';
import 'package:prune/values/styles.dart';
import 'package:provider/provider.dart';

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

void main() async {
  await _initStartupVariables();
  const String dev = AppConfig.dev; //Pass this env. string to run the app on dev. env.
  const String staging = AppConfig.staging; //Pass this env. string to run the app on staging env.
  const String prod = AppConfig.prod; //Pass this env. string to run the app on production env.

  const env = String.fromEnvironment('ENVIRONMENT');
  runApp(PruneBookApp(await AppConfig.forEnvironment(env: dev)));
}

Future<void> _initStartupVariables() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setUpDependencies();
  HttpOverrides.global = MyHttpOverrides();
}

class PruneBookApp extends StatelessWidget {
  final AppConfig appConfig;
  const PruneBookApp(this.appConfig,{Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppInstance().setConfig(appConfig);
    return MultiProvider(
      providers: App.notifierProviders,
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppStyles.lightTheme,
        initialRoute: App.startingRoute,
        routes: App.routes,
      ),
    );
  }
}
