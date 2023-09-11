import 'package:prune/data/sources/local/preferences/preference.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PlainPreferences extends Preferences {

  final SharedPreferences _pref;

  PlainPreferences(this._pref);

  @override
  Future<String?> getString(String key) async {
    return _pref.getString(key);
  }

  @override
  Future<List<String>?> getStringList(String key) async {
    return _pref.getStringList(key);
  }

  @override
  Future<bool> setString(String key, String value) async{
    return _pref.setString(key, value);
  }

  @override
  Future<bool> setStringList(String key, List<String> value) async{
    return _pref.setStringList(key, value);
  }

  @override
  Future<bool?> getBool(String key) async {
    return _pref.getBool(key);
  }

  @override
  Future<bool> setBool(String key, bool value) async {
    return _pref.setBool(key, value);
  }

  @override
  Future<bool> clear() async {
    return _pref.clear();
  }

}
