import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// [StorageUtils] save data as key , value

class StorageUtils {
  static Future<SharedPreferences> get _instance async =>
      _prefsInstance ??= await SharedPreferences.getInstance();
  static SharedPreferences? _prefsInstance;

  static Future<SharedPreferences?> init() async {
    _prefsInstance = await _instance;

    return _prefsInstance;
  }

  static Future<bool> setBool(String key, bool value) async {
    var prefs = await _instance;
    return prefs.setBool(key, value);
  }

  static bool getBool(String key, [bool? defValue]) {
    return _prefsInstance?.getBool(key) ?? defValue ?? false;
  }

  static Future<bool> setString(String key, String value) async {
    var prefs = await _instance;
    return prefs.setString(key, value);
  }

  static String getString(String key, [String? defValue]) {
    return _prefsInstance?.getString(key) ?? defValue ?? "";
  }

  static Future<bool> remove(String key) async {
    var prefs = await _instance;
    return prefs.remove(key);
  }

  static Future<bool> clear() async {
    var prefs = await _instance;
    String api = StorageUtils.getString("api"); // <-- url or api
    debugPrint('Cleared Stored URL : $api');
    prefs.clear();
    return prefs.setString("api", api);
  }
}
