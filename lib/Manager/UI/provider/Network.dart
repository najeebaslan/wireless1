import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../../exports/export_manager.dart';

class NetworkProvider with ChangeNotifier {
  createNetwork(nameA, nameE, iamge, address, user_initiate, governorate, city,
      village, maintenancePhone, maintenancePhone1, context) async {
    await NetworkApi.postCreatNetwork(
        nameA,
        nameE,
        iamge,
        address,
        user_initiate,
        governorate,
        city,
        village,
        maintenancePhone,
        maintenancePhone1,
        context);
    notifyListeners();
  }
}
