import 'package:shared_preferences/shared_preferences.dart';

class Storage {
  static final Storage _instance = Storage._internal();
  factory Storage() => _instance;

  Storage._internal();

  Future<SharedPreferences> _getPrefs() async {
    return await SharedPreferences.getInstance();
  }

  Future<void> setString(String key, String value) async {
    final prefs = await _getPrefs();
    await prefs.setString(key, value);
  }

  Future<String?> getString(String key) async {
    final prefs = await _getPrefs();
    return prefs.getString(key);
  }

  Future<void> setInt(String key, int value) async {
    final prefs = await _getPrefs();
    await prefs.setInt(key, value);
  }

  Future<int?> getInt(String key) async {
    final prefs = await _getPrefs();
    return prefs.getInt(key);
  }

  Future<void> remove(String key) async {
    final prefs = await _getPrefs();
    await prefs.remove(key);
  }

  Future<void> clear() async {
    final prefs = await _getPrefs();
    await prefs.clear();
  }
}
