import 'dart:io';
import 'package:feature_discovery/feature_discovery.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../../Auth/widgets/type_ahead_from_field.dart';
import '../../../../exports/export_manager.dart';

class NetworkDetails extends StatefulWidget {
  @override
  _NetworkDetailsState createState() => _NetworkDetailsState();
}

class _NetworkDetailsState extends State<NetworkDetails> {
  final TextEditingController _nameA = TextEditingController();
  final TextEditingController _nameE = TextEditingController();
  final TextEditingController _image = TextEditingController();
  final TextEditingController _address = TextEditingController();
  final TextEditingController _userInitiate = TextEditingController();
  final TextEditingController _phones = TextEditingController();
  final TextEditingController _governorate = TextEditingController();
  final TextEditingController _city = TextEditingController();
  final TextEditingController _village = TextEditingController();
  final TextEditingController _maintenancePhone = TextEditingController();
  final TextEditingController _maintenancePhone1 = TextEditingController();
  late final void Function(File pickedImage) imagePickFn;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      FeatureDiscovery.discoverFeatures(context, <String>[
        'feature1',
        'feature2',
        'feature3',
        'feature4',
      ]);
    });
  }

  final _formKey = GlobalKey<FormState>();

  File? _file;
  Future picketImage() async {
    var myFile;

    myFile = await ImagePicker.platform.pickImage(source: ImageSource.gallery);
    setState(() {
      if (myFile != null) {
        _file = File(myFile.path);
        print(_file!.path);
      } else
        _file = null;
    });
  }

  final controllerCity = TextEditingController();
  var scaffoldFirsrKey = new GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    controllerCity.dispose();
    _nameA.dispose();
    _nameE.dispose();
    _image.dispose();
    _address.dispose();
    _userInitiate.dispose();
    _phones.dispose();
    _governorate.dispose();
    _city.dispose();
    _village.dispose();
    _maintenancePhone.dispose();
    _maintenancePhone1.dispose();

    super.dispose();
  }

  late AutovalidateMode autovalidate = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    print('rebuild FistScreen Page ');

    return MyDirectionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        key: scaffoldFirsrKey,
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                30.height,
                buildCardAppbar(
                  'assets/lottie/wifi.json',
                ),
                Column(
                  children: [
                    MyPadding(
                      padding: const EdgeInsets.all(17.0),
                      child: Consumer<ProviderNetworkDetails>(
                        builder: (context, provider, child) => Column(
                          children: [
                            MyTextFormField(
                                autovalidate: provider.autoTextfield1,
                                controller: _nameA,
                                input: AuthSharing.inputDecoration(
                                  'اخل اسم الشبكة باللغةالعربية',
                                  null,
                                  const Icon(Icons.wifi),
                                  'شبكة: ',
                                  'يجب ادخال اسم الشبكة باللغة العربية',
                                  30.0,
                                  const EdgeInsets.all(5.0),
                                ),
                                number: TextInputType.name,
                                onChanged: () {
                                  return provider.autovalidition1(
                                      _nameA, r'[A-Za-z0-9-[\]_+]+');
                                },
                                validator: (String? val) =>
                                    ErrorResponse.autovaldation(
                                      val:         val!,
                                      error:       'يجب ادخال اسم الشبكة',
                                      lengthMin:   'الرجاء إدخال 3 احرف با الأقل',
                                      lengthMax:   'الرجاء إدخال 9 حرف با الاكثر',
                                      intMain:     3,
                                      intMax:      44,
                                      contoller:   _nameA,
                                      err:         'يجب الإدخال باللغة العربية',
                                      reges:       r'[A-Za-z0-9-[\]_+]+')),
                            30.height,
                            MyTextFormField(
                              controller: _nameE,
                              input: AuthSharing.inputDecoration(
                                'اخل اسم الشبكة باللغة الانجليزية',
                                null,
                                const Icon(Icons.wifi),
                                'شبكة: ',
                                'يجب ادخال اسم الشبكة باللغة الانجليزية',
                                30.0,
                                const EdgeInsets.all(5.0),
                              ),
                              number: TextInputType.name,
                              onChanged: () {
                                return provider.autovalidition(_nameE,
                                    "[\u0600-\u06ff]|[\u0750-\u077f]|[\ufb50-\ufc3f]|[\ufe70-\ufefc]");
                              },
                              validator: (String? val) =>
                                  ErrorResponse.autovaldation(
                                    val:         val.toString(),
                                    error:       'يجب ادخال اسم الشبكة',
                                    lengthMin:   'الرجاء إدخال 3 احرف با الأقل',
                                    lengthMax:   'الرجاء إدخال 9 حرف با الاكثر',
                                    intMain:     3,
                                    intMax:      44,
                                    contoller:   _nameE,
                                    err:         'يجب الإدخال باللغة الانجليزية',
                                    reges:       "[\u0600-\u06ff]|[\u0750-\u077f]|[\ufb50-\ufc3f]|[\ufe70-\ufefc]"),
                              autovalidate: provider.autoTextfield,
                            ),
                            30.height,

                            Column(
                              children: [
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      GovernorateField(
                                        governorate: _governorate,
                                        context: context,
                                        d: 30.0,
                                        onChanged: (value) {
                                          provider
                                              .checkerTextField(_governorate);
                                        },
                                        onSuggestionSelected:
                                            (LocationGovernorate? suggestion) {
                                          _governorate.text = suggestion!
                                              .governorate
                                              .toString();
                                          provider
                                              .checkerTextField(_governorate);
                                        },
                                      ),
                                      18.width,
                                      CityField(
                                          governorate: _governorate,
                                          context: context,
                                          d: 30.0,
                                          provider: provider,
                                          city: _city),
                                    ]),
                                20.height,
                                Row(
                                  children: [
                                    Visibility(
                                      child: VillageField(
                                          context: context,
                                          d: 25.0,
                                          provider: provider,
                                          village: _village,
                                          governorate: _governorate,
                                          city: _city),
                                      visible: provider.checkTextFieldCity,
                                    ),
                                    18.width,
                                    Visibility(
                                      child: addressWidget(),
                                      visible: provider.checkTextFieldCity,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            15.height,
                            
                            Column(
                              children: [
                                Consumer<ProviderNetworkDetails>(
                                  builder: (__, providerFirst, child) => Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          child: Container(
                                              child: provider.checkTextFieldCity
                                                  ? maintenancePhone1Widget()
                                                  : addressWidget()),
                                        ),
                                        18.width,
                                        provider.checkTextFieldCity
                                            ? providerFirst.sizeicon2
                                                ? maintenancePhone2Widget()
                                                : Expanded(child: SizedBox())
                                            : maintenancePhone1Widget()
                                      ]),
                                ),
                                8.height,
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                30.height,
                SizedBox(height: 15.h, child: ProcessTimelinePage()),
                30.height,
                MyConsumerNetworkProvider(
                  builder: (context, value, child) => MyPadding(
                    padding: const EdgeInsets.only(left: 100, right: 100),
                    child: MyRaisedButton(
                      text: 'التالي',
                      press: () {
                        return submit(value);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  maintenancePhone2Widget() {
    return Container(
      child: Expanded(
        child: MyTextFormField(
          controller: _maintenancePhone1,
          input: AuthSharing.inputDecoration(
            'اضافة رقم اَخر',
            null,
            null,
            '',
            '',
            30.0,
            const EdgeInsets.only(left: 20, right: 20, top: 5.0, bottom: 5.0),
          ),
          number: TextInputType.phone,
          onChanged: () {},
          validator: (String? val) => ErrorResponse.valdationTextField(
              val,
              'يجب ادخال  الرقم',
              'الرجاء إدخال 9 احرف با الأقل',
              'الرجاء إدخال 9 حرف با الاكثر',
              9,
              9),
          autovalidate: autovalidate,
        ),
        // )
      ),
      // ),
    );
  }

  Container maintenancePhone1Widget() {
    return Container(
      child: Expanded(
        child: Consumer<ProviderNetworkDetails>(
          builder: (__, providerFirst, child) => MyTextFormField(
              autovalidate: autovalidate,
              controller: _maintenancePhone,
              input: AuthSharing.inputDecoration(
                'الدعم الفني',
                providerFirst.sizeicon
                    ? null
                    : IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () {
                          providerFirst.truesizeicon2();
                        }),
                providerFirst.sizeicon
                    ? IconButton(
                        onPressed: () {},
                        icon: myDescribed(
                          Icon(Icons.phone_rounded),
                          'feature2',
                          Colors.blue,
                          'هذا الحقل يمكنك من خلاله إضافة ارقام الدعم الفني للشبكة',
                          ContentLocation.below,
                          const Icon(Icons.phone_rounded),
                          'الدعم الفني',
                          StyleWidget.black,
                        ),
                      )
                    : null,
                '',
                '',
                30.0,
                const EdgeInsets.only(
                    left: 10, right: 10, top: 5.0, bottom: 5.0),
              ),
              number: TextInputType.phone,
              onChanged: () {
                return providerFirst
                    .validitionMaintenancePhone(_maintenancePhone);
              },
              validator: (String? val) => ErrorResponse.valdationTextField(
                  val,
                  'يجب ادخال  الرقم',
                  'الرجاء إدخال 9 ارقام با الأقل',
                  'الرجاء إدخال 9 ارقام با الاكثر',
                  9,
                  9)),
        ),
      ),
    );
  }

  Expanded addressWidget() {
    return Expanded(
      child: MyTextFormField(
          autovalidate: autovalidate,
          controller: _address,
          input: AuthSharing.inputDecoration(
            '  اسم العزلة',
            null, const Icon(Icons.add_location_outlined),
            
            '',
            ' ',
            30.0,
            const EdgeInsets.all(5.0),
          ),
          number: TextInputType.text,
          onChanged: () {},
          validator: (String? val) => ErrorResponse.valdationTextField(
              val,
              'يجب ادخال اسم العزلة',
              'الرجاء إدخال 3 احرف با الأقل',
              'الرجاء إدخال 15 حرف با الاكثر',
              3,
              15)),
    );
  }

  submit( NetworkProvider provider,) async {
    final isValid = _formKey.currentState!.validate();

    var id = context
        .read<AuthProvider>()
        .governorateLocation
        ?.where((element) => element['governorate'] == _governorate.text)
        .toList();

    if (id!.isEmpty) {
      ErrorResponse.snackBarError(
          'يبدو انه لم يتم العثور على المحافظة', context, Color(0xFFE9572B));
      return false;
    }
    var resultMain = convertStringToInt(
        _maintenancePhone, context, 'هناك خطاء في رقم الهاتف');
    var resultMain1;
    print(_maintenancePhone1.text.toString());
    if (_maintenancePhone1.text.isNotEmpty) {
      resultMain1 = convertStringToInt(
          _maintenancePhone1, context, 'هناك خطاء في رقم الهاتف');
    } else if (!_maintenancePhone1.text.isNotEmpty) {
      resultMain1 = 'resultNull';
    }
    if (_file == null) {
      ErrorResponse.snackBarError('يجب وضع شعار الشبكة', context, StyleWidget.deepOrange);
    } else if (resultMain is int) {
      if (isValid) {
        late final providerToken =
            Provider.of<UtilsUserProvider>(context, listen: false);
        var userId = providerToken.userProfile;
        _formKey.currentState!.save();
        MyDialog.submitDialog(this.context);
        provider.createNetwork(
            _nameA.text.trim(),
            _nameE.text.trim(),
            _file!.path,
            _address.text.trim(),
            userId['_id'],
            id.isNotEmpty ? id[0]['_id'] : '',
            _city.text.trim(),
            // 'البعيمي',
            _village.text,
            resultMain,
            resultMain1,
            this.context);
      }
    }
  }

  Column buildColumnGradView(
      Widget buildTextFormField1, Widget buildTextFormField2) {
    return Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Expanded(
            child: Container(
              child: buildTextFormField1,
            ),
          ),
          18.width,
          Expanded(
            child: SizedBox(
              child: Container(
                child: buildTextFormField2,
              ),
            ),
          ),
        ]),
      ],
    );
  }

  Widget buildCardAppbar(String image) {
    return MyPadding(
      padding: const EdgeInsets.only(left: 17, right: 17, top: 0, bottom: 0),
      child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
                topLeft: const Radius.circular(8.0),
                bottomLeft: const Radius.circular(8.0),
                bottomRight: const Radius.circular(8.0),
                topRight: const Radius.circular(8.0)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.grey.withOpacity(0.4),
                  offset: Offset(1.1, 1.1),
                  blurRadius: 10.0),
            ],
          ),
          child: Column(
            children: [
              MyPadding(
                padding: const EdgeInsets.only(left: 5, right: 5.0),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () async {
                              if (picketImage == null) {
                                Scaffold.of(context).showSnackBar(SnackBar(
                                    content: text('من فضلك اضف صوره')));
                              } else
                                picketImage();
                            },
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                CircleAvatar(
                                  radius: 30,
                                  backgroundColor: Color(0xFFBBB9B9),
                                  backgroundImage:
                                      _file != null ? FileImage(_file!) : null,
                                ),
                                Positioned(
                                    top: 40,
                                    right: -2,
                                    child: myDescribed(
                                      Icon(Icons.add_a_photo_outlined,
                                          color: _file == null
                                              ? Color(0xFF444343)
                                              : Colors.transparent),
                                      'feature1',
                                      Colors.amber,
                                      'هذا الزر يمكنك من خلالة إضافة شعار الشبكة',
                                      ContentLocation.below,
                                      const Icon(Icons.add_a_photo_outlined),
                                      'شعار الشبكة',
                                      StyleWidget.black,
                                    ))
                              ],
                            ),
                          ),
                        ),
                        ts(
                          'خدمات الشبكات الاسلكية',
                          const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            fontFamily: StyleWidget.fontName,
                            letterSpacing: 0.0,
                            color: StyleWidget.black,
                          ),
                        ),
                        Expanded(
                            child: Container(
                          height: 10.h,
                          // 80,
                          child: Lottie.asset(image),
                        )),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: MyPadding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10.1),
                      child: ts(
                        'اضف صورة الشبكة الخاصة بك',
                        TextStyle(
                          fontFamily: StyleWidget.fontName,
                          fontWeight: FontWeight.w800,
                          fontSize: 10,
                          letterSpacing: 0.0,
                          color: Colors.grey.withOpacity(0.5),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
