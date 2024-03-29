import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_app/common/entities/user.dart';
import 'package:shop_app/common/values/constants.dart';

class StorageService {
  late final SharedPreferences _prefs;
  Future<StorageService> init() async {
    _prefs = await SharedPreferences.getInstance();
    return this;
  }

  Future<bool> setBool(String key, bool value) async {
    return await _prefs.setBool(key, value);
  }

  Future<bool> setString(String key, String value) async {
    return await _prefs.setString(key, value);
  }

  bool getDeviceIsFirstOpen() {
    return _prefs.getBool(AppConstants.STORAGE_DEVICE_OPEN_FIRST_TIME) ?? false;
  }

  bool getUserIsLoggedIn() {
    return _prefs.getString(AppConstants.USER_TOKEN_KEY) == null ? false : true;
  }

  String getUserKey() {
    return _prefs.getString(AppConstants.USER_TOKEN_KEY) ?? "";
  }

  Future<bool> remove(String key) {
    return _prefs.remove(key);
  }

  UserItem? getUserProfile() {
    var profileOffline = _prefs.getString(AppConstants.USER_PROFILE_INFO) ?? "";
    if (profileOffline.isNotEmpty) {
      return UserItem.fromJson(jsonDecode(profileOffline));
    }
    return null;
  }
}
