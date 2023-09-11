import 'package:prune/presentation/screens/home/home_view_model.dart';
import 'package:get_it/get_it.dart';
import 'package:prune/data/repos/content/content_repo.dart';
import 'package:prune/data/repos/content/remote_content_repo.dart';
import 'package:prune/data/sources/local/preferences/plain_preferences.dart';
import 'package:prune/data/sources/local/preferences/preference.dart';
import 'package:prune/data/sources/remote/service/api_service.dart';
import 'package:prune/data/sources/remote/service/api_service_impl.dart';
import 'package:prune/data/sources/remote/utils/api_header.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt locator = GetIt.instance;

Future<void> setUpDependencies() async {

  // LocalDB & Preference DI
  final pref = await SharedPreferences.getInstance();
  locator.registerLazySingleton<Preferences>(() => PlainPreferences(pref));

  // API Services DI
  locator.registerLazySingleton<ApiService>(() => ApiServiceImpl());

  // Repos DI
  locator.registerLazySingleton<ContentRepo>(() {
    return RemoteContentRepo(locator<ApiService>());
  });


  locator.registerFactory<ApiHeader>(() {return ApiHeaderImpl();});

  // ViewModels DI
  locator.registerLazySingleton(() => HomeViewModel(locator<ContentRepo>()));

}
