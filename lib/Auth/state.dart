import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../exports/export_manager.dart';

class AuthProvider with ChangeNotifier {
  bool _obscureText = true;
  bool? get obscureText => _obscureText;

  bool _showDialogError = false;
  bool? get showDialogError => _showDialogError;

  bool _checkTextField = false;
  bool? get checkTextField => _checkTextField;

  bool _checkTextFieldCity = false;
  bool get checkTextFieldCity => _checkTextFieldCity;

  Object? _userType;
  Object? get userType => _userType;

  
  var _controllersUserType;
  get controllersUserType => _controllersUserType;

  String _selectedIndexCategory = 'مخصص';
  get selectedIndexCategory => _selectedIndexCategory;

  

//get data Location network
  List<dynamic>? _governorateLocation;
  List<dynamic>? get governorateLocation => _governorateLocation;
  List<dynamic>? _cityLocation;
  List<dynamic>? get cityLocation => _cityLocation;
  String? token;

  Future<List<User>?> register(
 {  required String username,
  required String  email,
 required String   password,
  required String  phone,
 required BuildContext   context,}
  ) async {
    await UserApi.register(
      username,
      email,
      password,
      phone,
      context,
    );
    /* this is for get data profile and my token */
    late final providerToken =
        Provider.of<UtilsUserProvider>(context, listen: false);
    await providerToken.getToken();
    notifyListeners();
    return null;
  }

  postDetailsUser(
      userType, governorate, city, village, sex, age, context) async {
    /* this is for get data profile and my token */
    late final providerToken =Provider.of<UtilsUserProvider>(context, listen: false);
    await providerToken.getToken();
    var profilerUser = await MySharedPreferences.getDataUser();
    await providerToken.getUserProfile(profilerUser);
    /* this is for send data to server */
    await UserApi.postDetailsUser(
        userType, governorate, city, village, sex, age, context);
    notifyListeners();
  }

  login(
    email,
    password,
    context,
  ) async {
    await UserApi.login(
      email,
      password,
      context,
    );
    notifyListeners();
  }

  logOut() async {
    await SharedPreferences.getInstance().then((value) {
      value.remove(HEADERS.KAY_TOkEN);
    });
    notifyListeners();
  }

  void checkerTextField(TextEditingController governorate) async {
    if (governorate.text.isEmpty) {
      _checkTextField = false;
    } else {
      _checkTextField = true;
    }
    notifyListeners();
  }

  void checkerTextFieldCity(
    TextEditingController city,
  ) async {
    if (city.text.isNotEmpty) {
      _checkTextFieldCity = true;
    } else
      _checkTextFieldCity = false;
    notifyListeners();
  }

  void showAndHidePassword() async {
    _obscureText = !_obscureText;
    notifyListeners();
  }

  void showMyDialogError() async {
    _showDialogError = !_showDialogError;
    notifyListeners();
  }

  void controllerUserType(value) async {
    _controllersUserType = value;
    notifyListeners();
  }

  void selectedCategory(String s) async {
    _selectedIndexCategory = s;
    notifyListeners();
  }

  void checkTypeUser(userType) async {
    if (userType == 1) {
      notifyListeners();
      _userType = 'Client';
    } else if (userType == 2) {
      notifyListeners();
      _userType = 'network_Owner';
    } else if (userType == 3) {
      notifyListeners();
      _userType = 'network_Engineer';
    }
    notifyListeners();
  }

  void governorate(List<dynamic> data) {
    _governorateLocation = data;
    notifyListeners();
  }

  void city(List<dynamic> data) {
    _cityLocation = data;
    notifyListeners();
  }
}
