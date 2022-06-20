import 'package:flutter/material.dart';

import '../../../../exports/export_manager.dart';

class ProviderNetworkDetails with ChangeNotifier {
  bool _checkTextFieldCity = false;
  bool get checkTextFieldCity => _checkTextFieldCity;
  bool _checkTextField = false;
  bool get checkTextField => _checkTextField;
  AutovalidateMode _autoTextfield = AutovalidateMode.disabled;
  AutovalidateMode get autoTextfield => _autoTextfield;
  AutovalidateMode _autoTextfield1 = AutovalidateMode.disabled;
  AutovalidateMode get autoTextfield1 => _autoTextfield1;
  AutovalidateMode _autoTextfieldEmile = AutovalidateMode.disabled;
  AutovalidateMode get autoTextfieldEmile => _autoTextfieldEmile;
  AutovalidateMode _autoTextfieldPhone = AutovalidateMode.disabled;
  AutovalidateMode get autoTextfieldPhone => _autoTextfieldPhone;
  int _processIndex = 0;
  bool _sizeicon = true;
  int get processIndex => _processIndex;
  bool get sizeicon => _sizeicon;
  bool _sizeicon2 = false;
  bool get sizeicon2 => _sizeicon2;
  void validitionMaintenancePhone(
      TextEditingController _maintenancePhone1) async {
    if (_maintenancePhone1.text.length < 11 &&
        _maintenancePhone1.text.startsWith(new RegExp('^[0-9]'))) {
      _sizeicon = false;
      notifyListeners();
    } else if (_maintenancePhone1.text.length < 1 &&
        _maintenancePhone1.text.isEmpty) {
      // setState(() {
      _sizeicon = true;
      _sizeicon2 = false;
      notifyListeners();
    } else {
      _sizeicon = true;
      notifyListeners();
    }
    notifyListeners();
  }

  autovalidition(TextEditingController value, String regexp) async {
    if (value.text.startsWith(RegExp(regexp)) | value.text.startsWith(' ')) {
      notifyListeners();
      return _autoTextfield = AutovalidateMode.always;
    }
  }

  autovalidition1(TextEditingController value, String regexp) async {
    if (value.text.startsWith(RegExp(regexp)) | value.text.startsWith(' ')) {
      notifyListeners();
      return _autoTextfield1 = AutovalidateMode.always;
    }
  }

  autovaliditionEmile(TextEditingController value, String regexp) async {
    if (value.text.startsWith(RegExp(regexp)) | value.text.startsWith(' ')) {
      notifyListeners();
      return _autoTextfieldEmile = AutovalidateMode.always;
    }
  }

  autoValidationPhone(TextEditingController value, String regexp) async {
    if (!value.text.startsWith(RegExp(regexp)) | value.text.startsWith(' ')) {
      notifyListeners();
      return _autoTextfieldPhone = AutovalidateMode.always;
    }
  }

  void truesizeicon() async {
    _sizeicon = true;
    notifyListeners();
  }

  void truesizeicon2() async {
    _sizeicon2 = true;
    notifyListeners();
  }

  void timeliene({required int value}) async {
    _processIndex = (processIndex + value) % processes.length;
    notifyListeners();
  }

  void checkerTextFieldCity(TextEditingController city) async {
    if (city.text.isNotEmpty) {
      _checkTextFieldCity = true;
    } else
      _checkTextFieldCity = false;
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
}
