import 'package:feature_discovery/feature_discovery.dart';
import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import '../../exports/export_manager.dart';

class MyPadding extends StatelessWidget {
  final EdgeInsetsGeometry? padding;
  final Widget? child;
  const MyPadding({Key? key, required this.padding, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding!,
      child: child!,
    );
  }
}

class MyDirectionality extends StatelessWidget {
  final Widget? child;
  final TextDirection? textDirection;
  const MyDirectionality(
      {Key? key, required this.child, required this.textDirection})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: textDirection!,
      child: child!,
    );
  }
}

class MySpinKitFadingGrid {
  static buildSpinKitFadingGrid() {
    return const SpinKitFadingGrid(
      color: Colors.deepOrange,
      size: 35,
    );
  }

  static Widget spinKitCubeGrid() {
    return const SpinKitCubeGrid(
      color: Color(0xFF4875D8),
      size: 35,
    );
  }

  static Widget spinKitWave() {
    return const SpinKitWave(
      type: SpinKitWaveType.center,
      color: Colors.pink,
      size: 30,
    );
  }

  static progressIndicator() {
    return const Center(
      child: const SpinKitThreeBounce(
        color: Colors.blue,
        size: 20,
      ),
    );
  }
}

void showConnectivitySnackBar(ConnectivityResult result, BuildContext context) {
  final hasInternet = result != ConnectivityResult.none;
  final message = hasInternet ? 'تم استعادة الاتصال ' : 'لست متصل باالإنترنت ';
  final color = hasInternet ? Colors.green : Colors.red;
  ErrorResponse.snackBarError(message, context, color);
}

class MyDialog {
  static Future<Null> submitDialog(BuildContext cot) async {
    return await showDialog<Null>(
        context: cot,
        barrierDismissible: false,
        builder: (_) {
          return WillPopScope(
            onWillPop: () async => false,
            child: SimpleDialog(
              elevation: 0.0,
              backgroundColor: StyleWidget.white,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Lottie.asset('assets/lottie/loding.json',
                        height: 60, width: 60),
                    // MySpinKitFadingGrid.spinKitCubeGrid(),
                    ts('. . . انتضر لحظة من فضلك',
                        const TextStyle(fontFamily: StyleWidget.fontName))
                  ],
                ),
              ],
            ),
          );
        });
  }
}

class MyConsumerAuthProvider extends StatelessWidget {
  final Widget Function(BuildContext, AuthProvider, Widget?) builder;
  const MyConsumerAuthProvider({Key? key, required this.builder})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: builder);
  }
}

class MyConsumerNetworkProvider extends StatelessWidget {
  final Widget Function(BuildContext, NetworkProvider, Widget?) builder;
  const MyConsumerNetworkProvider({Key? key, required this.builder})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<NetworkProvider>(builder: builder);
  }
}

Consumer<AuthProvider> myConsumerProvider(
    final Widget Function(BuildContext, AuthProvider, Widget?) builder) {
  return Consumer<AuthProvider>(builder: builder);
}

DescribedFeatureOverlay myDescribed(
  final Widget child,
  final String featureId,
  final Color backgroundColor,
  final String description,
  final ContentLocation contentLocation,
  final Widget tapTarget,
  final String title,
  final Color textColor,
) {
  return DescribedFeatureOverlay(
      featureId: featureId,
      targetColor: StyleWidget.white,
      textColor: textColor,
      backgroundColor: backgroundColor,
      contentLocation: contentLocation,
      title: Text(
        title,
        style: TextStyle(fontSize: 23.0),
      ),
      pulseDuration: Duration(seconds: 1),
      enablePulsingAnimation: true,
      barrierDismissible: false,
      overflowMode: OverflowMode.extendBackground,
      openDuration: Duration(seconds: 1),
      description: Text(
        description,
        style: TextStyle(fontSize: 17.0),
      ),
      tapTarget: tapTarget,
      child: child);
}

Widget customAppBar(
  String local,
  String des,
  image,
  double fontSize, {
  double? height,
  double? width,
}) {
  return Padding(
    padding: const EdgeInsets.only(left: 5, right: 5, top: 0, bottom: 0),
    child: Stack(
      clipBehavior: Clip.none,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 16, bottom: 16),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
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
            child: Stack(
              alignment: Alignment.topLeft,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Padding(
                            padding: const EdgeInsets.only(
                              right: 16,
                              top: 16,
                            ),
                            child: ts(
                                local,
                                TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: fontSize,
                                  fontFamily: StyleWidget.fontName,
                                  letterSpacing: 0.0,
                                  color: Colors.black,
                                )))
                      ],
                    ),
                    Padding(
                        padding: const EdgeInsets.only(
                          left: 100,
                          bottom: 12,
                          top: 4,
                          right: 16,
                        ),
                        child: ts(
                          des,
                          TextStyle(
                            fontFamily: StyleWidget.fontName,
                            fontWeight: FontWeight.w800,
                            fontSize: 10,
                            letterSpacing: 0.0,
                            color: Colors.grey.withOpacity(0.7),
                          ),
                        )),
                  ],
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: -16,
          left: 0,
          child: SizedBox(
              height: height ?? 110,
              width: width ?? 110,
              child: Image.asset(
                image,

                fit: BoxFit.cover,
              )),
        ),
      ],
    ),
  );
}

Center buildNoTasks(ThemeData theme, String text) {
  return Center(
    child: Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Column(
            children: <Widget>[
              const Icon(
                Icons.sentiment_dissatisfied,
                size: 100,
                color: Colors.redAccent,
              ),
              Card(
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 10,
                child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ts(
                      text,
                      const TextStyle(
                        color: Colors.white,
                        fontFamily: StyleWidget.fontName,
                      ),
                    )),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
