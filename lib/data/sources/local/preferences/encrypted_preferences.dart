import 'dart:math';

import 'package:cache_x/cache_x.dart';
import 'package:prune/data/sources/local/preferences/preference.dart';
import 'package:prune/extensions/string.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EncryptedPreferences implements Preferences{

  final int _passwordLength = 32;
  bool _isInit = false;
  final String _passwordKey = 'We@34587245!2';

  // Getter methods

  Future<int?> getInt(String key) async => await _pref.then((pref) => pref.getInt(key: key));

  Future<double?> getDouble(String key) async => await _pref.then((pref) => pref.getDouble(key: key));

  @override
  Future<bool?> getBool(String key) async => await _pref.then((pref) => pref.getBool(key: key));

  @override
  Future<String?> getString(String key) async => await _pref.then((pref) => pref.getString(key: key));

  @override
  Future<List<String>?> getStringList(String key) async => await _pref.then((pref) => pref.getStringList(key: key));


  // Setter methods

  Future<bool> setInt(String key, int value) async => await _pref.then((pref) => pref.saveInt(key: key, value: value));

  Future<bool> setDouble(String key, double value) async => await _pref.then((pref) => pref.saveDouble(key: key, value: value));

  @override
  Future<bool> setBool(String key, bool value) async => await _pref.then((pref) => pref.saveBool(key: key, value: value));

  @override
  Future<bool> setString(String key, String value) async => await _pref.then((pref) => pref.saveString(key: key, value: value));

  @override
  Future<bool> setStringList(String key, List<String> value) async => await _pref.then((pref) => pref.saveStringList(key: key, value: value));


  // Generic methods

  @override
  Future<bool> clear() async {
    final Set<String> keys = (await _pref).getKeys();
    // Password key need to be retained to make the Pref. usable.
    keys.remove(_passwordKey);
    for (var key in keys) {
      (await _pref).remove(key);
    }
    return true;
  }

  Future<bool> containsKey(String key) async => await _pref.then((pref) => pref.containsKey(key));

  Future<CacheXCore> get _pref async {
    if(!_isInit) {
      CacheXCore().init(password: await _password);
      _isInit = true;
    }
    return CacheXCore.instance;
  }

  Future<String> get _password async {
    final pref = await SharedPreferences.getInstance();
    String? password = pref.getString(_passwordKey);

    if(password == null){
      password = _createPassword();
      await pref.setString(_passwordKey, password);
      return _shufflePassword(password);
    }

    return _shufflePassword(password);
  }

  String _createPassword() {
    final random = Random();
    final String password = String.fromCharCodes(
        List.generate(_passwordLength, (index) => random.nextInt(23) + 99)
    );
    return password;
  }

  String _shufflePassword(String password) {
    final int passwordMidPoint = _passwordLength ~/ 2;
    final first = password.substring(0, passwordMidPoint);
    final second = password.substring(passwordMidPoint, _passwordLength);

    return '${first.reversed}${second.reversed}';
  }

}
