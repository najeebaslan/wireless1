import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../../exports/export_manager.dart';

class PackagesScareen extends StatefulWidget {
  const PackagesScareen({Key? key}) : super(key: key);

  @override
  _PackagesScareenState createState() => _PackagesScareenState();
}

class _PackagesScareenState extends State<PackagesScareen> {
  String? _value1 = 'ساعة';
  String? _value2 = 'ميجا';
  String? _value3 = 'ساعة';
  String? _value4 = 'ريال';

  // dynamic name;

  final TextEditingController _time = TextEditingController();

  final TextEditingController _validity = TextEditingController();

  final TextEditingController _data = TextEditingController();

  final TextEditingController _packagePrice = TextEditingController();

  bool showSecondWidget = false;

  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    log('rebuild CheckHavePassword');
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
      getPackages();
    });

    _pageController = PageController();
  }

  getPackages() async {
    await packageApi.getPackageCountByNetworkId(context).then((value) {
      log(value.toString() + 'count packages');
      context.read<PackageProvider>().getCountPackage(value);
    });
  }

  @override
  void dispose() {
    _packagePrice.dispose();
    _data.dispose();
    _time.dispose();
    _validity.dispose();
    _pageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('rebuild PackagesScareen');

    return MyDirectionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: Consumer<PackageProvider>(
            builder: (context, value, child) => SingleChildScrollView(
                child: Column(
              children: [
                sizedBox(5.5.h),
                customAppBar(
                    'تفاصيل الباقات',
                    'اضف جميع تفاصيل الباقات الخاصة بشبكتك',
                    "assets/package_details.png",
                    14,
                    height: 60,
                    width: 60),
                // AnimatedContainer(
                //   duration: Duration(milliseconds: 900),
                //   curve: Curves.easeIn,
                //   width: showSecondWidget ? context.width : context.width,
                //   height: showSecondWidget
                //       ? context.height / 2 - 40
                //       : context.height / 2 - 20,
                //   child: showSecondWidget
                //       ? Column(children: [
                //           pricePackage(),
                //           timePackage(),
                //           dataPackage(),
                //           validityPackage(),
                //         ])
                //       : Container(
                //           decoration: BoxDecoration(
                //             borderRadius: borderRadius,
                //             color: Colors.red,
                //           ),
                //           child: Text('aljkahsdahsldh'),
                //           height: 30.h,
                //         ),
                // ),
                AnimatedCrossFade(
                  firstChild: Column(children: [
                    pricePackage(),
                    timePackage(),
                    dataPackage(),
                    validityPackage(),
                  ]),
                  crossFadeState: showSecondWidget
                      ? CrossFadeState.showSecond
                      : CrossFadeState.showFirst,
                  duration: Duration(milliseconds: 900),
                  secondChild: AnimatedContainer(
                      color: Colors.blue,
                      height: context.height / 2 - 40,
                      duration: Duration(milliseconds: 900),
                      child: ThirdScreenState()),
                  // Container(
                  //   child: Text('aljkahsdahsldh'),
                  //   color: Colors.red,
                  //   height: 30.h,),
                  //
                  //           AnimatedContainer(
                  //   duration: Duration(milliseconds: 300),
                  //   curve: Curves.easeIn,
                  //   width: showSecondWidget ? 50 : 200,
                  //   height: 50,
                  //   child: showSecondWidget ? buildShrinked() : buildStretched(),
                  // ),
                  //  Container(
                  //   child: Text('aljkahsdahsldh'),
                  //   color: Colors.red,
                  //   height: 30.h,
                  // ),
                ),
                sizedBox(6.h),
                SizedBox(height: 15.h, child: ProcessTimelinePage()),
                sizedBox(3.8.h),
                MyRaisedButton(
                  text: value.countPackages != null && value.countPackages! <= 0
                      ? 'التالي'
                      : 'حفظ',
                  press: () async {
                    if (value.value0 == false &&
                        value.value1 == false &&
                        value.value2 == false &&
                        value.value3 == false) {
                      ErrorResponse.showToastWidget(
                          error: "يجب تحديد نوع الإدخال",
                          colorShowToast: FuAppTheme.theme.errorColor);
                    } else {
                      if (value.value0 == true &&
                          value.value2 == false &&
                          value.value3 == false) {
                        ErrorResponse.showToastWidget(
                            error:
                                "حدد ما إذا كانت اسم المستخدم وكلمة المرور متساويتان ام مختلفتان",
                            colorShowToast: FuAppTheme.theme.errorColor);
                      } else {
                        // --- send data to database --- //
                        await submet(value);
                      }
                    }
                  },
                ),
              ],
            ).paddingAll(8)),
          ),
        ));
  }

//--- This is Price Package field ------//
  Widget pricePackage() {
    return FormPackageDetails(
      nameField: 'سعر الباقة',
      hintText: 'السعر',
      controller: _packagePrice,
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: _value4,
          dropdownColor: kPrimaryColor,
          icon: Icon(Icons.keyboard_arrow_down, color: Colors.white),
          items: <String>[
            'ريال',
          ].map((String value) {
            return new DropdownMenuItem<String>(
              value: value,
              child: Text(value, style: TextStyle(color: Colors.white)),
            );
          }).toList(),
          onChanged: (salutation) => setState(() => _value4 = salutation!),
        ),
      ),
      validator: null,
    );
  }

