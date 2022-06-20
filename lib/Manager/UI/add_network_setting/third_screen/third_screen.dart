import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:provider/provider.dart';
import '../../../../exports/export_manager.dart';

class ThirdScreenState extends StatefulWidget {
  @override
  _ThirdScreenStateState createState() => _ThirdScreenStateState();
}

class _ThirdScreenStateState extends State<ThirdScreenState> {
  String? _value1;

  String? _vlaue2;

  String? _vlaue3;

  dynamic name;

  bool valdition = false;

  final _formkeypackages = GlobalKey<FormState>();

  final TextEditingController time = TextEditingController();

  final TextEditingController validity = TextEditingController();

  final TextEditingController data = TextEditingController();

  Future<Null> _refreshData() async {
    setState(() {
      packageApi.getAllPackagePrice(
          '60a275f422e2c338bc226a42'
          // networkId.toString()

          ,
          context);
    });
  }

  // void dispose() {
  //   time.dispose();
  //   validity.dispose();
  //   data.dispose();

  //   super.dispose();
  // }

  var copyData;
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProviderNetworkDetails>(
      context,
    );

    var theme = Theme.of(context);
    Future<List<dynamic>?> fetchTask =
        packageApi.getPackagePrice('60a275f422e2c338bc226a42', context
            // networkId.toString()

            );
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            // body: RefreshIndicator(
          // onRefresh: _refreshData,
          body: Theme(
              data: HotelAppTheme.buildLightTheme(),
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      /////////////////////////////
                      margin: const EdgeInsets.symmetric(vertical: 8.0),
                      child: ListView(
                        children: [
                          // text(networkId.toString()),
                          // text('userId'.toString()),
                          // customAppBar(
                          //     'تفاصيل الباقات',
                          //     'يجب اضافة التفاصيل لكل باقة تمت اضافتها',
                          //     "assets/runner.png",
                          //     14),
                          Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 1, bottom: 1),
                                child: StreamBuilder(
                                  stream: fetchTask.asStream(),
                                  builder: (context, AsyncSnapshot snapshot) {
                                    if (!snapshot.hasData) {
                                      return MySpinKitFadingGrid
                                          .progressIndicator();
                                    } else if (snapshot.data.length == 0) {
                                      return buildNoTasks(
                                          theme, 'لا توجد بيانات');
                                    } else {
                                      return Container(
                                          height: 100,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: Container(
                                            child: StreamBuilder(
                                              stream: fetchTask.asStream(),
                                              builder: (context,
                                                  AsyncSnapshot snapshot) {
                                                if (!snapshot.hasData) {
                                                  return MySpinKitFadingGrid
                                                      .progressIndicator();
                                                } else if (snapshot
                                                        .data.length ==
                                                    0) {
                                                  return buildNoTasks(
                                                      theme, 'لا توجد بيانات');
                                                } else {
                                                  return Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                          5,
                                                        ),
                                                        color: Colors.grey,
                                                      ),
                                                      padding:
                                                          const EdgeInsets.all(
                                                              1),
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                            5,
                                                          ),
                                                          color: Colors.white,
                                                        ),
                                                        padding:
                                                            const EdgeInsets
                                                                .all(1),
                                                        width: MediaQuery.of(
                                                                context)
                                                            .size
                                                            .width,
                                                        child: ListView.builder(
                                                            itemCount: snapshot
                                                                .data.length,
                                                            scrollDirection:
                                                                Axis.horizontal,
                                                            itemBuilder:
                                                                (BuildContext
                                                                        context,
                                                                    int index) {
                                                              copyData =
                                                                  snapshot.data[
                                                                      index];
                                                              var data =
                                                                  snapshot.data[
                                                                      index];
                                                              return Stack(
                                                                children: [
                                                                  Container(
                                                                    width: 170,
                                                                    child: Card(
                                                                      elevation:
                                                                          5,
                                                                      shadowColor:
                                                                          Colors
                                                                              .black,
                                                                      child:
                                                                          Column(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceAround,
                                                                        children: [
                                                                          RichText(
                                                                            text:
                                                                                TextSpan(
                                                                              text: '',
                                                                              style: DefaultTextStyle.of(context).style,
                                                                              children: <TextSpan>[
                                                                                const TextSpan(
                                                                                    text: '   فئة :',
                                                                                    style: const TextStyle(
                                                                                      fontFamily: StyleWidget.fontName,
                                                                                    )),
                                                                                TextSpan(
                                                                                    text: '${data.packagePrice}',
                                                                                    style: const TextStyle(
                                                                                      color: Colors.deepOrangeAccent,
                                                                                      fontWeight: FontWeight.w600,
                                                                                      fontFamily: StyleWidget.fontName,
                                                                                    )),
                                                                                const TextSpan(
                                                                                    text: ' ريال يمني',
                                                                                    style: const TextStyle(
                                                                                      fontSize: 12,
                                                                                      fontFamily: StyleWidget.fontName,
                                                                                    )),
                                                                              ],
                                                                            ),
                                                                          )
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Positioned(
                                                                    left: 135,
                                                                    bottom: 40,
                                                                    right: 0.50,
                                                                    child: IconButton(
                                                                        icon: Container(
                                                                          color:
                                                                              Colors.blue,
                                                                          child:
                                                                              const Icon(
                                                                            Icons.add,
                                                                            color:
                                                                                Colors.white,
                                                                            size:
                                                                                15,
                                                                          ),
                                                                        ),
                                                                        onPressed: () async {
                                                                          await buildbottomSheet(
                                                                              data);
                                                                        }),
                                                                  ),
                                                                  Positioned(
                                                                      right:
                                                                          135,
                                                                      bottom:
                                                                          40,
                                                                      left:
                                                                          0.50,
                                                                      child: IconButton(
                                                                          icon: const Icon(
                                                                            Icons.edit,
                                                                            color:
                                                                                Colors.blue,
                                                                            size:
                                                                                20,
                                                                          ),
                                                                          onPressed: () async {
                                                                            builshowDialogPackage(
                                                                              context,
                                                                              data,
                                                                            );
                                                                          })),
                                                                  Positioned(
                                                                      right:
                                                                          130,
                                                                      top: 39,
                                                                      child:
                                                                          IconButton(
                                                                        icon:
                                                                            const Icon(
                                                                          Icons
                                                                              .delete,
                                                                          color:
                                                                              Colors.red,
                                                                        ),
                                                                        onPressed:
                                                                            () {
                                                                          AwesomeDialog(
                                                                            context:
                                                                                context,
                                                                            dialogType:
                                                                                DialogType.QUESTION,
                                                                            animType:
                                                                                AnimType.RIGHSLIDE,
                                                                            headerAnimationLoop:
                                                                                false,
                                                                            title:
                                                                                " حذف : (${data.packagePrice} )",
                                                                            desc:
                                                                                '   سيتم حذف  (${data.packagePrice}) نهائياً هل انت متاكد من ذالك  ',
                                                                            btnOkOnPress:
                                                                                () async {
                                                                              PackagePriceId packagePrice = PackagePriceId(
                                                                                id: data.id,
                                                                                packagePrice: data.packagePrice,
                                                                                network: '',
                                                                                isAdd: true,
                                                                              );
                                                                              await packageApi.deletePackagePrice(packagePrice, context);
                                                                              setState(() {
                                                                                fetchTask = packageApi.getPackagePrice(networkId, context);
                                                                              });
                                                                            },
                                                                            btnOkText:
                                                                                'موافق',
                                                                            btnCancelText:
                                                                                'الغاء',
                                                                            btnCancelOnPress:
                                                                                () {},
                                                                            btnOkColor:
                                                                                Colors.red,
                                                                          )..show();
                                                                        },
                                                                      )),
                                                                ],
                                                              );
                                                            }),
                                                      ),
                                                    ),
                                                  );
                                                }
                                              },
                                            ),
                                          ));
                                    }
                                  },
                                ),
                              ),
                              const Divider(
                                height: 10,
                                color: Colors.black,
                                endIndent: 8,
                                indent: 8,
                                thickness: 1,
                              ),
                              Row(
                                children: [
                                  ts(
                                      'اظافة عدد الكروت الى الفئات المظافة',
                                      const TextStyle(
                                        fontFamily: StyleWidget.fontName,
                                        fontSize: 12,
                                      ))
                                ],
                              ),
                              Animation_Packages(),
                              // const Divider(
                              //   height: 10,
                              //   color: Colors.black,
                              //   endIndent: 8,
                              //   indent: 8,
                              //   thickness: 1,
                              // ),
                              // Padding(
                              //   padding: const EdgeInsets.all(1.0),
                              //   child: SizedBox(
                              //       height: 120,
                              //       // width: MediaQuery.of(context).size.width,
                              //       child: ProcessTimelinePage()),
                              // ),
                              // SizedBox(height: 5),
                              // TextButton(
                              //   onPressed: () {},
                              //   child: RaisedButtons(
                              //     child: ts(
                              //         'التالي',
                              //         const TextStyle(
                              //             color: Colors.white,
                              //             fontFamily: StyleWidget.fontName)),
                              //     color: Colors.blue,
                              //     onPressed: () {
                              //       validatedata() {
                              //         if (copyData.isAdd == true) {
                              //           //قفلته موقت وهو شغال اصلا بس جربت شي
                              //           // Navigator.pushAndRemoveUntil(
                              //           //   context,
                              //           //   MaterialPageRoute(
                              //           //       builder: (context) =>
                              //           //           DrawerWithAppBar()),
                              //           //   (Route<dynamic> route) => false,
                              //           // );
                              //         } else if (copyData.isAdd == false) {
                              //           ScaffoldMessenger.of(context)
                              //             ..removeCurrentSnackBar()
                              //             ..showSnackBar(SnackBar(
                              //               backgroundColor: Colors.deepOrange,
                              //               padding: EdgeInsets.only(
                              //                 left: 0,
                              //               ),
                              //               content:const Text(
                              //                 ' تاكد من اضافة الكروت الى جميع الفئات الموجودة',
                              //                 style:const TextStyle(
                              //                     fontFamily:
                              //                         StyleWidget.fontName),
                              //               ),
                              //             ));
                              //         }
                              //       }

                              //       validatedata();

                              //       bool sizeicon = true;
                              //       provider.timeliene(value:3);
                              //       // sizeicon
                              //       //     ? setState(() {})
                              //       //     :
                              //       //     // ignore: dead_code
                              //       //     setState(() {

                              //       //         processIndex = (processIndex + 1) %
                              //       //             processes.length;
                              //       //       });
                              //     },
                              //   ),
                              // ),
                            ],
                          ),
                        ],
                      )))),
        // )
        ));
  }

  Padding buildbuttum(DropdownButtonFormField dropdownButtonFormField,
      TextFormField textFormField, String string) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            5,
          ),
          color: Colors.grey,
        ),
        child: Container(
          margin: const EdgeInsets.all(1),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              4,
            ),
            color: Colors.white,
          ),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  // flex: 3,
                  child: Container(
                      margin: const EdgeInsets.only(right: 10),
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: dropdownButtonFormField,
                      )),
                ),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: textFormField,
                )),
                Expanded(
                    child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: Padding(
                            padding: const EdgeInsets.only(right: 5.0),
                            child: ts(
                                string,
                                const TextStyle(
                                  fontFamily: StyleWidget.fontName,
                                ))))),
              ]),
        ),
      ),
    );
  }

  buildbottomSheet(PackagePriceId data1) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Form(
          key: _formkeypackages,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    topLeft: Radius.circular(10),
                  ),
                  color: Colors.blue,
                ),
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topRight: const Radius.circular(7),
                      topLeft: const Radius.circular(7),
                    ),
                    color: Colors.white,
                  ),
                  height: MediaQuery.of(context).size.height - 300,
                  margin: const EdgeInsets.all(2),
                  child: SingleChildScrollView(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            decoration: const BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                topRight: const Radius.circular(7),
                                topLeft: const Radius.circular(7),
                              ),
                              color: Colors.blue,
                            ),
                            child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 8.0, right: 8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ts(
                                        'تفاصيل الباقات',
                                        const TextStyle(
                                          fontFamily: StyleWidget.fontName,
                                        )),
                                    RichText(
                                      text: TextSpan(
                                        children: <TextSpan>[
                                          const TextSpan(
                                              text: 'اسم الفئة : ',
                                              style: const TextStyle(
                                                fontFamily:
                                                    StyleWidget.fontName,
                                                color: Colors.black,
                                              )),
                                          TextSpan(
                                              text: data1.packagePrice,
                                              style: const TextStyle(
                                                fontFamily:
                                                    StyleWidget.fontName,
                                                color: Colors.white,
                                              )),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          buildbuttum(
                            DropdownButtonFormField<String>(
                              value: _value1,
                              hint: ts(
                                  'ساعة',
                                  const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14)),
                              onChanged: (salutation) =>
                                  setState(() => _value1 = salutation!),
                              // validator: (value) =>
                              //     value == null ? 'حدد الوقت' : null,
                              items: [
                                'ساعة',
                                'يوم'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: text(value),
                                );
                              }).toList(),
                            ),
                            buildTextFormField(
                              time,
                              "يجب ادخال وقت الاستخدام",
                              null,
                              TextInputType.number,
                            ),
                            'وقت الاستخدام',
                          ),
                          const Divider(
                            height: 10,
                            color: Colors.black,
                            endIndent: 8,
                            indent: 8,
                            thickness: 1,
                          ),
                          buildbuttum(
                            DropdownButtonFormField<String>(
                              value: _vlaue2,
                              hint: ts('يوم',
                                  const TextStyle(fontWeight: FontWeight.bold)),
                              onChanged: (salutation) =>
                                  setState(() => _vlaue2 = salutation!),
                              // validator: (value) =>
                              //     value == null ? 'حدد الصلاحية' : null,
                              items: [
                                'ساعة',
                                'يوم',
                                'شهر'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: text(value),
                                );
                              }).toList(),
                            ),
                            buildTextFormField(
                              validity,
                              "يجب ادخال الصلاحية",
                              null,
                              TextInputType.number,
                            ),
                            'الصلاحية',
                          ),
                          const Divider(
                            height: 20,
                            color: Colors.black,
                            endIndent: 8,
                            indent: 8,
                            thickness: 1,
                          ),
                          buildbuttum(
                            DropdownButtonFormField<String>(
                              value: _vlaue3,
                              hint: ts(
                                  'ميجا',
                                  const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold)),
                              onChanged: (salutation) =>
                                  setState(() => _vlaue3 = salutation!),
                              // validator: (value) =>
                              //     value == null ? 'حدد البيانات' : null,
                              items: [
                                'ميجا',
                                'جيجا',
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: text(value),
                                );
                              }).toList(),
                            ),
                            buildTextFormField(
                              data,
                              "يجب ادخال البيانات",
                              null,
                              TextInputType.number,
                            ),
                            'البيانات',
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Center(
                            child: RaisedButton(
                                elevation: 5,
                                color: Colors.blue,
                                child: ts(
                                    'التالي    ',
                                    const TextStyle(
                                        color: Colors.white,
                                        fontFamily: StyleWidget.fontName)),
                                onPressed: () {
                                  if (_formkeypackages.currentState!
                                      .validate()) {
                                    _formkeypackages.currentState!.save();
                                    packageApi.postdetailsPackage(
                                        data.text,
                                        time.text,
                                        validity.text,
                                        _value1 ?? 'ساعة',
                                        _vlaue2 ?? 'يوم',
                                        _vlaue3 ?? 'ميجا',
                                        networkId,
                                        data1.id,
                                        'userId',
                                        data1,
                                        true,
                                        context);

                                    WidgetsBinding.instance!
                                        .addPostFrameCallback((_) {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                ThirdScreenState(),
                                          ));
                                    });
                                    setState(() {
                                      // packageApi.getAllPackagePrice(
                                      //     NetworkId.toString());
                                      // WidgetsBinding.instance!
                                      //     .addPostFrameCallback((_) {
                                      //   Navigator.pushReplacement(
                                      //       context,
                                      //       MaterialPageRoute(
                                      //         builder: (context) =>
                                      //             ThirdScreenState(),
                                      //       ));
                                      // });
                                      Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ThirdScreenState()),
                                        (Route<dynamic> route) => false,
                                      );
                                      // Navigator.of(context).push(
                                      //     MaterialPageRoute(
                                      //         builder: (context) =>
                                      //             ThirdScreenState()));
                                    });
                                  }
                                }),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
