// import 'dart:math';

// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';

// class AppDimensions extends InheritedWidget {

//   static AppDimensions of(BuildContext context) =>
//       context.inheritFromWidgetOfExactType(AppDimensions);

//   AppDimensions({
//     Key? key,
//     required Widget child,
//   }) : super(key: key, child: child);

//   @override
//   bool updateShouldNotify(InheritedWidget oldWidget) => false;

//   double _fix(double value) => value;

//   MediaQueryData _data(BuildContext context) => MediaQuery.of(context);

//   static const _cardMinimumWidth = 296.0;

//   int cardCount(BuildContext context) =>
//       max(_data(context).size.width ~/ _cardMinimumWidth, 1);

//   double get paddingSmall => _fix(4.0);

//   double get paddingMedium => _fix(8.0);

//   double get paddingLarge => _fix(16.0);

// }

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:wirless_wifi/exports/export_manager.dart';

class DashboardScreen extends StatefulWidget {
  static String tag = '/DashboardScreen';

  @override
  DashboardScreenState createState() => DashboardScreenState();
}

class DashboardScreenState extends State<DashboardScreen>
    with SingleTickerProviderStateMixin {
  ScrollController scrollController = ScrollController();
  AnimationController? animationController;
  late Animation animation;

  bool showSecondWidget = false;

  @override
  void initState() {
    super.initState();

    init();
  }

  Future<void> init() async {
    animationController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 400),
        value: 0.0,
        upperBound: 0.29,
        lowerBound: 0.0)
      ..reverse();
    animation =
        CurvedAnimation(parent: animationController!, curve: Curves.ease);
    animationController!.forward();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  void dispose() {
    scrollController.dispose();
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:
          // Observer(
          //   builder: (_) =>
          Scaffold(
        // appBar: AppBar(title: Text(MainAppName, style: boldTextStyle(size: 24)), elevation: 0, backgroundColor: appStore.cardColor),
        body: SingleChildScrollView(
          controller: scrollController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,children: [
                 RandomButtonWidget(),
              FollowButtonWidget(),
            ],
            // children: [


            //   showSecondWidget
            //       ? Column(
            //           children: [
            //             Container(
            //               height: 30.h,
            //               child: Text('asasas'),
            //               color: Colors.red,
            //             ),
            //             Container(
            //               height: 30.h,
            //               child: Text('asasas'),
            //               color: Colors.red,
            //             ),
            //             Container(
            //               height: 30.h,
            //               child: Text('asasas'),
            //               color: Colors.red,
            //             ),
            //             Container(
            //               height: 30.h,
            //               child: Text('asasas'),
            //               color: Colors.red,
            //             ),
            //           ],
            //         )
            //       : Container(),

            //   // Container(height: 30.h,child: Text('asasas'),color: Colors.red,),
            //   // AppBannerWidget(),
            //   // Text("Apps & Widgets", style: secondaryTextStyle(size: 16)).paddingAll(16),
            //   // AppListWidget(getAppsAndWidgets()),
            //   Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Text(
            //         "App Settings",
            //       ).paddingOnly(left: 16, right: 16, bottom: 16, top: 16),
            //       IconButton(
            //         onPressed: () async {
            //           setState(() {
            //             showSecondWidget = !showSecondWidget;
            //             showSecondWidget
            //                 ? animationController!.reverse()
            //                 : animationController!.forward();
            //           });
            //           if (!showSecondWidget) {
            //             await Future.delayed(Duration(milliseconds: 440));
            //             scrollController.animToBottom();
            //           }
            //         },
            //         icon: RotationTransition(
            //             turns: animation as Animation<double>,
            //             child: Icon(Icons.arrow_upward_rounded)),
            //       ).paddingRight(16),
            //     ],
            //   ),
            //   AnimatedCrossFade(
            //     firstChild: Column(
            //       children: [
            //         Container(
            //           height: 30.h,
            //           child: Text('asasas'),
            //           color: Colors.blue,
            //         ),
            //         Container(
            //           height: 30.h,
            //           child: Text('asasas'),
            //           color: Colors.blue,
            //         ),
            //         Container(
            //           height: 30.h,
            //           child: Text('asasas'),
            //           color: Colors.blue,
            //         ),
            //         // Container(height: 30.h,child: Text('asasas'),color: Colors.blue,),
            //         // Container(height: 30.h,child: Text('asasas'),color: Colors.blue,),
            //         // Container(height: 30.h,child: Text('asasas'),color: Colors.blue,),
            //         // Container(height: 30.h,child: Text('asasas'),color: Colors.blue,),
            //         // Container(height: 30.h,child: Text('asasas'),color: Colors.blue,),
            //         // Container(height: 30.h,child: Text('asasas'),color: Colors.blue,),
            //         // Container(height: 30.h,child: Text('asasas'),color: Colors.blue,),
            //         // Container(height: 30.h,child: Text('asasas'),color: Colors.blue,),
            //       ],
            //     ),
            //     secondChild: Container(),
            //     duration: Duration(milliseconds: 400),
            //     crossFadeState: showSecondWidget
            //         ? CrossFadeState.showSecond
            //         : CrossFadeState.showFirst,
            //   ),
            // ],
          ),
        ),
      ),
      // ),
    );
  }
}

