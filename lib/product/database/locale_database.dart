import 'package:shared_preferences/shared_preferences.dart';
import 'package:voco_case_study/product/database/shared_keys.dart';

class SharedCacheManager {
  SharedCacheManager._init();
  static final SharedCacheManager _instance = SharedCacheManager._init();
  static SharedCacheManager get instance => _instance;

  late SharedPreferences _preferences;

  SharedPreferences read() => _preferences;

  static Future<void> preferencesInit() async {
    instance._preferences = await SharedPreferences.getInstance();
  }

  Future<bool> clear() async {
    return _preferences.clear();
  }

  Future<bool> setStringValue(SharedKeys key, String value) async {
    return _preferences.setString(key.name, value);
  }

  String? stringValue(SharedKeys key) {
    return _preferences.getString(key.name);
  }
}
