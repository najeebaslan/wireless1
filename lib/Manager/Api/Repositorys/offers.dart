import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import '../../../exports/export_manager.dart';

OffersApi Offersapi = OffersApi();

class OffersApi {
  postOffers(
    String package,
    offers,
    Package_data,
    details_data,
    Package_time,
    details_time,
    Package_validity,
    details_validity,
    limiteUptime,
    details_limiteUptime,
    networkId,
    BuildContext context
  ) async {
    var baseURL = Uri.parse('${URI.Uri}/offer/offer');
    try {
      var body = json.encode({
        "package": package,
        "offers": offers,
        "Package_data": Package_data,
        "details_data": details_data,
        "Package_time": Package_time,
        "details_time": details_time,
        "Package_validity": Package_validity,
        "details_validity": details_validity,
        "limiteUptime": limiteUptime,
        "details_limiteUptime": details_limiteUptime,
        "networkId": networkId,
      });
      final provider = Provider.of<UtilsUserProvider>(context, listen: false);

      var response = await http.post(
        baseURL,
        body: body,
        headers:  FuHeader.headerWithToken(provider.myToken.toString())
        //headers,
      );
      final responseJson = json.decode(response.body);
      if (response.statusCode == 200) {
        print('تم ارسال الباقة بنجاح');
      }
      var data = responseJson;

      print(data);

      return response;
    } catch (e) {
      print('هناك خطاء' + '$e');
    }
  }

  getOffers(idnetwork,BuildContext context) async {
    var baseURL = Uri.parse('${URI.Uri}/offer/$idnetwork');

    try {
       final provider = Provider.of<UtilsUserProvider>(context, listen: false);
      var response = await http.get(
        baseURL,
        headers:  FuHeader.headerWithToken(provider.myToken.toString())
        // headers,
      );
      List list = jsonDecode(response.body);
      late final networks =
          list.map((model) => Offers.fromJson(model)).toList();
      print(networks.length);

      return networks;
    } catch (e) {
      print("${e.toString()}هناك خطاء");
    }
  }

  getAllOffers(BuildContext context) async {
    var baseURL = Uri.parse('${URI.Uri}/offer');

    try {
       final provider = Provider.of<UtilsUserProvider>(context, listen: false);

      var response = await http.get(
        baseURL,
        headers:  FuHeader.headerWithToken(provider.myToken.toString())
        //headers,
      );
      List list = jsonDecode(response.body);
      late final networks =
          list.map((model) => Offers.fromJson(model)).toList();
      print(networks.length);

      return networks;
    } catch (e) {
      print("${e.toString()}هناك خطاء");
    }
  }
}

