import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import '../../../Client/Api/Models_Client/Network.dart';
import '../../../exports/export_manager.dart';

final NetworkClientApi networkClientApi = new NetworkClientApi();

class NetworkClientApi {
  Future<List<Network>?> getAllNetwork(BuildContext context) async {
    
    var baseURL = Uri.parse('${URI.Uri}/network');
    try {
      List<Network> networkClient = [];
       final provider = Provider.of<UtilsUserProvider>(context, listen: false);

      var response = await http.get(
        baseURL,
        headers:FuHeader.headerWithToken(provider.myToken.toString())
        
        // headers,
      );
      List list = jsonDecode(response.body);
      networkClient = list.map((model) => Network.fromJson(model)).toList();
      print(networkClient.length);
      print('تم الحصول علا البيانات بنجاح');
      
      return networkClient;
    } catch (e) {
      print("$e هنالك خطاء");
    }
    return null;
  }
}
