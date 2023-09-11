import 'package:flutter/cupertino.dart';
import 'package:prune/di/dependencies.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'presentation/screens/home/home_screen.dart';
import 'presentation/screens/home/home_view_model.dart';

class App {

  static List<String> routesIds = routes.keys.toList();
  static const String imagesParentDir = 'assets/images/';
  static const String gifParentDir = 'assets/gif/';
  static String startingRoute = HomeScreen.id;

  static Map<String, WidgetBuilder> routes = {
    HomeScreen.id: (_) => const HomeScreen()
  };

  static List<SingleChildWidget> notifierProviders = [
    ChangeNotifierProvider(create: (_) => locator<HomeViewModel>()),
  ];
}
