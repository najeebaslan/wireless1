import 'dart:developer';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter_utils_project/flutter_utils_project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:http/http.dart';
import '../../exports/export_manager.dart';
import '../widgets/type_ahead_from_field.dart';
import 'package:provider/provider.dart';

class SecondSignUp extends StatefulWidget {
  const SecondSignUp({Key? key}) : super(key: key);

  @override
  _SecondSignUpState createState() => _SecondSignUpState();
}

class _SecondSignUpState extends State<SecondSignUp> {
  final TextEditingController _governorate = TextEditingController();
  final TextEditingController _city = TextEditingController();
  final TextEditingController _village = TextEditingController();
  final TextEditingController _age = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late Response responses;
  String validSex = '';
  var _sex;
  List<String> sexType = [
    'ذكر',
    'انثى',
    'مخصص',
  ];
  @override
  void dispose() {
    _governorate.dispose();
    _city.dispose();
    _village.dispose();
    _age.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('renuild Widget');
    return MyDirectionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: MyPadding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  Image.asset(
                    'assets/icons8-wi-fi-logo.png',
                    height: 100,
                  ),
                  sizedBox(20),
                  ts(
                    "نوع الحساب",
                    const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      fontFamily: StyleWidget.fontName,
                      letterSpacing: 0.0,
                      color: StyleWidget.grey,
                    ),
                  ),
                  MyConsumerAuthProvider(
                    builder: (context, value, child) => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        row(1, 'عميل', value),
                        row(2, 'مالك الشبكة', value),
                        row(3, 'مهندس الشبكة', value),
                      ],
                    ),
                  ),
                  sizedBox(20),
                  divider(),
                  sizedBox(10),
                  ts(
                    "تفاصيل الموقع",
                    const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      fontFamily: StyleWidget.fontName,
                      letterSpacing: 0.0,
                      color: StyleWidget.grey,
                    ),
                  ),
                  sizedBox(15),
                  MyConsumerAuthProvider(
                    builder: (context, provider, child) => Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GovernorateField(
                            governorate: _governorate,
                            context: context,
                            d: 5.0,
                            onChanged: (value) {
                              provider.checkerTextField(_governorate);
                            },
                            onSuggestionSelected:
                                (LocationGovernorate? suggestion) {
                              _governorate.text =
                                  suggestion!.governorate.toString();
                              provider.checkerTextField(_governorate);
                            },
                          ),
                          18.width,
                          CityField(
                              governorate: _governorate,
                              context: context,
                              d: 5.0,
                              provider: provider,
                              city: _city),
                        ]),
                  ),
                  sizedBox(20),
                  MyConsumerAuthProvider(
                    builder: (context, value, child) => Row(
                      children: [
                        Visibility(
                          child: VillageField(
                            context: context,
                            d: 5.0,
                            provider: value,
                            village: _village,
                            city: _city,
                            governorate: _governorate,
                          ),
                          //  villageField(
                          //   value,
                          //   _village,
                          //   context,
                          //   5.0,
                          // ),
                          visible: value.checkTextFieldCity,
                        ),
                        18.width,
                        Expanded(child: SizedBox())
                      ],
                    ),
                  ),
                  sizedBox(10),
                  divider(),
                  sizedBox(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ts(
                        "العمر",
                        const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          fontFamily: StyleWidget.fontName,
                          letterSpacing: 0.0,
                          color: StyleWidget.grey,
                        ),
                      ),
                      ts(
                        "الجنس",
                        const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          fontFamily: StyleWidget.fontName,
                          letterSpacing: 0.0,
                          color: StyleWidget.grey,
                        ),
                      ),
                    ],
                  ),
                  sizedBox(5),
                  Row(
                    children: [
                      Expanded(
                        child: MyTextFormField(
                          controller: _age,
                          input: AuthSharing.inputDecoration(
                            "   العمر",
                            null,
                            const Icon(Icons.more_time_sharp),
                            '',
                            ' ',
                            5.0,
                            const EdgeInsets.all(5.0),
                          ),
                          number: TextInputType.number,
                          onChanged: () {},
                          validator: (val) => ErrorResponse.valdationTextField(
                              val,
                              "يجب ادخال العمر ",
                              'الرجاء إدخال 2 ارقام با الأقل',
                              'الرجاء إدخال 2 ارقام با الاكثر',
                              2,
                              2),
                          autovalidate: AutovalidateMode.disabled,
                        ),
                      ),
                      18.width,
                      Expanded(
                        child: Container(
                            width: 50,
                            decoration: BoxDecoration(
                              color: const Color(0xFF878888),
                              borderRadius: BorderRadius.circular(
                                5.0,
                              ),
                            ),
                            child: Container(
                                margin: EdgeInsets.all(1),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFFFFFFF),
                                  borderRadius: BorderRadius.circular(
                                    4.0,
                                  ),
                                ),
                                child: Container(
                                  child: MyPadding(
                                    padding: EdgeInsets.only(right: 11),
                                    child: MyConsumerAuthProvider(
                                      builder: (context, value, child) =>
                                          DropdownButton<String>(
                                        isExpanded: true,
                                        value: value.selectedIndexCategory,
                                        icon: const Icon(
                                          Icons.keyboard_arrow_down,
                                          color: Color(0xFF747171),
                                        ),
                                        underline: Container(
                                            color: StyleWidget.purple),
                                        onChanged: (String? newValue) {
                                          value.selectedCategory(newValue!);
                                          _sex = newValue;
                                          validSex = newValue;
                                        },
                                        items: sexType.map((category) {
                                          return DropdownMenuItem<String>(
                                            child: Container(
                                                margin: const EdgeInsets.only(
                                                  left: 25,
                                                ),
                                                child: ts(
                                                    category,
                                                    const TextStyle(
                                                      fontSize: 17,
                                                      color: Color(0xFF5F5E5E),
                                                    ))),
                                            value: category,
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ),
                                ))),
                      )
                    ],
                  ),
                  sizedBox(15),
                  sizedBox(100),
                  MyPadding(
                    padding: const EdgeInsets.only(left: 50, right: 50),
                    child: MyConsumerAuthProvider(
                      builder: (context, value, child) => MyRaisedButton(
                          text: 'التالي',
                          press: () async {
                            await submit(value);
                          }),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  submit(AuthProvider provider) async {
    final isValid = _formKey.currentState!.validate();
    var id = context
        .read<AuthProvider>()
        .governorateLocation
        ?.where((element) => element['governorate'] == _governorate.text)
        .toList();

    if (id!.isEmpty) {
      ErrorResponse.snackBarError('يبدو انه لم يتم العثور على المحافظة',
          context, Color(0xFFE9572B));
      return false;
    }
    if (isValid) {
      if (provider.userType == null) {
        ErrorResponse.snackBarError(
            'يجب تحديد نوع الحساب', context, Colors.deepOrange);
      } else if (validSex == '') {
        return ErrorResponse.snackBarError(
            'يجب تحديد الجنس ', context, StyleWidget.deepOrange);
      } else {
        _formKey.currentState!.save();
        var resultAge = convertStringToInt(_age, context, 'هناك خطاء في العمر');
        if (resultAge is int) {
          print(resultAge.toString());
          MyDialog.submitDialog(context);
          await provider.postDetailsUser(
              provider.userType.toString(),
              id.isNotEmpty ? id[0]['_id'] : '',
              _city.text,
              _village.text,
              _sex.toString(),
              resultAge,
              this.context);
        }
      }
    }
  }

  Widget row(Object value, String string, AuthProvider provider) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ts(
              string,
              const TextStyle(
                  color: StyleWidget.black,
                  fontFamily: StyleWidget.fontName,
                  fontSize: 13)),
          Expanded(
            child: Radio<Object>(
              value: value,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              onChanged: (v) {
                provider.controllerUserType(v);
                provider.checkTypeUser(v);
              },
              groupValue: provider.controllersUserType,
            ),
          ),
        ],
      ),
    );
  }
}

