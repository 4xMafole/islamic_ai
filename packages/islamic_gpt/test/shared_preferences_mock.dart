import 'package:shared_preferences_platform_interface/shared_preferences_platform_interface.dart';

class SharedPreferencesMock extends SharedPreferencesStorePlatform {
  final Map<String, Object> _storage = <String, Object>{};

  @override
  Future<bool> clear() async {
    _storage.clear();
    return true;
  }

  @override
  Future<Map<String, Object>> getAll() async {
    return _storage;
  }

  @override
  Future<bool> remove(String key) async {
    _storage.remove(key);
    return true;
  }

  @override
  Future<bool> setValue(String valueType, String key, Object value) async {
    _storage[key] = value;
    return true;
  }
}
