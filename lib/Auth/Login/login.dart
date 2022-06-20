import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../exports/export_manager.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  AuthSharing authSharing = AuthSharing();
  @override
  Widget build(BuildContext context) {
    print('rebild login');
    Size size = MediaQuery.of(context).size;
    return MyDirectionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Background(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Form(
                key: _formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ts(
                      "تسجيل الدخول",
                      const TextStyle(
                          fontWeight: FontWeight.bold, color: StyleWidget.grey),
                    ),
                    sizedBox(size.height * 0.03),
                    SvgPicture.asset(
                      "assets/icons/login.svg",
                      height: size.height * 0.35,
                    ),
                    SizedBox(height: size.height * 0.03),
                    UtilsTextFieldPublic(
                      child: Consumer<ProviderNetworkDetails>(
                        builder: (context, provider, child) => MyTextFormField(
                            autovalidate: provider.autoTextfieldEmile,
                            controller: _email,
                            input: AuthSharing.inputDecoration(
                              " ادخل  الايميل ",
                              null,
                              const Icon(Icons.person),
                              '',
                              ' ',
                              5.0,
                              const EdgeInsets.all(5.0),
                            ),
                            number: TextInputType.emailAddress,
                            onChanged: () {
                              return provider.autovaliditionEmile(_email,
                                  "[\u0600-\u06ff]|[\u0750-\u077f]|[\ufb50-\ufc3f]|[\ufe70-\ufefc]");
                            },
                            validator: (String? val) =>
                                ErrorResponse.valdationTextField(
                                    val,
                                    "يجب ادخال اسم المستخدم",
                                    'الرجاء إدخال 6 احرف با الأقل',
                                    'الرجاء إدخال 255 حرف با الاكثر',
                                    6,
                                    255)),
                      ),
                    ),
                    UtilsTextFieldPublic(
                      child: MyConsumerAuthProvider(
                        builder: (context, value, child) => passwordFormField(
                          _password,
                          " ادخل  كلمة المرور",
                          const Icon(Icons.lock),
                          IconButton(
                            icon: Icon(
                              value.obscureText!
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: value.obscureText!
                                  ? null
                                  : const Color(0xFFA3A3A3),
                            ),
                            onPressed: () {
                              value.showAndHidePassword();
                            },
                          ),
                          TextInputType.visiblePassword,
                          value.obscureText!,
                          (String? val) => ErrorResponse.valdationTextField(
                              val,
                              "يجب ادخال كلمة المرور",
                              'الرجاء إدخال 8 احرف با الأقل',
                              'الرجاء إدخال 1024 حرف با الاكثر',
                              6,
                              1024),
                        ),
                      ),
                    ),
                    MyRaisedButton(
                      text: "تسجيل دخول",
                      press: () {
                        submit();
                      },
                    ),
                    SizedBox(height: size.height * 0.03),
                    AlreadyHaveAnAccountCheck(
                      press: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Scaffold(
                                    body: SignUpScreen(),
                                  )),
                          (Route<dynamic> route) => false,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  submit() async {
    final isValid = _formkey.currentState!.validate();
    if (isValid) {
      _formkey.currentState!.save();
      MyDialog.submitDialog(context);
      await context
          .read<AuthProvider>()
          .login(_email.text, _password.text, context);
    }
  }
}
