import 'dart:convert';

import 'package:flutter_assignment/app/app_pkg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class StorageService extends GetxService{
  static final _box = GetStorage();

  static void save(String key, dynamic value) {
    _box.write(key, value);
  }

  // Function to retrieve a value by its key
  static dynamic read(String key) {
    return _box.read(key);
  }

  // Function to remove a value by its key
  static void remove(String key) {
    _box.remove(key);
  }
  static void save2<T>(String key, T value) {
    _box.write(key, value);
  }

  static T? read2<T>(String key) {
    try {
      return _box.read<T>(key);
    } catch (e) {
      logError('Error reading value for key "$key": $e');
      return null;
    }
  }

  static void remove3(String key) {
    _box.remove(key);
  }

  static void clear() {
    _box.erase();
  }
  static Future<void> setString(String key, String value) async {
    await _box.write(key, value);
  }
  static String getString(String key) {
    return _box.read(key) ?? '';
  }
  static Future<void> setBool(String key, bool value) async {
    await _box.write(key, value);
  }

  static bool? getBool(String key,)  {
    var value = _box.read(key);
    if(value != null && value is bool){
      return _box.read(key);
    }else{
      return null;
    }
  }

  static Future<void> setObject<T>(String key, T value) async {
    final jsonString = json.encode(value);
    await _box.write(key, jsonString);
  }

  static T? getObject<T>(String key, {T? defaultValue}) {
    final jsonString = _box.read(key) as String?;
    if (jsonString != null) {
      return json.decode(jsonString) as T;
    }
    return defaultValue;
  }
  static Future<void> setWithExpiration(String key, String value, Duration expiration) async {
    final data = {
      'value': value,
      'expiration': DateTime.now().add(expiration).toIso8601String(),
    };
    await _box.write(key, json.encode(data));
  }

  static String getWithExpiration(String key) {
    final jsonString = _box.read(key) as String?;
    if (jsonString != null) {
      final data = json.decode(jsonString);
      final expiration = DateTime.parse(data['expiration']);
      if (expiration.isAfter(DateTime.now())) {
        return data['value'];
      } else {
        _box.remove(key);
      }
    }
    return '';
  }

}