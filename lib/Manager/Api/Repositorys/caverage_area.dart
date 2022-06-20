import 'dart:convert';
import 'dart:developer';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import '../../../exports/export_manager.dart';

final AllEreaApi allEreaApi = new AllEreaApi();

class AllEreaApi {
  Future<List<CoverageArea>?> postCoverageArea({
    required BuildContext context,
    required String area,
  }) async {
    try {
      await context.read<UtilsUserProvider>().getNetworkId();
      late final provider =
          Provider.of<UtilsUserProvider>(context, listen: false);
      late final network_Id = provider.networkId.toString();

      var data = json.encode({"name": area, "net_Id": network_Id.toString()});
      http.Response response = await http
          .post(Uri.parse(URI.COVERAGE_AREA),
              headers: FuHeader.headerWithToken(provider.myToken.toString()),
              body: data)
          .timeout(
              Duration(
                seconds: 30,
              ), onTimeout: () {
        return ErrorResponse.snackBarError('not inernet', context, Colors.red);
      });
      if (response.statusCode == URI.StatusCode) {
        log('send secsuss');
        List list = jsonDecode(response.body);
        final coverage =
            list.map((model) => CoverageArea.fromJson(model)).toList();
        print(coverage.length);
        return coverage;
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
    return null;
  }

  Future<List<CoverageArea>?> getCaverage_area(
      {required BuildContext context}) async {
    try {
      await context.read<UtilsUserProvider>().getNetworkId();
      final provider = Provider.of<UtilsUserProvider>(context, listen: false);

      var baseURL = Uri.parse('${URI.Uri}/area/${provider.networkId}');
      List<CoverageArea> users = [];

      var response = await http.get(
        baseURL,
        headers: FuHeader.headerWithToken(provider.myToken.toString()),
      );

      if (response.statusCode == URI.StatusCode) {
        List list = jsonDecode(response.body);
        users = list.map((model) => CoverageArea.fromJson(model)).toList();

        print('تم الحصول علا البيانات بنجاح');
        Navigator.pop(context);
         await FuSharedPreferences.setString('level','3');

        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => PackagesScareen()),
          (Route<dynamic> route) => false,
        );

        return users;
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
    return null;
  }

  Future<List<CoverageArea>?> updateAllcaverage(
      String allcaverage_erea, id, BuildContext context) async {
    var baseURL = Uri.parse('${URI.Uri}/area/$id');
    try {
      final provider = Provider.of<UtilsUserProvider>(context, listen: false);
      MyDialog.submitDialog(context);

      var body = json.encode({
        "name": allcaverage_erea,
      });
      List<CoverageArea> area = [];
      var response = await http.patch(baseURL,
          body: body,
          headers: FuHeader.headerWithToken(provider.myToken.toString()));
      if (response.statusCode == URI.StatusCode) {
        List list = jsonDecode(response.body);
        area = list.map((model) => CoverageArea.fromJson(model)).toList();
        Navigator.pop(context);
        Navigator.pop(context);
        
        context.read<ProviderCoverageArea>().setArea(area);
        return area;
      } else {
        log('not send secsuss');
        Navigator.pop(context);
        Navigator.pop(context);

        ErrorResponse.awesomeDialog(
            error: ErrorResponse.errorRes(response),
            context: context,
            dialogType: DialogType.ERROR);
      }
    } catch (e) {
      Navigator.pop(context);
      Navigator.pop(context);
      ApiErrorHandler.parseError(
        e,
        context,
      );
      print("$e هنالك خطاء");
    }
    return null;
  }

  Future<bool> deleteAreaById(
      {required String id, required BuildContext context}) async {
    try {
      final provider = Provider.of<UtilsUserProvider>(context, listen: false);

      MyDialog.submitDialog(context);
      var baseURL = Uri.parse('${URI.Uri}/area/$id');
      var response = await http.delete(baseURL,
          headers: FuHeader.headerWithToken(provider.myToken.toString()));
      log(response.body);
      if (response.statusCode == URI.StatusCode) {
        Navigator.of(context).pop();
        Navigator.of(context).pop();

        log('send secsuss');

        return true;
      } else {
        log('not send secsuss');
        Navigator.pop(context);
        Navigator.pop(context);

        ErrorResponse.awesomeDialog(
            error: ErrorResponse.errorRes(response),
            context: context,
            dialogType: DialogType.ERROR);

        return false;
      }
    } catch (e) {
      Navigator.pop(context);
      ApiErrorHandler.parseError(
        e,
        context,
      );
      print("$e هنالك خطاء");
      return false;
    }
  }
}
