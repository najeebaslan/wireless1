import 'dart:convert';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sizer/sizer.dart';
import '../../exports/export_manager.dart';

class ErrorResponse {
  static snackBarError(String error, BuildContext context, Color color) {
    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(
          backgroundColor: color,
          content: Text(
            error.toString(),
            textAlign: TextAlign.center,
            style: TextStyle(fontFamily: 'Cairo'),
          )));
  }

  static checkData(AsyncSnapshot snapshot, BuildContext context) {
    if (!snapshot.hasData) {
      return MySpinKitFadingGrid.progressIndicator();
    } else if (snapshot.data.length == 0) {
      var theme = Theme.of(context);
      return buildNoTasks(
        theme,
        'لا توجد بيانات',
      );
    }
  }

  static showToastWidget(
      {bool? isShowToast,
      Color? colorShowToast,
      Color? textColor,
      required String error}) async {
     Fluttertoast.showToast(
        msg: error,gravity: ToastGravity.CENTER,
        backgroundColor: colorShowToast ?? kPrimaryColor,
        textColor: textColor ?? StyleWidget.white);
  }

  static String? valdationTextField(
    val,
    error,
    lengthMin,
    lengthMax,
    intMain,
    intMax,
  ) {
    if (val != null && val.isEmpty) {
      return error.toString();
    } else if (val!.length < intMain) {
      return lengthMin.toString();
    } else if (val!.length > intMax) {
      return lengthMax.toString();
    }
    return null;
  }

  static String? autovaldation({required String val,required String error,required String lengthMin,required String lengthMax,required int intMain,
     required int intMax, required TextEditingController contoller,required String err, required String reges,
      bool? renges}) {
    bool validate(String value) {
      RegExp regex = new RegExp(reges);

      if (renges != null && renges == true) {
        return (regex.hasMatch(value)) ? false : true;
      } else {
        return (!regex.hasMatch(value)) ? false : true;
      }
    }

    if (contoller.text.startsWith(' ') || contoller.text.endsWith(' ')) {
      return 'يجب ان لا بداءالنص بفراغ';
    } else if (val != null && val.isEmpty) {
      return error.toString();
    } else if (val.length < intMain) {
      return lengthMin.toString();
    } else if (val.length > intMax) {
      return lengthMax.toString();
    }
    if (validate(contoller.text) == true) {
      return err.toString();
    } else {}
    return null;
  }

  static String? autovaldationEmail(val, error, lengthMin, lengthMax, intMain,
      intMax, TextEditingController contoller, err, String reges) {
    bool validate(String value) {
      RegExp regex = new RegExp(reges);
      return (!regex.hasMatch(value)) ? false : true;
    }

    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern.toString());
    if (validate(contoller.text) == true) {
      return err.toString();
    } else if (contoller.text.startsWith(' ') || contoller.text.endsWith(' ')) {
      return 'يجب ان لا بداءالنص بفراغ';
    } else if (val != null && val.isEmpty) {
      return error.toString();
    } else if (val!.length < intMain) {
      return lengthMin.toString();
    } else if (val!.length > intMax) {
      return lengthMax.toString();
    } else if (!regExp.hasMatch(val.toString())) {
      return 'البريد الإلكتروني غير صالح';
    }
    return null;
  }

  static String? autovaldationPhone(val, error, lengthMin, lengthMax, intMain,
      intMax, TextEditingController contoller, String reges) {
    RegExp regExp = new RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$');
    if (contoller.text.startsWith(' ') || contoller.text.endsWith(' ')) {
      return 'يجب ان لا بداءالنص بفراغ';
    } else if (val.trim() != null && val.trim().isEmpty) {
      return error.toString();
    } else if (!regExp.hasMatch(val.trim())) {
      return ' رقم الهاتف غير صالح';
    } else if (val.trim()!.length < intMain) {
      return lengthMin.toString();
    } else if (val.trim()!.length > intMax) {
      return lengthMax.toString();
    }
    return null;
  }

  //this OPP Dialog
  static awesomeDialog({
    required error,
    required BuildContext context,
    DialogType? dialogType,
    Color? color,
    String? btnCancel,
    String? description,
    String? btnOkText,
    Function()? btnOkOnPress,
    Function()? btnCancelOnPress,
    bool? dismissOnBackKeyPress,
  }) {
    return AwesomeDialog(
      context: context,
      dialogType: dialogType ?? DialogType.ERROR,
      animType: AnimType.SCALE,
      dismissOnBackKeyPress: dismissOnBackKeyPress ?? true,
      headerAnimationLoop: false,
      title: error.toString(),
      btnOkText: btnOkText ?? 'موافق',
      btnOkOnPress: btnOkOnPress ?? () {},
      btnCancelOnPress: btnCancelOnPress,
      // padding: EdgeInsets.only(
      //     right: color == Colors.red ? 20 : 0,
      //     left: color == Colors.red ? 20 : 0),
      btnCancelColor: btnOkOnPress != null ? Colors.grey : null,
      btnCancelText: btnCancel,
      desc: description,
      buttonsTextStyle: TextStyle(
          fontFamily: 'Cairo',
          fontSize: 14.sp,
          overflow: TextOverflow.ellipsis,
          fontWeight: FontWeight.w700),
      btnOkColor: color ?? Colors.green,
    ).show();
  }
  // static awesomeDialog(error, context, DialogType dialogType) {
  //   AwesomeDialog(
  //     context: context,
  //     dialogType: dialogType,
  //     animType: AnimType.SCALE,
  //     headerAnimationLoop: false,
  //     title: error.toString(),
  //     btnOkOnPress: () {
  //       // Navigator.pop(context);
  //     },
  //     btnOkColor: Colors.red,
  //   )..show();
  // }

  static errorRes(response) {
    var massages = json.decode(response.body);
    return massages['Error'];
  }
}
