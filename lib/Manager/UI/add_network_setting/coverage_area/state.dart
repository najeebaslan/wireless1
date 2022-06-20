import 'package:flutter/material.dart';

import '../../../../exports/export_manager.dart';

class ProviderCoverageArea with ChangeNotifier {
  bool _chackevalue = true;
  bool get chackevalue => _chackevalue;
  bool _chackevalue1 = false;
  bool get chackevalue1 => _chackevalue1;
  List<CoverageArea>? _area = [];
  List<CoverageArea>? get area => _area;

  validition(
    TextEditingController areanetwork,
  ) async {
    RegExp regExp = new RegExp(r'[A-Za-z0-9-[\]_+/+\+.+!+$+#+@+~+|+"+`+]+');
    if (areanetwork.text.startsWith(regExp) && areanetwork.text.length >= 1 ||
        areanetwork.text.startsWith(' ')) {
      _chackevalue = true;
    } else if (!areanetwork.text.startsWith(regExp) &&
        areanetwork.text.length >= 1) {
      _chackevalue = false;
    } else if (areanetwork.text.length < 1 && areanetwork.text.isEmpty) {
      _chackevalue = true;
      _chackevalue1 = false;
    } else {
      _chackevalue = true;
    }
    notifyListeners();
  }

  // postCoverageArea(context, areanetwork) async {
  //   await allEreaApi.postCoverageArea(context: context, area: areanetwork);
  //   notifyListeners();
  // }

  // onPressedtrue() async {
  //   return _chackevalue1 = true;
  // }

  // onPressedfalse() async {
  //   return _chackevalue1 = false;
  // }

 void setArea(value) async {
     _area = value;
    notifyListeners();
  }
}
