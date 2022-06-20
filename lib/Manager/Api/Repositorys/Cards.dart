import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import '../../../exports/export_manager.dart';

final CardsApi cardsApi = new CardsApi();

class CardsApi {
  getCards(BuildContext context) async {
    var baseURL = Uri.parse('${URI.Uri}/csv/60933b2dbc58793b9c910991');
    print(baseURL);
    try {
      final provider = Provider.of<UtilsUserProvider>(context, listen: false);

      var response = await http.get(
        baseURL,
        headers: FuHeader.headerWithToken(provider.myToken.toString())
        //headers,
      );
      List list = jsonDecode(response.body);
      late final users = list.map((model) => Cards.fromJson(model)).toList();
      print(users.length);
      return users;
      // forEach((post) {
      //   username = post.username;
      // });
    } catch (e) {
      print("${e.toString()}هناك خطاء");
    }
    return null;
  }
}
