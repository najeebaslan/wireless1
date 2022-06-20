import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import '../exports/export_manager.dart';

class UtilsUserProvider with ChangeNotifier {
  String? _token;
  String? _networkId;
  String? get myToken => _token;
  String? get networkId => _networkId;
  dynamic _userProfile;
  get userProfile => _userProfile;

  getToken() async {
    notifyListeners();
    this._token = await FuSharedPreferences.getString(HEADERS.KAY_TOkEN);
    notifyListeners();
    return this._token;
  }

  getUserProfile(dataProfile) async {
    notifyListeners();
    this._userProfile = dataProfile;
    notifyListeners();
    return this._userProfile;
  }

  getNetworkId() async {
    notifyListeners();
    this._networkId = await FuSharedPreferences.getString(HEADERS.NETWORK_ID);
    notifyListeners();
    return this._networkId;
  }
}
