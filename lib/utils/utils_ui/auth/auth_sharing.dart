import 'package:flutter/material.dart';
import 'package:wirless_wifi/exports/export_manager.dart';

class AuthSharing {
  static InputBorder inputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(25.0)),
    borderSide: BorderSide(color: kPrimaryColor, width: 1.5),
  );

  static InputDecoration inputDecoration(
      String labelText,
      var icon,
      var icons,
      String prefixText,
      String hintText,
      double double,
      EdgeInsetsGeometry edge) {
    return InputDecoration(
        contentPadding: edge,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(double)),
          borderSide: BorderSide(color: kPrimaryColor, width: 1.5),
        ),
        errorStyle: const TextStyle(color: Colors.red),
        prefixIcon: icons,
        hintText: hintText,
        labelText: labelText,
        labelStyle: const TextStyle(
          color: const Color(0xFF727072),
          height: 1,
          fontSize: 17,
        ),
        prefixText: prefixText,
        suffixIcon: icon,
        prefixStyle: const TextStyle(
          color: Colors.black,
          fontSize: 15.0,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(double),
        ),
        filled: true,
        fillColor: Colors.white70);
  }
}

class MyTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final InputDecoration? input;
  final TextInputType? number;
  final Function? onChanged;
  final String? Function(String?)? validator;
  final AutovalidateMode autovalidate;
  TextDirection? textDirection;
  MyTextFormField(
      {Key? key,
      required this.controller,
      required this.input,
      required this.number,
      required this.onChanged,
      required this.validator,
      required this.autovalidate,
      this.textDirection})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        keyboardType: number,
        controller: controller,
        textDirection: textDirection ?? TextDirection.ltr,
        cursorColor: kPrimaryColor,
        autovalidateMode: autovalidate,
        decoration: input,
        onChanged: (String value) {
          onChanged!();
        },
        expands: false,
        onSaved: (value) => value = value,
        validator: validator);
  }
}

class UtilsTextFieldPublic extends StatelessWidget {
  final Widget child;
  const UtilsTextFieldPublic({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: 4.0, right: 4.0, top: 6.0, bottom: 8.0),
            child: Row(
              children: [
                Container(
                  child: Expanded(
                    child: SizedBox(
                      child: child,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

passwordFormField(
  final TextEditingController controller,
  final String labelText,
  final Icon icon,
  final dynamic visibility,
  final TextInputType number,
  final bool obscureText,
  final String? Function(String?)? validator,
) {
  return TextFormField(
      obscureText: obscureText,
      cursorColor: kPrimaryColor,
      keyboardType: number,
      controller: controller,
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            borderSide: BorderSide(color: kPrimaryColor, width: 1.5),
          ),
          suffixIcon: visibility,
          contentPadding: EdgeInsets.all(5.0),
          errorStyle: const TextStyle(color: Colors.red),
          // focusedBorder: AuthSharing.inputBorder,
          prefixIcon: icon,
          labelText: labelText,
          labelStyle: const TextStyle(
            color: const Color(0xFF727072),
            height: 1,
            fontSize: 17,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          filled: true,
          fillColor: Colors.white70),
      onChanged: (String value) {},
      expands: false,
      onSaved: (value) => value = value,
      validator: validator);
}
