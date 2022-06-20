import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../../exports/export_manager.dart';

class CheckHavePassword extends StatefulWidget {
  @override
  _CheckHavePasswordState createState() => _CheckHavePasswordState();
}

class _CheckHavePasswordState extends State<CheckHavePassword> {
  Color checkColor = StyleWidget.white;
  Color activeColor = kPrimaryColor;
  getPackages() async {
    await packageApi.getPackageCountByNetworkId(context).then((value) {
      context.read<PackageProvider>().getCountPackage(value);
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
      getPackages();
    });
  }

  @override
  Widget build(BuildContext context) {
    print('rebuild CheckHavePassword');

    return MyDirectionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Consumer<PackageProvider>(
            builder: (context, provider, child) => SingleChildScrollView(
                    child: Column(
                  children: [
                    sizedBox(5.h),
                    customAppBar(
                        'تفاصيل الباقات',
                        'اضف جميع تفاصيل الباقات الخاصة بشبكتك',
                        "assets/package_details.png",
                        14,
                        height: 60,
                        width: 60),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            5,
                          ),
                          color: Colors.white,
                          border: Border.all(color: Colors.grey, width: 1)),
                      padding: const EdgeInsets.all(1),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                child: AnimatedContainer(
                                  alignment: Alignment.center,
                                  duration: Duration(milliseconds: 300),
                                  child: CheckboxListTile(
                                    secondary: FuText.b2(
                                      'اسم مستخدم فقط',
                                    ),
                                    checkColor: checkColor,
                                    activeColor: activeColor,
                                    value: provider.value1,
                                    onChanged: (bool? value) {
                                      provider.changeValue1(value: value!);
                                    },
                                  ),
                                ),
                              ),
                              Expanded(
                                child: AnimatedContainer(
                                  alignment: Alignment.center,
                                  duration: Duration(milliseconds: 300),
                                  width: 300,
                                  child: CheckboxListTile(
                                    secondary: FuText.b2(
                                        'اسم مستخدم \ ' '\f وكلمة مرور'),
                                    checkColor: checkColor,
                                    activeColor: activeColor,
                                    value: provider.value0,
                                    onChanged: (bool? value) {
                                      provider.changeValue0(value: value!);
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Row(
                                children: <Widget>[
                                  Expanded(
                                      child: provider.hide
                                          ? AnimatedContainer(
                                              alignment: Alignment.center,
                                              duration:
                                                  Duration(milliseconds: 300),
                                              child: CheckboxListTile(
                                                secondary: FuText.b2(
                                                    'اسم مستخدم وكلمة\ '
                                                    '\f مرور متساوية'),
                                                checkColor: checkColor,
                                                activeColor: activeColor,
                                                value: provider.value2,
                                                onChanged: (bool? value) {
                                                  provider.changeValue2(
                                                      value: value!);
                                                },
                                              ),
                                            )
                                          : size(0.0, 0.0, null)),
                                  size(0.0, 1.0, null),
                                  Expanded(
                                      child: provider.hide
                                          ? AnimatedContainer(
                                              alignment: Alignment.center,
                                              duration:
                                                  Duration(milliseconds: 300),
                                              width: 100,
                                              child: CheckboxListTile(
                                                secondary: FuText.b2(
                                                    ' اسم مستخدم وكلمة\ '
                                                    '\f مرور مختلفة'),
                                                checkColor: checkColor,
                                                activeColor: activeColor,
                                                value: provider.value3,
                                                onChanged: (bool? value) {
                                                  provider.changeValue3(
                                                      value: value!);
                                                },
                                              ),
                                            )
                                          : size(0.0, 0.0, null)),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ).paddingAll(6),
                    sizedBox(5.h),
                    Text(
                      "يتوجب عليك تحديد نوع الإدخال للكروت التي سوف يتم رفعها على التطبيق و تتمثل في الاتي:\n"
                      "تحديد ما اذا كانت الكروت الخاصة بشبكتك تحتوي على اسم مستخدم فقط او اسم مستخدم وكلمة مرور\n"
                      "  اذا كانت الكروت الخاصة بشبكتك تحتوي على اسم مستخدم وكلمة مرور في هذه الحالة يجب عليك تحديد ما اذا كان اسم المستخدم وكلمة المرور متساويتان ام مختلفتان. ",
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Cairo',
                        color: FuAppTheme.isDarkMode
                            ? StyleWidget.white
                            : Colors.black,
                      ),
                    ),
                    sizedBox(5.h),
                    SizedBox(height: 15.h, child: ProcessTimelinePage()),
                    sizedBox(5.h),
                    MyRaisedButton(
                      text: 'التالي',
                      press: () async {
                        if (provider.value0 == false &&
                            provider.value1 == false &&
                            provider.value2 == false &&
                            provider.value3 == false) {
                          ErrorResponse.showToastWidget(
                              error: "يجب تحديد نوع الإدخال",
                              colorShowToast: FuAppTheme.theme.errorColor);
                        } else {
                          if (provider.value0 == true &&
                              provider.value2 == false &&
                              provider.value3 == false) {
                            ErrorResponse.showToastWidget(
                                error:
                                    "حدد ما إذا كانت اسم المستخدم وكلمة المرور متساويتان ام مختلفتان",
                                colorShowToast: FuAppTheme.theme.errorColor);
                          } else {
                            ErrorResponse.awesomeDialog(
                                error:
                                    ' ملحوضة :سيتم استخدام نوع بيانات الإدخال على جميع الباقات التي سيتم إضافتها. ',
                                context: context,
                                dialogType: DialogType.INFO,
                                btnCancelOnPress: () {},
                                btnCancel: 'الغاء',
                                btnOkOnPress: () {
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    SlideTransition1(PackagesScareen()),
                                    (Route<dynamic> route) => false,
                                  );
                                });
                          }
                        }
                      },
                    )
                  ],
                ))).paddingAll(8),
      ),
    );
  }
}
