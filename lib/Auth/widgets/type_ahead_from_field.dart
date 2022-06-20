import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:flutter_utils_project/flutter_utils_project.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:wirless_wifi/exports/export_manager.dart';
import 'package:http/http.dart' as http;

///  [TypeAheadFormField]  for Governorate
class GovernorateField extends StatelessWidget {
// provider, _city, BuildContext context, _governorate, double d

  final TextEditingController governorate;
  final BuildContext context;
  final double d;
  final void Function(String)? onChanged;
  final void Function(LocationGovernorate?) onSuggestionSelected;
  const GovernorateField(
      {Key? key,
      required this.governorate,
      required this.context,
      required this.d,
      required this.onChanged,
      required this.onSuggestionSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          child: TypeAheadFormField<LocationGovernorate?>(
        hideSuggestionsOnKeyboardHide: false,
        textFieldConfiguration: TextFieldConfiguration(
          controller: governorate,
          onChanged: onChanged,
          decoration: AuthSharing.inputDecoration(
            ' اسم المحافظة',
            null,
            const Icon(Icons.add_location_alt_outlined),
            '',
            ' ',
            d,
            const EdgeInsets.all(5.0),
          ),
        ),
        noItemsFoundBuilder: (context) => Container(
          height: 50,
          child: Center(
              child: Text(
            'لم يتم العثور على المحافظة',
            textAlign: TextAlign.right,
            // '! لا توجد هذه المحافظة',
            style: TextStyle(fontSize: 10.sp),
          )),
        ),

        //

        suggestionsCallback: (
          String query,
        ) async {
          try {
            var myToken =
                await FuSharedPreferences.getString(HEADERS.KAY_TOkEN);
            final response = await http.get(Uri.parse(URI.GOVERNORATE),
                headers: FuHeader.headerWithToken(myToken));
            if (response.statusCode == URI.StatusCode) {
              final List location = json.decode(response.body);
              log(location.toString() + 'location');
              context.read<AuthProvider>().governorate(location);
              return location
                  .map((json) => LocationGovernorate.fromJson(json))
                  .where((user) {
                final nameLower = user.governorate!.toLowerCase();
                final queryLower = query.toLowerCase();
                return nameLower.contains(queryLower);
              }).toList();
            } else {
              ErrorResponse.awesomeDialog(
                error:  ErrorResponse.errorRes(response),context: context,dialogType: DialogType.ERROR);
            }
          } catch (err) {
            if (err is SocketException) {
              ErrorResponse.snackBarError(
                  "The server is not connected Make sure you are connected to the Internet 😑",
                  context,
                  StyleWidget.deepOrange);
              print('No Internet connection 😑');
            } else if (err is HttpException) {
              ErrorResponse.snackBarError("Couldn't find the post najeeb😱",
                  context, StyleWidget.deepOrange);
              print("Couldn't find the post najeeb😱");
            } else if (err is FormatException) {
              ErrorResponse.snackBarError(
                  'Bad response format 👎', context, StyleWidget.deepOrange);
              print("Bad response format 👎");
            } else {
              ErrorResponse.snackBarError(
                  err.toString(), context, StyleWidget.deepOrange);
              print("===>:هنالك خطاء ${err.toString()} ");
            }
          }

          return [];
        },
        itemBuilder: (context, LocationGovernorate? suggestion) {
          final user = suggestion!;

          return ListTile(title: text(user.governorate!.toString()));
        },
        onSuggestionSelected: onSuggestionSelected,

        validator: (String? val) => ErrorResponse.valdationTextField(
            val,
            'يجب ادخال اسم المحافضة',
            'الرجاء إدخال 3 احرف با الأقل',
            'الرجاء إدخال 15 حرف با الاكثر',
            3,
            15),
        onSaved: (value) => governorate.text = value!,
      )),
    );
  }
}

///  [TypeAheadFormField]  for City
class CityField extends StatelessWidget {
  final TextEditingController governorate;
  final TextEditingController city;
  final BuildContext context;
  final double d;
  final dynamic provider;

