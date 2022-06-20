import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wirless_wifi/utils/utils_api/headers.dart';
import '../../exports/export_manager.dart';

class MySharedPreferences {


  static getDataUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? userStr = prefs.getString(HEADERS.USER_DATA);
    Map<String, dynamic>? userMap;
    var data;
    if (userStr != null) {
      userMap = jsonDecode(userStr) as Map<String, dynamic>;
      data = userMap;
    }

    return data;
  }
}
