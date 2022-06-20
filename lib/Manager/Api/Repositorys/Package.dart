import 'dart:convert';
import 'dart:developer';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import '../../../exports/export_manager.dart';

final PackageApi packageApi = new PackageApi();
bool checkeDatat = false;

class PackageApi {
 Future<dynamic> postDetailsPackage(
      {required String package_Price,
      required String package_Data,
      required String package_Time,
      required String package_Validity,
      required bool have_Password,
      required String details_Time,
      required String details_Validity,
      required String details_Data,
      required bool equalUAP,
      required BuildContext context}) async {
    var baseURL = Uri.parse('${URI.Uri}/package/createDetailsPackage');
    try {
      final provider = Provider.of<UtilsUserProvider>(context, listen: false);
      provider.getNetworkId();
      late final network_Id = provider.networkId.toString();
      var usserid = await MySharedPreferences.getDataUser();
      var body = json.encode({
        "package_Price": package_Price,
        "package_Data": package_Data,
        "package_Time": package_Time,
        "package_Validity": package_Validity,
        "have_Password": have_Password,
        "details_Time": details_Time,
        "details_Validity": details_Validity,
        "details_Data": details_Data,
        "network_Id": network_Id,
        "user_Initiate": usserid['_id'],
        "equalUAP": equalUAP
      });

      http.Response response = await http.post(baseURL,
          body: body,
          headers: FuHeader.headerWithToken(provider.myToken.toString()));
      if (response.statusCode == URI.StatusCode) {
        print('تم ارسال الباقة بنجاح');
        Navigator.pop(context);
        return response;
      } else {
        log('not send secsuss');

        Navigator.pop(context);
        ErrorResponse.awesomeDialog(
            error: ErrorResponse.errorRes(response),
            context: context,
            dialogType: DialogType.ERROR);
      }
    } catch (e) {
      Navigator.pop(context);
      ApiErrorHandler.parseError(
        e,
        context,
      );
      print("$e هنالك خطاء");
    }
  }

  postdetailsPackage(
      String Package_data,
      Package_time,
      Package_validity,
      details_time,
      details_validity,
      details_data,
      networkId,
      Package_PriceId,
      User_initiate,
      id,
      bool isAdd,
      BuildContext context) async {
    var baseURL = Uri.parse('${URI.Uri}/package/create/$id');
    try {
      final provider = Provider.of<UtilsUserProvider>(context, listen: false);

      var body = json.encode({
        "Package_data": Package_data,
        "Package_time": Package_time,
        "Package_validity": Package_validity,
        "details_time": details_time,
        "details_validity": details_validity,
        "details_data": details_data,
        "networkId": networkId,
        "Package_PriceId": Package_PriceId,
        "User_initiate": User_initiate,
        "isAdd": isAdd
      });

      var response = await http.post(baseURL,
          body: body,
          headers: FuHeader.headerWithToken(provider.myToken.toString())
          // headers,
          );
      final responseJson = json.decode(response.body);
      if (response.statusCode == 200) {
        print('تم ارسال الباقة بنجاح');
      }
      var idPackage = responseJson["id"];
      print(idPackage);

      return response;
    } catch (e) {
      print('هناك خطاء' + '$e');
    }
  }

  Future<List<PackagePriceId>?> getPackagePrice(
      String id, BuildContext context) async {
    var baseURL = Uri.parse('${URI.Uri}/package/price/$id');
    try {
      final provider = Provider.of<UtilsUserProvider>(context, listen: false);

      List<PackagePriceId> packagePriceId = [];
      var response = await http.get(baseURL,
          headers: FuHeader.headerWithToken(provider.myToken.toString())

          //  headers,
          );
      List list = jsonDecode(response.body);
      packagePriceId =
          list.map((model) => PackagePriceId.fromJson(model)).toList();
      print(packagePriceId.length);
      print('تم الحصول علا البيانات بنجاح');
      checkeDatat = false;
      return packagePriceId;
    } catch (e) {
      checkeDatat = true;
      print("$e هنالك خطاء");
    }
    return null;
  }

  Future<int> getPackageCountByNetworkId(BuildContext context,) async {
    try {
      final provider = Provider.of<UtilsUserProvider>(context, listen: false);
    await  provider.getNetworkId();
      late final network_Id = provider.networkId.toString();
      var baseURL = Uri.parse('${URI.Uri}/package/counts/$network_Id');

      var response = await http.get(baseURL,
          headers: FuHeader.headerWithToken(provider.myToken.toString()));

      print('تم الحصول علا البيانات بنجاح');
      var list = jsonDecode(response.body);
      print(list['count'].toString()+'count');

      return list['count'];
      //int.parse(list[0]['count']);
    } catch (e) {
      print("$e هنالك خطاء");
    }
    return 0;
  }

  Future<List<Package>?> getAllPackagePrice(
      String id, BuildContext context) async {
    var baseURL = Uri.parse('${URI.Uri}/package/$id');
    try {
      final provider = Provider.of<UtilsUserProvider>(context, listen: false);

      List<Package> package = [];
      var response = await http.get(baseURL,
          headers: FuHeader.headerWithToken(provider.myToken.toString())
          // headers,
          );
      List list = jsonDecode(response.body);
      package = list.map((model) => Package.fromJson(model)).toList();
      print(package.length);
      print('تم الحصول علا البيانات بنجاح');
      checkeDatat = false;
      return package;
    } catch (e) {
      checkeDatat = true;
      print("$e هنالك خطاء");
    }
    return null;
  }

  updatePackage(String id, package_price) async {
    var baseURL = Uri.parse('${URI.Uri}/package/update/price/$id');
    try {
      var body = json.encode({
        "Package_Price": package_price,
      });
      await http.patch(baseURL,
          body: body, headers: FuHeader.headerWithoutToken());
    } catch (e) {
      print('$eهناك خطاء');
    }
  }

  deletePackagePrice(PackagePriceId packagePrice, BuildContext context) async {
    try {
      final provider = Provider.of<UtilsUserProvider>(context, listen: false);

      var baseURL = Uri.parse('${URI.Uri}/package/${packagePrice.id}');
      await http.delete(baseURL,
          headers: FuHeader.headerWithToken(provider.myToken.toString())

          // headers,
          );
    } catch (e) {
      print('$eهناك خطاء');
    }
  }
}
