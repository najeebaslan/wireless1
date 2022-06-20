

import 'dart:convert';
import 'dart:js';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import '../../../exports/export_manager.dart';
final Governorates GovernorateApi = new Governorates();

class Governorates {
  Future<List<Governorate>?> getPackagePrice(BuildContext context) async {
    var baseURL = Uri.parse('${URI.Uri}/erea/governorate/all');
    try {
      List<Governorate> governorate = [];
       final provider = Provider.of<UtilsUserProvider>(context, listen: false);

      var response = await http.get(
        baseURL,
        headers: FuHeader.headerWithToken(provider.myToken.toString())
        
        //headers,
      );
      List list = jsonDecode(response.body);
      governorate = list.map((model) => Governorate.fromJson(model)).toList();
      print(governorate.length);
      print('تم الحصول علا البيانات بنجاح');

      return governorate;
    } catch (e) {
      print("$e هنالك خطاء");
    }
    return null;
  }

  static Future<List<Governorate>> getGovernorate(String query,String Token) async {
  
    final response = await http.get(Uri.parse(URI.GOVERNORATE),
     
      
        headers: FuHeader.headerWithToken(Token));

    if (response.statusCode == URI.StatusCode) {
      final List users = json.decode(response.body);
      print(response.body);
      return users.map((json) => Governorate.fromJson(json)).where((user) {
        final nameLower = user.governorate!.toLowerCase();
        final queryLower = query.toLowerCase();

        return nameLower.contains(queryLower);
      }).toList();
    } else {
      print(Exception());
      print('Exception');

      throw Exception();
    }
  }
  static Future<List<Governorate>> getCity(String query,String Token) async {
    final response = await http.get(Uri.parse(URI.CITY),
        headers:FuHeader.headerWithToken(Token));

    if (response.statusCode == URI.StatusCode) {
      final List users = json.decode(response.body);
      print(response.body);
      return users.map((json) => Governorate.fromJson(json)).where((user) {
        final nameLower = user.city!.toLowerCase();
        final queryLower = query.toLowerCase();

        return nameLower.contains(queryLower);
      }).toList();
    } else {
      print(Exception());
      print('Exception');

      throw Exception();
    }
  }
}
// dsjh() {
    //   if (maintenancePhone1 == 'resultNull') {
    //     return [maintenancePhone];
    //   } else {
    //     return [maintenancePhone, maintenancePhone1];
    //   }
    // }



