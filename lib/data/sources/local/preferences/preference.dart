

abstract class Preferences {

  Future<String?> getString(String key);

  Future<List<String>?> getStringList(String key);

  Future<bool?> getBool(String key);

  Future<bool> setString(String key, String value);

  Future<bool> setStringList(String key, List<String> value);

  Future<bool> setBool(String key, bool value);

  Future<bool> clear();


}