extension ScrollExtension on ScrollController {
  /// Scroll to bottom with given animation duration
  Future<void> animToBottom({milliseconds = 300}) async {
    this.animateTo(
      this.position.maxScrollExtent,
      duration: Duration(milliseconds: milliseconds),
      curve: Curves.linear,
    );
  }
}



class FollowButtonWidget extends StatefulWidget {
  @override
  _FollowButtonWidgetState createState() => _FollowButtonWidgetState();
}

class _FollowButtonWidgetState extends State<FollowButtonWidget> {
  bool isSmall = true;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {
          setState(() {
            isSmall = !isSmall;
          });
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeIn,
          width: isSmall ? 50 : 200,
          height: 50,
          child: isSmall ? buildShrinked() : buildStretched(),
        ),
      );

  Widget buildStretched() => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.red, width: 2.5),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Center(
          child: FittedBox(
            child: Text(
              'FOLLOW',
              style: TextStyle(
                color: Colors.red,
                letterSpacing: 1.5,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      );

  Widget buildShrinked() => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.red,
        ),
        child: Icon(
          Icons.people,
          color: Colors.white,
        ),
      );
}


class RandomButtonWidget extends StatefulWidget {
  @override
  _RandomButtonWidgetState createState() => _RandomButtonWidgetState();
}

class _RandomButtonWidgetState extends State<RandomButtonWidget> {
  static const double minSize = 50;
  static const double maxSize = 200;

  Color color = Colors.green;
  double width = maxSize;
  double height = maxSize;
  BorderRadius borderRadius = BorderRadius.zero;

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Container(
            color: Colors.black.withOpacity(0.1),
            width: maxSize,
            height: maxSize,
            child: Center(
              child: AnimatedContainer(
                duration: Duration(milliseconds: 500),
                curve: Curves.easeInBack,
                width: width,
                height: height,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: borderRadius,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          RaisedButton(
            shape: StadiumBorder(),
            color: Colors.red,
            child: Text(
              'Do Magic!',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              final random = Random();

              /// Color
              final red = random.nextInt(255);
              final green = random.nextInt(255);
              final blue = random.nextInt(255);
              final color = Color.fromRGBO(red, green, blue, 1);

              /// Size
              final size = generateSize();

              /// BorderRadius
              final borderRadius =
                  BorderRadius.circular(random.nextDouble() * 80);

              setState(() {
                this.color = color;
                this.width = size.width;
                this.height = size.height;
                this.borderRadius = borderRadius;
              });
            },
          ),
        ],
      );

  Size generateSize() {
    final random = Random();

    final addMax = maxSize.toInt() - minSize.toInt();
    final width = minSize + random.nextInt(addMax);
    final height = minSize + random.nextInt(addMax);

    return Size(width, height);
  }
}