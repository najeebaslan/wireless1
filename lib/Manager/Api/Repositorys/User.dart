import 'dart:developer';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import '../../../exports/export_manager.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'dart:async';
import 'dart:convert';

UserApi userApi = UserApi();
enum StatusDataApi { Loaded, Init, Error }
StatusDataApi state = StatusDataApi.Init;

class UserApi {
  static Future<User?> register(
    String username,
    String email,
    String password,
    String phone,
    BuildContext context,
  ) async {
    try {
      var data = json.encode({
        "username": username,
        "email": email,
        "password": password,
        "phone": phone,
        "language": "English",
        "lat": "1322123",
        "lon": "97395345",
        "level": "1",
        "status": "sd",
        "temperature": "23",
        "capacity": "eed",
        "ip_Address": "192.168.1.20",
        "gateway": "sdfsdf",
        "interface": "sdfsdf",
        "dbm": "sdfsdf",
        "Apps": [
          {"Apps_Name": "FaceBook", "version": "12", "installing_Date": "daas"}
        ],
        "ram": "4",
        "system_Storage": "120",
        "external_Storage": "20",
        "devices_Name": "samsong",
        "model": "30",
        "Manufacturer": "fwewe",
        "Device_Id": "sdfsdffsdf",
        "mac_Address": "12:Ac:23:Sd:ds:SS",
        "releasedBase": "asdasd"
      });

      Response response = await http.post(Uri.parse(URI.REGISTER_URI),
          headers:FuHeader.headerWithoutToken(), body: data);

      if (response.statusCode == URI.StatusCode) {
        String? myToken = response.headers['authorization'];
       String accessToken = myToken!.split('Bearer ')[1];
        await FuSharedPreferences.setString(HEADERS.KAY_TOkEN, accessToken);
        final data = jsonDecode(response.body);
        final userData = json.encode({
          '_id': data['_id'],
          'email': data['email'],
          'username': data['username'],
          'numberAccount': data['numberAccount'],
        });
        await FuSharedPreferences.setString(HEADERS.USER_DATA, userData);
        Navigator.pop(context);
        Navigator.push(context, SlideTransition1(SecondSignUp()));
        print(response.reasonPhrase);
        print('تم ارسال  بيانات المستخدم بنجاح');
        return null;
      } else {
        Navigator.pop(context);
        ErrorResponse.awesomeDialog(
          error:  ErrorResponse.errorRes(response),context: context,dialogType: DialogType.ERROR);
      }
    } catch (ex) {
      Navigator.pop(context);
      ApiErrorHandler.parseError(
        ex,
        context,
      );
      print("===>:هنالك خطاء ${ex.toString()} ");
    }
    return null;
  }

  static postDetailsUser(
    String userType,
    String governorate,
    String city,
    String village,
    String sex,
    int age,
    BuildContext context,
  ) async {
    if (sex == 'ذكر') {
      sex = 'Male';
    } else if (sex == 'انثى') {
      sex = 'Female';
    } else if (sex == 'مخصص') {
      sex = 'Custom';
    }
    try {
      late final providerToken =
          Provider.of<UtilsUserProvider>(context, listen: false);
      var valueData = providerToken.userProfile;
      var _userId = valueData['_id'];
      var data = json.encode({
        "userId": _userId,
        "user_Type": userType,
        "sex": sex,
        "cityName": city,
        "streetName": village,
        "governorateId": governorate,
        "age": age,
        
      });
      await FuSharedPreferences.setString('level','1');
      Response response = await http.post(Uri.parse(URI.DETAILS_USER),
          headers:FuHeader.headerWithToken(providerToken.myToken!), body: data);

      if (response.statusCode == URI.StatusCode) {
        final data = jsonDecode(response.body);
        await FuSharedPreferences.setString(HEADERS.USER_TYPE, data['user_Type']);
        Navigator.pop(context);
        Navigator.push(context, SlideTransition1(NetworkDetails()));
        print(response.reasonPhrase);
        print('تم ارسال  تفاصيل المستخدم بنجاح');

        return response;
      } else {
        log(response.body.toString());
        Navigator.pop(context);
        ErrorResponse.awesomeDialog(
           error: ErrorResponse.errorRes(response), context:context,dialogType :DialogType.ERROR);
      }
    } catch (ex) {
      Navigator.pop(context);
      ApiErrorHandler.parseError(
        ex,
        context,
      );
      print("===>:هنالك خطاء ${ex.toString()} ");
    }
  }

