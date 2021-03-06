import 'dart:io';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import '../../exports/export_manager.dart';

class ApiErrorHandler {
  static parseError(
    ex,
    BuildContext context,
  ) {
    if (ex is SocketException) {
      ErrorResponse.awesomeDialog(
        context: context,
         error: 'The server is not connected Make sure you are connected to the Internet π',
         dialogType:  DialogType.ERROR,

      );
      print('No Internet connection π');
    } else if (ex is HttpException) {
         ErrorResponse.awesomeDialog(
        context: context,
         error: "Couldn't find the post π±",
         dialogType:  DialogType.ERROR,

      );
      // ErrorResponse.awesomeDialog(
      //   "Couldn't find the post π±",
      //   context,
      //   DialogType.WARNING,
      // );
      print("Couldn't find the post najeebπ±");
    } else if (ex is FormatException) {
      
         ErrorResponse.awesomeDialog(
        context: context,
         error: "Bad response format π",
         dialogType:  DialogType.ERROR,

      );
      print("Bad response format π");
    } else {
        ErrorResponse.awesomeDialog(
        context: context,
         error:   ex.toString(),
         dialogType:  DialogType.ERROR,

      );
      
    }
    return;
  }
}
