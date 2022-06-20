//version 1.0.0+1

import 'package:flutter/material.dart';

class PackageProvider with ChangeNotifier {
  bool _value0 = false;
  bool get value0 => _value0;

  int? _countPackages ;
  int? get countPackages => _countPackages;

  bool _value1 = false;
  bool get value1 => _value1;

  bool _value2 = false;
  bool get value2 => _value2;

  bool _value3 = false;
  bool get value3 => _value3;

  bool _hide = false;
  bool get hide => _hide;



  void changeValue0({required bool value}) {
    if (value0 == true) {
      _value1 = true;
      _hide = false;
      
    } else if (value0 == false) {
    
      _hide = true;
      _value1 = false;
    }

    _value0 = value;
    notifyListeners();
  }

  void changeValue1({required bool value}) {
    if (value1 == true) {
      _hide = true;
      _value0 = true;
    } else if (value1 == false) {
      _value0 = false;
      _hide = false;
    }
    _value1 = value;
    notifyListeners();
  }

  void changeValue2({required bool value}) {
    if (value2 == true) {
      _value1 = true;
      _value0 = false;
      _hide = false;
    } else if (value2 == false) {
      _hide = true;
      _value3 = false;
    }
    if (value2 == true) {
    } else if (value2 == false) {}
    _value2 = value;

    notifyListeners();
  }
void getCountPackage(int ?count){
    _countPackages=count;
    notifyListeners();
}
  void changeValue3({required bool value}) {
    if (value3 == true) {
      _value1 = true;
      _value0 = false;
      _hide = false;
    } else if (value3 == false) {
      _hide = true;
      _value2 = false;
    }
    _value3 = value;

    notifyListeners();
  }
}
