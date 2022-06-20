import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../exports/export_manager.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _email = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();

  final _formkey = GlobalKey<FormState>();
  @override
  void dispose() {
    super.dispose();
    _email.dispose();
    _phone.dispose();
    _password.dispose();
    _username.dispose();
  }

  late AutovalidateMode validate = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    print('rebulded Screen SignUp');
    final size = MediaQuery.of(context).size;
    return MyDirectionality(
      textDirection: TextDirection.rtl,
      child: Container(
        width: double.infinity,
        height: size.height,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              top: 0,
              right: 0,
              child: Image.asset("assets/images/top1.png", width: size.width),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Image.asset("assets/images/top2.png", width: size.width),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child:
                  Image.asset("assets/images/bottom2.png", width: size.width),
            ),
            Form(
              key: _formkey,
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ts(
                          " إنشاء حساب جديد",
                          const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: StyleWidget.grey)),
                      SvgPicture.asset(
                        "assets/icons/signup.svg",
                        height: size.height * 0.25,
                      ),
                      UtilsTextFieldPublic(
                        child: MyTextFormField(
                          controller: _username,
                          input: AuthSharing.inputDecoration(
                            " ادخل  الاسم المستخدم",
                            null,
                            const Icon(Icons.person),
                            '',
                            ' ',
                            5.0,
                            const EdgeInsets.all(5.0),
                          ),
                          number: TextInputType.text,
                          onChanged: () {
                            validate = AutovalidateMode.always;
                          },
                          validator: (String? val) =>
                              ErrorResponse.valdationTextField(
                                  val,
                                  "يجب ادخل  الاسم المستخدم",
                                  'الرجاء إدخال 3 احرف با الأقل',
                                  'الرجاء إدخال 35 حرف با الاكثر',
                                  3,
                                  35),
                          autovalidate: validate,
                        ),
                      ),
                      UtilsTextFieldPublic(
                        child: Consumer<ProviderNetworkDetails>(
                          builder: (context, provider, child) =>
                              MyTextFormField(
                                  autovalidate: provider.autoTextfieldEmile,
                                  controller: _email,
                                  input: AuthSharing.inputDecoration(
                                    " ادخل الايميل",
                                    null,
                                    const Icon(Icons.email),
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
                                      ErrorResponse.autovaldationEmail(
                                          val,
                                          "يجب ادخال الايميل ",
                                          'الرجاء إدخال 6 احرف با الأقل',
                                          'الرجاء إدخال 255 حرف با الاكثر',
                                          6,
                                          255,
                                          _email,
                                          'يجب الإدخال الايميل باللغة الانجليزية',
                                          "[\u0600-\u06ff]|[\u0750-\u077f]|[\ufb50-\ufc3f]|[\ufe70-\ufefc]")),
                        ),
                      ),
                      UtilsTextFieldPublic(
                        child: MyConsumerAuthProvider(
                            builder: (context, value, child) =>
                                passwordFormField(
                                  _password,
                                  " ادخل  كلمة المرور",
                                  Icon(Icons.lock),
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
                                  (String? val) =>
                                      ErrorResponse.valdationTextField(
                                          val,
                                          "يجب ادخال كلمة المرور",
                                          'الرجاء إدخال 8 احرف با الأقل',
                                          'الرجاء إدخال 1024 حرف با الاكثر',
                                          8,
                                          1024),
                                )),
                      ),
                      UtilsTextFieldPublic(
                        child: Consumer<ProviderNetworkDetails>(
                          builder: (context, provider, child) =>
                              MyTextFormField(
                            autovalidate: provider.autoTextfieldPhone,
                            controller: _phone,
                            input: InputDecoration(
                                contentPadding: const EdgeInsets.all(5.0),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0)),
                                  borderSide: BorderSide(
                                      color: kPrimaryColor, width: 1.5),
                                ),
                                errorStyle:
                                    const TextStyle(color: StyleWidget.red),
                                prefixIcon: const Icon(Icons.phone),
                                labelText: " ادخل  رقم الهاتف",
                                labelStyle: const TextStyle(
                                  color: const Color(0xFF727072),
                                  height: 1,
                                  fontSize: 17,
                                ),
                                suffixText: '-967+ ',
                                suffixStyle:
                                    const TextStyle(color: StyleWidget.blue),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                filled: true,
                                fillColor: StyleWidget.white70),
                            number: TextInputType.phone,
                            onChanged: () {
                              return provider.autoValidationPhone(
                                  _phone, "^[0-9]");
                            },
                            validator: (String? val) =>
                                ErrorResponse.autovaldationPhone(
                                    val,
                                    "يجب ادخال رقم الهاتف",
                                    'الرجاء إدخال 9 ارقام با الأقل',
                                    'الرجاء إدخال 9 ارقام با الاكثر',
                                    9,
                                    9,
                                    _phone,
                                    "^[0-9]"),
                          ),
                        ),
                      ),
                      sizedBox(10),
                      MyRaisedButton(
                          text: 'إنشاء',
                          press: () async {
                            await submit(context);
                          }),
                      SizedBox(height: size.height * 0.03),
                      AlreadyHaveAnAccountCheck(
                        login: false,
                        press: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()),
                            (Route<dynamic> route) => false,
                          );
                        },
                      ),
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: size.height * 0.02),
                        width: size.width * 0.8,
                        child: Row(
                          children: <Widget>[
                            buildDivider(),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: const Text(
                                "او",
                                style: const TextStyle(
                                  color: kPrimaryColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Expanded(
                              child: const Divider(
                                color: const Color(0xFF201F1F),
                                height: 1.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          socialIcon(
                            "assets/icons/facebook.svg",
                            () {},
                          ),
                          socialIcon(
                            "assets/icons/twitter.svg",
                            () {},
                          ),
                          socialIcon(
                            "assets/icons/google-plus.svg",
                            () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  submit(context) async {
    final isValid = _formkey.currentState!.validate();

    if (isValid) {
      _formkey.currentState!.save();
      MyDialog.submitDialog(context);
      //this send data to server
      await this.context.read<AuthProvider>().register(
          username: _username.text.trim().toLowerCase(),
          email: _email.text.trim(),
          password: _password.text.trim(),
          phone: _phone.text.trim(),
          context: context);
    }
  }
}

Widget socialIcon(final String iconSrc, void Function()? press) {
  return GestureDetector(
    onTap: press,
    child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: StyleWidget.black,
        ),
        shape: BoxShape.circle,
      ),
      child: SvgPicture.asset(
        iconSrc,
        height: 20,
        width: 20,
      ),
    ),
  );
}

Widget build2Container(
  final Widget child,
  final Widget child1,
) {
  return Column(
    children: [
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Expanded(
            child: Container(
          child: child,
        )),
        Expanded(
            child: Container(
          child: child1,
        )),
      ]),
    ],
  );
}
