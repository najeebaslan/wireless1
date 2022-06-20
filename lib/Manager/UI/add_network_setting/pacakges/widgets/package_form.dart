import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../exports/export_manager.dart';

class FormPackageDetails extends StatelessWidget {
  final String nameField;
  final String hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Widget child;
  const FormPackageDetails({
    Key? key,
    required this.nameField,
    required this.hintText,
    this.controller,
    this.validator,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            ts(
              nameField,
             
              TextStyle(
                fontFamily: StyleWidget.fontName,
                fontWeight: FontWeight.w800,
                fontSize: 10.sp,
                letterSpacing: 0.0,
                color: Colors.grey.withOpacity(0.8),
              ),
            ),
          ],
        ),
        sizedBox(1.h),
        Row(
          children: [
            Expanded(
              child: MyTextFormField(
                  controller: controller,
                  textDirection: TextDirection.rtl,
                  input: InputDecoration(
                      hintTextDirection: TextDirection.rtl,
                      contentPadding: FuSpacing.only(left: 10, right: 10),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        borderSide:
                            BorderSide(color: kPrimaryColor, width: 1.5),
                      ),
                      errorStyle: const TextStyle(color: Colors.red),
                      hintText: hintText,
                      labelStyle: const TextStyle(
                        color: const Color(0xFF727072),
                        height: 1,
                        fontSize: 17,
                      ),
                      prefixStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 15.0,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      filled: true,
                      fillColor: Colors.white70),
                  number: TextInputType.number,
                  onChanged: () {},
                  validator: validator,
                  autovalidate: AutovalidateMode.disabled),
            ),
            SizedBox(
              width: 2.w,
            ),
            Container(
                height: 5.h,
                padding: EdgeInsets.only(left: 16, right: 16),
                decoration: BoxDecoration(
                  borderRadius: radius(16),
                  color: kPrimaryColor,
                ),
                child: child),
          ],
        ),
      ],
    );
  }
}
