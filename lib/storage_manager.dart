import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class StorageKey {
  StorageKey._();
  static String LOGGEDIN_PHONES = "loggedInPhones ";
  static String ACCESS_TOKEN_DTO = "ACCESS_TOKEN_DTO";
}

class StorageManager {
  late SharedPreferences _preferences;
  StorageManager._();

  static Future<StorageManager> getInstance() async {
    final storeManager = StorageManager._();
    storeManager._preferences = await SharedPreferences.getInstance();
    return storeManager;
  }
  // AccessTokenDto? getAccessTokenDto() {
  //   final data = _preferences.getString(StorageKey.ACCESS_TOKEN_DTO);
  //   if (data != null) {
  //     return AccessTokenDto.fromJson(json.decode(data));
  //   } else {
  //     return null;
  //   }
  // }
  //
  // Future<void> saveAccessTokenDto(AccessTokenDto data) async {
  //   await _preferences.setString(
  //       StorageKey.ACCESS_TOKEN_DTO, json.encode(data.toJson()));
  // }

  Future<bool> removeAccessTokenDto() {
    return _preferences.remove(StorageKey.ACCESS_TOKEN_DTO);
  }

  Future<bool> clearAccessTokenDto() {
    return _preferences.clear();
  }

  List<String>? getLoggedInPhones() {
    return _preferences.getStringList(StorageKey.LOGGEDIN_PHONES);
  }

  Future<void> saveLoggedInPhones(String phone) async {
    final listPhone = getLoggedInPhones() ?? [];
    if (listPhone.contains(phone.trim())) {
      listPhone.remove(phone);
    }
    listPhone.insert(0, phone);
    await _preferences.setStringList(StorageKey.LOGGEDIN_PHONES, listPhone);
  }

  Future<void> updateLoggedPhones(String oldPhone, String newPhone) async {
    final listPhone = getLoggedInPhones() ?? [];
    if (listPhone.contains(oldPhone.trim())) {
      listPhone.remove(oldPhone);
    }
    listPhone.insert(0, newPhone);
    await _preferences.setStringList(StorageKey.LOGGEDIN_PHONES, listPhone);
  }
}