//--- This is Time Package field ------//
  Widget timePackage() {
    return FormPackageDetails(
      nameField: 'وقت الباقة',
      hintText: 'الوقت',
      controller: _time,
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: _value1,
          dropdownColor: kPrimaryColor,
          icon: Icon(Icons.keyboard_arrow_down, color: Colors.white),
          items: <String>['ساعة', 'يوم'].map((String value) {
            return new DropdownMenuItem<String>(
              value: value,
              child: Text(value, style: TextStyle(color: Colors.white)),
            );
          }).toList(),
          onChanged: (salutation) => setState(() => _value1 = salutation!),
        ),
      ),
      validator: null,
    );
  }

//--- This is Data Package field ------//
  Widget dataPackage() {
    return FormPackageDetails(
      nameField: 'بيانات الباقة',
      hintText: 'البيانات',
      controller: _data,
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: _value2,
          dropdownColor: kPrimaryColor,
          icon: Icon(Icons.keyboard_arrow_down, color: Colors.white),
          items: <String>['جيجا', 'ميجا'].map((String value) {
            return new DropdownMenuItem<String>(
              value: value,
              child: Text(value, style: TextStyle(color: Colors.white)),
            );
          }).toList(),
          onChanged: (salutation) => setState(() => _value2 = salutation!),
        ),
      ),
      validator: null,
    );
  }

//--- This is Validity Package field ------//
  Widget validityPackage() {
    return FormPackageDetails(
      nameField: 'صلاحية الباقة',
      hintText: 'الصلاحية',
      controller: _validity,
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: _value3,
          dropdownColor: kPrimaryColor,
          icon: Icon(Icons.keyboard_arrow_down, color: Colors.white),
          items: <String>['يوم', 'ساعة'].map((String value) {
            return new DropdownMenuItem<String>(
              value: value,
              child: Text(value, style: TextStyle(color: Colors.white)),
            );
          }).toList(),
          onChanged: (salutation) => setState(() => _value3 = salutation!),
        ),
      ),
      validator: null,
    );
  }

// --- send data to database --- //
  submet(PackageProvider value) async {
    const Color errorColor = Colors.red;
    String? price = ErrorResponse.autovaldation(
        val: _packagePrice.text,
        error: 'يجب ادخال  سعر الباقة',
        lengthMin: 'الرجاء إدخال 2 ارقام با الأقل',
        lengthMax: 'الرجاء إدخال 9 ارقام با الاكثر',
        intMain: 2,
        intMax: 44,
        contoller: _packagePrice,
        err: 'يجب الإدخال با الارقام فقط',
        reges: '^[0-9]',
        renges: true);

    String? time = ErrorResponse.autovaldation(
        val: _time.text,
        error: 'يجب ادخال  وقت الباقة',
        lengthMin: 'الرجاء إدخال 1 ارقام با الأقل',
        lengthMax: 'الرجاء إدخال 9 ارقام با الاكثر',
        intMain: 1,
        intMax: 44,
        contoller: _time,
        err: 'يجب الإدخال با الارقام فقط',
        reges: '^[0-9]',
        renges: true);
    String? data = ErrorResponse.autovaldation(
        val: _data.text,
        error: 'يجب ادخال  البيانات الباقة',
        lengthMin: 'الرجاء إدخال 3 ارقام با الأقل',
        lengthMax: 'الرجاء إدخال 9 ارقام با الاكثر',
        intMain: 3,
        intMax: 44,
        contoller: _data,
        err: 'يجب الإدخال با الارقام فقط',
        reges: '^[0-9]',
        renges: true);

    String? validity = ErrorResponse.autovaldation(
        val: _validity.text,
        error: 'يجب ادخال صلاحية الباقة',
        lengthMin: 'الرجاء إدخال 1 ارقام با الأقل',
        lengthMax: 'الرجاء إدخال 9 ارقام با الاكثر',
        intMain: 1,
        intMax: 44,
        contoller: _validity,
        err: 'يجب الإدخال با الارقام فقط',
        reges: '^[0-9]',
        renges: true);
    if (price != null) {
      return await ErrorResponse.showToastWidget(
          error: price, colorShowToast: errorColor);
    } else if (time != null) {
      return await ErrorResponse.showToastWidget(
          error: time, colorShowToast: errorColor);
    } else if (data != null) {
      return await ErrorResponse.showToastWidget(
          error: data, colorShowToast: errorColor);
    } else if (validity != null) {
      return await ErrorResponse.showToastWidget(
          error: validity, colorShowToast: errorColor);
    }

    MyDialog.submitDialog(context);
    bool have_Password = true;
    /* check if package cards not Equal username And password*/
    bool equalUAP = false;
    // --- If he only has a username --- //
    if (value.value1 == true && value.value0 == false) {
      have_Password = true;
      equalUAP = false;
    }
    if (value.value0 == true) {
      // --- If he has a different username and password --- //
      if (value.value2 == true) {
        have_Password = false;
        equalUAP = true;
      }
      // --- If he has the same username and password --- //
      if (value.value3 == true) {
        have_Password = false;
        equalUAP = false;
      }
    }

    await packageApi
        .postDetailsPackage(
            package_Price: _packagePrice.text.toString(),
            package_Data: _data.text.toString(),
            package_Time: _time.text.toString(),
            package_Validity: _validity.text.toString(),
            have_Password: have_Password,
            details_Time: _value1.toString(),
            details_Validity: _value3.toString(),
            details_Data: _value2.toString(),
            equalUAP: equalUAP,
            context: context)
        .then((value) async {
      //this is for clear data frok text field
      _packagePrice.clear();
      _data.clear();
      _time.clear();
      _validity.clear();
      //This is for close keyboard
      FocusManager.instance.primaryFocus?.unfocus();

      await Future.delayed(Duration(milliseconds: 440));
      setState(() {
        showSecondWidget = !showSecondWidget;
      });
      getPackages();
    });
  }
}