  const CityField({
    Key? key,
    required this.governorate,
    required this.context,
    required this.d,
    required this.provider,
    required this.city,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          child: InkWell(
        onTap: () {

          if (governorate.text.length <= 0) {
            ErrorResponse.snackBarError(
                'يجب تحديد المحافظة اولاً', context, StyleWidget.deepOrange);
          }
        },
        child: TypeAheadFormField<LocationCity?>(
          hideSuggestionsOnKeyboardHide: false,
          textFieldConfiguration: TextFieldConfiguration(
            enabled: provider.checkTextField,
            onChanged: (String? value) {
              provider.checkerTextFieldCity(city);
            },
            controller: city,
            decoration: AuthSharing.inputDecoration(
              ' اسم المدينة',
              null,
              Icon(
                Icons.add_location_alt_outlined,
                color:
                    provider.checkTextField ? kPrimaryColor : Colors.grey[500]!,
              ),
              '',
              ' ',
              d,
              const EdgeInsets.all(5.0),
            ),
          ),
          noItemsFoundBuilder: (context) => Container(
            height: 50,
            child: Center(
                child: Text(
              '! لم يتم العثور على المدينة يٌمكنك اضافتها يدوياً',
              textAlign: TextAlign.right,
              style: TextStyle(fontSize: 10.sp),
            ).paddingAll(2)),
          ),
          suggestionsCallback: (String? query) async {
            var id = context
                .read<AuthProvider>()
                .governorateLocation
                ?.where((element) => element['governorate'] == governorate.text)
                .toList();

            try {
              var myToken =
                  await FuSharedPreferences.getString(HEADERS.KAY_TOkEN);
              final response = await http.get(
                  Uri.parse('${URI.CITY}${id?[0]['_id']}'),
                  headers:FuHeader.headerWithToken(myToken));
              if (response.statusCode == URI.StatusCode) {
                final List location = json.decode(response.body);
                context.read<AuthProvider>().city(location);
                return location
                    .map((json) => LocationCity.fromJson(json))
                    .where((user) {
                  final nameLower = user.name!.toLowerCase();
                  final queryLower = query?.toLowerCase();
                  return nameLower.contains(queryLower!);
                }).toList();
              } else {
                ErrorResponse.awesomeDialog(
                  error:ErrorResponse.errorRes(response),
                  context:  context,dialogType: DialogType.ERROR);
              }
            } catch (err) {
              log('Error==> $err');
              // exception(context, err);
            }
            return [];
          },
          itemBuilder: (context, LocationCity? suggestion) {
            final user = suggestion!;
            return ListTile(title: text(user.name!));
          },
          onSuggestionSelected: (LocationCity? suggestion) {
            city.text = suggestion!.name!;
            provider.checkerTextFieldCity(city);
          },
          validator: (String? val) => ErrorResponse.valdationTextField(
              val,
              'يجب ادخال اسم المدينة',
              'الرجاء إدخال 3 احرف با الأقل',
              'الرجاء إدخال 15 حرف با الاكثر',
              3,
              15),
          onSaved: (value) => city.text = value!,
        ),
      )),
    );
  }
}

///  [TypeAheadFormField]  for Village
class VillageField extends StatelessWidget {
  final TextEditingController village;
  final TextEditingController governorate;
  final TextEditingController city;
  final BuildContext context;
  final double d;
  final dynamic provider;

  const VillageField({
    Key? key,
    required this.context,
    required this.d,
    required this.provider,
    required this.village,
    required this.governorate,
    required this.city,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: TypeAheadFormField<LocationCity?>(
        hideSuggestionsOnKeyboardHide: false,
        textFieldConfiguration: TextFieldConfiguration(
          controller: village,
          enabled: provider.checkTextFieldCity,
          decoration: AuthSharing.inputDecoration(
            ' اسم الشارع (القرية)',
            null,
            const Icon(
              Icons.add_location_alt_outlined,
            ),
            '',
            ' ',
            d,
            const EdgeInsets.all(5.0),
          ),
        ),
        noItemsFoundBuilder: (context) => Container(
          height: 50,
          child: Center(
              child: Text(
            '  لم يتم العثور على هذه الشارع يمكنك اضافة الشارع الخاص بك يدوياً',
            textAlign: TextAlign.right,
            style: TextStyle(fontSize: 10.sp),
          )),
        ),
        suggestionsCallback: (
          String query,
        ) async {
          var governorateId = context
              .read<AuthProvider>()
              .governorateLocation
              ?.where((element) => element['governorate'] == governorate.text)
              .toList();
          var cityId = context
              .read<AuthProvider>()
              .cityLocation
              ?.where((element) => element['name'] == city.text)
              .toList();
          try {
            log('${URI.STREET}${governorateId?[0]['_id']}&CityId=${cityId?[0]['_id']}');
            var myToken =
                await FuSharedPreferences.getString(HEADERS.KAY_TOkEN);
            final response = await http.get(
                Uri.parse(
                    '${URI.STREET}${governorateId?[0]['_id']}&CityId=${cityId?[0]['_id']}'),
                headers: FuHeader.headerWithToken(myToken));
            log(response.body.toString() + 'body');
            if (response.statusCode == URI.StatusCode) {
              final List location = json.decode(response.body);
              return location
                  .map((json) => LocationCity.fromJson(json))
                  .where((user) {
                final nameLower = user.name!.toLowerCase();
                final queryLower = query.toLowerCase();
                return nameLower.contains(queryLower);
              }).toList();
            } else {
              ErrorResponse.awesomeDialog(
                  error:ErrorResponse.errorRes(response),context: context,dialogType: DialogType.ERROR);
            }
          } catch (err) {
            log('Error==> $err');
            // exception(context, err);
          }

          return [];
        },
        itemBuilder: (context, LocationCity? suggestion) {
          final user = suggestion!;
          return ListTile(title: text(user.name.toString()));
        },
        onSuggestionSelected: (LocationCity? suggestion) {
          village.text = suggestion!.name.toString();
        },
        validator: (String? val) => ErrorResponse.valdationTextField(
            val,
            '(القرية) يجب ادخال اسم الشارع',
            'الرجاء إدخال 3 احرف با الأقل',
            'الرجاء إدخال 15 حرف با الاكثر',
            3,
            15),
        onSaved: (value) => village.text = value!,
      ),
    ).expand();
  }
}
