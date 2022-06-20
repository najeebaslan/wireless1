import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../../exports/export_manager.dart';

class CoverageAreaScareen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<CoverageAreaScareen>
    with TickerProviderStateMixin {
  final TextEditingController areanetwork = TextEditingController();
  final _formkeyPlaces = GlobalKey<FormState>();
  bool value = false;

  AutovalidateMode autovalidate = AutovalidateMode.disabled;
  bool validwidget = false;
  @override
  void dispose() {
    areanetwork.dispose();
    super.dispose();
  }

  bool _fromTop = true;

  int? defaultChoiceIndex;

  //this is controller animation share data
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  @override
  Widget build(BuildContext context) {
    print('rebuild CoverageAreaScareen');

    return MyDirectionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints sizeSc) {
            return Form(
              key: _formkeyPlaces,
              child: Container(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      MyPadding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            sizedBox(2.5.h),
                            customAppBar(
                                "مناطق تغطية الشبكة ",
                                "تشمل اسماء المناطق والشوارع و الحارات ",
                                "assets/gummy_location.png",
                                14),
                            sizedBox(20),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Consumer<ProviderCoverageArea>(
                                builder: (context, provider, child) => Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          child: Expanded(
                                            child: SizedBox(
                                              child: MyTextFormField(
                                                controller: areanetwork,
                                                input:
                                                    AuthSharing.inputDecoration(
                                                  "أدخل مناطق تغطية الشبكة",
                                                  // provider.chackevalue
                                                  value == false
                                                      ? null
                                                      : IconButton(
                                                          icon: Icon(Icons.add),
                                                          onPressed: () async {
                                                            BuildContext cont =
                                                                context;

                                                            MyDialog
                                                                .submitDialog(
                                                                    cont);
                                                            List<CoverageArea>? users = await AllEreaApi()
                                                                .postCoverageArea(
                                                                    context:
                                                                        context,
                                                                    area: areanetwork
                                                                        .text
                                                                        .toString())
                                                                .onError((error,
                                                                    stackTrace) {
                                                              Navigator.of(cont)
                                                                  .pop();
                                                              return;
                                                            });
                                                            if (users != null) {
                                                              setState(() {
                                                                Navigator.of(
                                                                        cont)
                                                                    .pop();
                                                                value = false;
                                                                validwidget =
                                                                    true;
                                                                provider
                                                                    .setArea(
                                                                        users);
                                                              });
                                                            }
                                                            areanetwork.clear();
                                                          }),
                                                  const Icon(
                                                      Icons.add_location),
                                                  '',
                                                  "يجب إدخال  مناطق تغطية الشبكة",
                                                  5.0,
                                                  const EdgeInsets.all(5.0),
                                                ),
                                                number: TextInputType.text,
                                                onChanged: () {
                                                  if (areanetwork
                                                          .text.isEmpty ||
                                                      areanetwork.text.length <
                                                          2) {
                                                    value = false;
                                                  } else {
                                                    value = true;
                                                  }

                                                  provider.validition(
                                                    areanetwork,
                                                  );
                                                },
                                                validator: (String? val) =>
                                                    ErrorResponse.autovaldation(
                                                       val:         val.toString(),
                                                       error:       "يجب إدخال مناطق تغطية الشبكة",
                                                       lengthMin:   'الرجاء إدخال 3 احرف با الأقل',
                                                       lengthMax:   'الرجاء إدخال 9 حرف با الاكثر',
                                                       intMain:     3,
                                                       intMax:      44,
                                                       contoller:   areanetwork,
                                                       err:         'يجب الإدخال باللغة العربية',
                                                       reges:       r'[A-Za-z0-9-[\]_+/+\+.+!+$+#+@+~+|+"+`+]+'),
                                                autovalidate: autovalidate,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    validwidget
                                        ? Container(
                                            padding: FuSpacing.only(top: 15),
                                            child: Wrap(
                                              spacing: 8,
                                              children: List.generate(
                                                  provider.area!.length,
                                                  (index) {
                                                return Stack(
                                                    clipBehavior: Clip.none,
                                                    children: [
                                                      ChoiceChip(
                                                        selectedColor:
                                                            FuAppTheme
                                                                .theme
                                                                .colorScheme
                                                                .primary,
                                                        labelPadding:
                                                            EdgeInsets.all(2.0),
                                                        label: Text(
                                                          provider.area![index]
                                                              .name,
                                                          style: FuAppTheme.theme
                                                              .textTheme.bodyText2!
                                                              .merge(TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontFamily:
                                                                      StyleWidget
                                                                          .fontName,
                                                                  fontSize: 9
                                                                      .sp,
                                                                  color: defaultChoiceIndex ==
                                                                          index
                                                                      ? FuAppTheme
                                                                          .theme
                                                                          .colorScheme
                                                                          .onPrimary
                                                                      : FuAppTheme
                                                                          .theme
                                                                          .textTheme
                                                                          .bodySmall!
                                                                          .color)),
                                                        ),
                                                        selected:
                                                            defaultChoiceIndex ==
                                                                index,
                                                        onSelected: (value) {
                                                          defaultChoiceIndex =
                                                              defaultChoiceIndex;

                                                          log(provider
                                                              .area![index].name
                                                              .toString());
                                                          setState(() {
                                                            if (defaultChoiceIndex ==
                                                                index) {
                                                              defaultChoiceIndex =
                                                                  null;
                                                            } else {
                                                              defaultChoiceIndex =
                                                                  value
                                                                      ? index
                                                                      : defaultChoiceIndex;
                                                            }
                                                            ;
                                                          });
                                                        },
                                                        elevation: 1,
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 12),
                                                      ).paddingOnly(
                                                          left: 3,
                                                          right: 3,
                                                          top: 15),
                                                      defaultChoiceIndex ==
                                                              index
                                                          ? Positioned(
                                                              top: -15,
                                                              right: -22,
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  IconButton(
                                                                    onPressed: () async => await myDialog(WidgetCoverage.widgetDelete(
                                                                        provider
                                                                            .area,
                                                                        index,
                                                                        context)),
                                                                    icon: Icon(
                                                                      Icons
                                                                          .delete,
                                                                      color: Color(
                                                                          0xFFF3570E),
                                                                      size: 25,
                                                                    ),
                                                                  ),
                                                                  IconButton(
                                                                    
                                                                    onPressed: ()
                                                                    
                                                                     async => 
                                                                    
                                                                    await myDialog(WidgetCoverage.widgetEdit(
                                                                        provider
                                                                            .area,
                                                                        index,
                                                                        context,    )),
                                                                    icon: Icon(
                                                                      Icons
                                                                          .edit,
                                                                      color:
                                                                          kPrimaryColor,
                                                                      size: 25,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ))
                                                          : SizedBox()
                                                    ]);
                                              }),
                                            ))
                                        : SizedBox()
                                  ],
                                ),
                              ),
                            ),
                            // Listion(),
                          ],
                        ),
                      ),
                      size(sizeSc.maxHeight / 3.5, 0.0, null),
                      MyPadding(
                        padding: const EdgeInsets.all(1.0),
                        child:
                            SizedBox(height: 120, child: ProcessTimelinePage()),
                      ),
                      sizedBox(
                        sizeSc.maxHeight / 20.5,
                      ),
                      MyRaisedButton(
                        text: 'التالي',
                        press: () {
                         
                          MyDialog.submitDialog(context);

                          context
                              .read<ProviderNetworkDetails>()
                              .timeliene(value: 1);

                          return submit();
                        },
                      ),
                    5.height,
                    ],
                  ),
                ),
              ),
            );
          }),
        ));
  }

  Future myDialog(Widget widget) {
    return showGeneralDialog(
      barrierLabel: "Label",
      barrierDismissible: false,
      barrierColor: Colors.transparent,
      transitionDuration: Duration(milliseconds: 700),
      context: context,
      pageBuilder: (context, anim1, anim2) {
        return GestureDetector(
          onVerticalDragUpdate: (dragUpdateDetails) {
            Navigator.of(context).pop();
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 7.h),
              Card(
                color: kPrimaryColor,
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                child: Container(
                  padding: FuSpacing.all(12),
                  child: SingleChildScrollView(child: widget),
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
              ),
            ],
          ),
        );
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return SlideTransition(
            position: anim1.drive(
                Tween(begin: Offset(0, _fromTop ? -1 : 1), end: Offset(0, 0))
                    .chain(CurveTween(curve: Sprung()))),
            child: child);
      },
    );
  }

  Future<void> submit() async {

    await allEreaApi.getCaverage_area(context: context);
  }
}
