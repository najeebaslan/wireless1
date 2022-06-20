import 'dart:convert';
import 'dart:developer';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:http_parser/http_parser.dart';
import '../../../exports/export_manager.dart';

var networkId;
// String uri = "http://172.16.0.8:3000";
// String uri = "http://naeebaslan.com:3000";فتح التطبيق مجان عبر الشبكة
// String uri = "http://7444062152f2.sn.mynetname.net:250"; فتح التطبيق مجان عبر البيانات

class NetworkApi {
  static postCreatNetwork(
      String nameA,
      String nameE,
      image,
      String address,
      String user_initiate,
      String governorate,
      String city,
      String village,
      int maintenancePhone,
      var maintenancePhone1,
      BuildContext context) async {
    try {
      String resultPhones() {
        if (maintenancePhone1 == 'resultNull') {
          return '[{"number_one": "$maintenancePhone"}]';
        } else {
          return '[{"number_one":"$maintenancePhone","number_tow":"$maintenancePhone1"}]';
        }
      }

      /* this is  for get token from sherdPref */
      late final providerToken =
          Provider.of<UtilsUserProvider>(context, listen: false);
      var request =
          http.MultipartRequest('POST', Uri.parse(URI.CREATE_NETWORK));
      request.fields.addAll({
        'name_A': nameA,
        'name_E': nameE,
        // 'address': address,
        'user_Initiate': user_initiate,
        'governorateId': governorate,
        'cityName': city,
        'streetName': village,
        'maintenancePhone': resultPhones(),
        'power_Type': 'Solar_Energy'
      });

      request.files.add(await http.MultipartFile.fromPath(
        'img',
        image,
        contentType: MediaType('image', 'jpg'),
      ));
      request.headers.addAll(FuHeader.headerWithToken(providerToken.myToken!));

      http.StreamedResponse response = await request.send();
      var resulte = await http.Response.fromStream(response);

      if (resulte.statusCode == URI.StatusCode) {
        print(resulte.reasonPhrase);
        print('تم ارسال  بيانات الشبكة بنجاح');
        final data = json.decode(resulte.body);
        await FuSharedPreferences.setString('level', '2');

        await FuSharedPreferences.setString(HEADERS.NETWORK_ID, data['id']);
        context.read<ProviderNetworkDetails>().timeliene(value:1);
        providerToken.getNetworkId();
        Navigator.pop(context);
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => CoverageAreaScareen()),
          (Route<dynamic> route) => false,
        );
      } else {
        var massages = json.decode(resulte.body.toString());
        log('Error ==> ${massages['Error']}');
        Navigator.pop(context);
        ErrorResponse.awesomeDialog(
           error: massages['Error'], context:context,dialogType: DialogType.ERROR);
      }
    } catch (err) {
      log(err.toString());
      Navigator.pop(context);
      ApiErrorHandler.parseError(
        err,
        context,
      );
      print("===>:هنالك خطاء ${err.toString()} ");
      print('هناك خطاء' + '$err');
    }
  }
}