  static login(
    String email,
    String password,
    BuildContext context,
  ) async {
    try {
      var data = json.encode({
        "email": email,
        "password": password,
        //  "language": "English",
        // "lat": "1322123",
        // "lon": "97395345",
        "level": "1",
        "status": "sd",
        "temperature": "23",
        "capacity": "eed",
        "ip_Address": "192.168.1.20",
        "gateway": "sdfsdf",
        "interface": "sdfsdf",
        "dbm": "sdfsdf",
        "Apps": [
          {"Apps_Name": "FaceBook", "version": "12", "installing_Date": "daas"}
        ],
        "ram": "4",
        "system_Storage": "120",
        "external_Storage": "20",
        "devices_Name": "samsong",
        "model": "30",
        "Manufacturer": "fwewe",
        "Device_Id": "sdfsdffsdf",
        "mac_Address": "12:Ac:23:Sd:ds:SS",
        "releasedBase": "asdasd"
      });

      Response response = await http.post(Uri.parse(URI.LOGIN),
          headers: FuHeader.headerWithoutToken(), body: data);
      if (response.statusCode == URI.StatusCode) {
        final data = jsonDecode(response.body);
        print(data['token'].toString());
        await FuSharedPreferences.setString(HEADERS.KAY_TOkEN, data['token']);
        var theResult = data['userProfile'];
        final userData = json.encode({
          '_id': theResult['_id'],
          'email': theResult['email'],
          'username': theResult['username'],
          'numberAccount': theResult['numberAccount'],
          'network': theResult['network'],
        });

        await FuSharedPreferences.setString(HEADERS.USER_DATA, userData);
        await FuSharedPreferences.setString(
            HEADERS.USER_TYPE, theResult['userType']);
        if (theResult['userType'] == 'userType1') {
          Navigator.pop(context);
          Navigator.push(context, SlideTransition1(MainScreenClient()));
          print(response.reasonPhrase);
          print('تم تسجيل االدخول بنجاح');
        } else if (theResult['userType'] == 'userType2') {
          Navigator.pop(context);
          Navigator.push(context, SlideTransition1(DrawerWithAppBar()));
        }
        return null;
      } else {
        Navigator.pop(context);
        ErrorResponse.awesomeDialog(
           error: ErrorResponse.errorRes(response),context: context,dialogType: DialogType.ERROR);
      }
    } catch (ex) {
      Navigator.pop(context);
      ApiErrorHandler.parseError(
        ex,
        context,
      );
      print("===>:هنالك خطاء ${ex.toString()} ");
    }
    return null;
  }

  //  Future<List<Profile>?> getProfile(BuildContext context) async {
  //   try {
  //     List<Profile> profile = [];
  //     http.Response response = await http.get(
  //       Uri.parse(URI.PROFILE_URI),
  //       headers: HEADERS.postHeaders(
  //           'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MGQwYjYyMzhjNjU0MTJiNjAyNDM0MWYiLCJpc0FkbWluIjpmYWxzZSwiaWF0IjoxNjI0MjkwODUxfQ.dwcXwjUbq4b1s4okS9-h3cm080aK3uVNCKlSuCcdSZk'),
  //     );
  //     if (response.statusCode == URI.StatusCode) {
  //       List list = json.decode(response.body);
  //       print(list);
  //       profile = list.map((model) => Profile.fromJson(model)).toList();
  //       // Navigator.pop(context);
  //       // Navigator.push(
  //       //   context,
  //       //   MaterialPageRoute(
  //       //     builder: (context) => FirstScreen(),
  //         // ),
  //       // );
  //       return profile;
  //     } else {
  //       var massages = jsonDecode(response.body);
  //       String error = massages['Error'];
  //       return ApiErrorHandler.errorElse(error, context);
  //     }
  //   } catch (e) {
  //     print('object');
  //     ApiErrorHandler.parseError(  e, context,);
  //     print("$e هنالك خطاء");
  //   }
  //   return null;
  // }
}

// Map<String, String> headers(Token) => {
//   "Content-type": "application/json",
//   "Accept": "application/json"
//       "Access-Control-Allow-Origin: *",
//   HttpHeaders.authorizationHeader: "Bearer $Token"
// };

//  headers(String Token, ) {
//     return {
//     "Content-type": "application/json",
//   "Accept": "application/json"
//       "Access-Control-Allow-Origin: *",
//   HttpHeaders.authorizationHeader: "Bearer $Token"
//     };
//   }
// Map<String, String> postHeaders(Token)  =>{
//   "Content-type": "application/json",
//   'Authorization':'Bearer $Token'
// };
