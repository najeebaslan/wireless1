import 'package:badges/badges.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:wirless_wifi/animation/info_network_wifi/INFo_Network.dart';
import 'dart:async';
import 'package:wirless_wifi/Auth/Login/utils_Auth.dart';
import 'package:wirless_wifi/Auth/Signup/signup_screen.dart';
import 'package:wirless_wifi/Manager/UI/widget_public.dart';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:example/pages/menu.dart';
import 'package:flutter/material.dart';
import 'package:snapping_sheet/snapping_sheet.dart';
import 'package:expandable_bottom_bar/expandable_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:fluttertoast/fluttertoast.dart';
class MYAnimmation extends StatefulWidget {
  const MYAnimmation({Key? key}) : super(key: key);

  @override
  _MYAnimmationState createState() => _MYAnimmationState();
}

class _MYAnimmationState extends State<MYAnimmation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyRaisedButton(
                  text: 'اميشن قمه',
                  press: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (__) => MyCustomWidgetw()));
                  }),
                  sizedBox(12),
          MyRaisedButton(
                  text: 'سبلاش سكرين',
                  press: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (__) => MyCustomSplashScreen()));
                  }),
                  sizedBox(12),
                      MyRaisedButton(
                  text: ' انميشن لتكست ',
                  press: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (__) => MyCustomWidgete()));
                  }),
                  sizedBox(12),
                      MyRaisedButton(
                  text: 'SliderWidget ',
                  press: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (__) => SliderWidget()));
                  }),
                  sizedBox(12),
                        MyRaisedButton(
                  text: ' اغلاق حقل النص',
                  press: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (__) => KeyboardWidget()));
                  }),
                  sizedBox(12),
                     MyRaisedButton(
                  text: '  عند الضغط علا الزر يدور ثم يضهر علانه صح',
                  press: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (__) => ProgressButtonWidget()));
                  }),
                  sizedBox(12),
          MyRaisedButton(
              text: '  لي انا ادرو بعدهح',
              press: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (__) => MyCustomWidgets()));
              }),
          sizedBox(12),
          MyRaisedButton(
              text: '   انميشن لتنقل بين الصفحاتح',
              press: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (__) => MyCustomTransitions()));
              }),
          sizedBox(12),
          MyRaisedButton(
              text: '  الافضل انميشن لتتقل بين الصفحاتح',
              press: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (__) => MyCustomTransitionsd()));
              }),
          sizedBox(12),
          MyRaisedButton(
              text: ' التعليمات للمستخدم ',
              press: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (__) => MyCustomWidgetf()));
              }),
          sizedBox(12),
          MyRaisedButton(
              text: 'انميشن ضهور الWidget داخل الشاشه ',
              press: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (__) => MyCustomWidgetg()));
              }),
          sizedBox(12),
          MyRaisedButton(
              text: '  يواي ممتاز جدا في الايقونات والالوان',
              press: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (__) => MyCustomUI()));
              }),
          sizedBox(12),
          MyRaisedButton(
              text: ' تحتوي علا Appar ممتاز',
              press: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (__) => MyCustomUIf()));
              }),
          sizedBox(12),
          MyRaisedButton(
              text: '   مهم جدا عند الضغط علا ايقونه اضافه تفاصيل كروت الشبكه يضهر هذا',
              press: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (__) => MyPlugin()));
              }),
          sizedBox(12),
          MyRaisedButton(
            text: '   دايلوج لتاكد من الاتصال با الانترنتا',
            press: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (__) => MyPlugind()));
            }),
          sizedBox(12),
          MyRaisedButton(
              text: ' مهم',
              press: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (__) => MyPlugine()));
              }),
          sizedBox(12),
                MyRaisedButton(
              text: ' InfoNetwork',
              press: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (__) => InfoNetwork()));
              }),
          sizedBox(12),
             MyRaisedButton(
              text: ' BotoomShate',
              press: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (__) => SnappingSheetExampleApp()));
              }),
          sizedBox(12),
           MyRaisedButton(
              text: ' BottomSheetExample',
              press: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (__) => BottomSheetExample()));
              }),
          sizedBox(12),
           MyRaisedButton(
              text: ' MyCustomBottomNavigationBar',
              press: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (__) => MyCustomBottomNavigationBar()));
              }),
          sizedBox(12),
             MyRaisedButton(
              text: 'تنفع لتنقل بين الفئات',
              press: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (__) => MyCustomBottomNavigationBarTow()));
              }),
          sizedBox(12),
                MyRaisedButton(
              text: ' تنفع لتنقل بين الفئات بطريقة غير السابقة',
              press: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (__) => MyCustomBottomNavigationBars()));
              }),
          sizedBox(12),

            ],
          ),
        ),
      ),
    );
  }
}
/* ........................................................................ */
/* ........................................................................ */

//اميشن قمه
class MyCustomWidgetw extends StatefulWidget {
  @override
  _MyCustomWidgetState createState() => _MyCustomWidgetState();
}

class _MyCustomWidgetState extends State<MyCustomWidgetw> {
  String TapToExpandIt = 'Tap to Expand it';
  String Sentence = 'Widgets that have global keys reparent their subtrees when'
      ' they are moved from one location in the tree to another location in the'
      ' tree. In order to reparent its subtree, a widget must arrive at its new'
      ' location in the tree in the same animation frame in which it was removed'
      ' from its old location the tree.'
      ' Widgets that have global keys reparent their subtrees when they are moved'
      ' from one location in the tree to another location in the tree. In order'
      ' to reparent its subtree, a widget must arrive at its new location in the'
      ' tree in the same animation frame in which it was removed from its old'
      ' location the tree.';
  bool isExpanded = true;
  bool isExpanded2 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        children: [
          InkWell(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            child: AnimatedContainer(
              margin: EdgeInsets.symmetric(
                horizontal: isExpanded ? 25 : 0,
                vertical: 20,
              ),
              padding: EdgeInsets.all(20),
              height: isExpanded ? 70 : 330,
              curve: Curves.fastLinearToSlowEaseIn,
              duration: Duration(milliseconds: 1200),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color(0xff6F12E8).withOpacity(0.5),
                    blurRadius: 20,
                    offset: Offset(5, 10),
                  ),
                ],
                color: Color(0xff6F12E8),
                borderRadius: BorderRadius.all(
                  Radius.circular(isExpanded ? 20 : 0),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          TapToExpandIt,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Icon(
                          isExpanded
                              ? Icons.keyboard_arrow_down
                              : Icons.keyboard_arrow_up,
                          color: Colors.white,
                          size: 27,
                        ),
                      ],
                    ),
                    isExpanded ? SizedBox() : SizedBox(height: 20),
                    AnimatedCrossFade(
                      firstChild: Text(
                        '',
                        style: TextStyle(
                          fontSize: 0,
                        ),
                      ),
                      secondChild: Text(
                        Sentence,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.7,
                        ),
                      ),
                      crossFadeState: isExpanded
                          ? CrossFadeState.showFirst
                          : CrossFadeState.showSecond,
                      duration: Duration(milliseconds: 1200),
                      reverseDuration: Duration.zero,
                      sizeCurve: Curves.fastLinearToSlowEaseIn,
                    ),
                  ],
                ),
              ),
            ),
          ),
          InkWell(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: () {
              setState(() {
                isExpanded2 = !isExpanded2;
              });
            },
            child: AnimatedContainer(
              margin: EdgeInsets.symmetric(
                horizontal: isExpanded2 ? 25 : 0,
                vertical: 20,
              ),
              padding: EdgeInsets.all(20),
              height: isExpanded2 ? 70 : 330,
              curve: Curves.fastLinearToSlowEaseIn,
              duration: Duration(milliseconds: 1200),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color(0xffFF5050).withOpacity(0.5),
                    blurRadius: 20,
                    offset: Offset(5, 10),
                  ),
                ],
                color: Color(0xffFF5050),
                borderRadius: BorderRadius.all(
                  Radius.circular(isExpanded2 ? 20 : 0),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          TapToExpandIt,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Icon(
                          isExpanded2
                              ? Icons.keyboard_arrow_down
                              : Icons.keyboard_arrow_up,
                          color: Colors.white,
                          size: 27,
                        ),
                      ],
                    ),
                    isExpanded2 ? SizedBox() : SizedBox(height: 20),
                    AnimatedCrossFade(
                      firstChild: Text(
                        '',
                        style: TextStyle(
                          fontSize: 0,
                        ),
                      ),
                      secondChild: Text(
                        Sentence,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.7,
                        ),
                      ),
                      crossFadeState: isExpanded2
                          ? CrossFadeState.showFirst
                          : CrossFadeState.showSecond,
                      duration: Duration(milliseconds: 1200),
                      reverseDuration: Duration.zero,
                      sizeCurve: Curves.fastLinearToSlowEaseIn,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/* ....................................................................... */
/* ....................................................................... */

//سبلاش سكرين

class MyCustomSplashScreen extends StatefulWidget {
  @override
  _MyCustomSplashScreenState createState() => _MyCustomSplashScreenState();
}

class _MyCustomSplashScreenState extends State<MyCustomSplashScreen>
    with TickerProviderStateMixin {
  double _fontSize = 2;
  double _containerSize = 1.5;
  double _textOpacity = 0.0;
  double _containerOpacity = 0.0;

  AnimationController? _controller;
  Animation<double>? animation1;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3));

    animation1 = Tween<double>(begin: 40, end: 20).animate(CurvedAnimation(
        parent: _controller!, curve: Curves.fastLinearToSlowEaseIn))
      ..addListener(() {
        setState(() {
          _textOpacity = 1.0;
        });
      });

    _controller!.forward();

    Timer(Duration(seconds: 2), () {
      setState(() {
        _fontSize = 1.06;
      });
    });

    Timer(Duration(seconds: 2), () {
      setState(() {
        _containerSize = 2;
        _containerOpacity = 1;
      });
    });

    Timer(Duration(seconds: 4), () {
      setState(() {
        Navigator.pushReplacement(context, PageTransition(SecondPage()));
      });
    });
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Stack(
        children: [
          Column(
            children: [
              AnimatedContainer(
                  duration: Duration(milliseconds: 2000),
                  curve: Curves.fastLinearToSlowEaseIn,
                  height: _height / _fontSize),
              AnimatedOpacity(
                duration: Duration(milliseconds: 1000),
                opacity: _textOpacity,
                child: Text(
                  'YOUR APP\'S NAME',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: animation1!.value,
                  ),
                ),
              ),
            ],
          ),
          Center(
            child: AnimatedOpacity(
              duration: Duration(milliseconds: 2000),
              curve: Curves.fastLinearToSlowEaseIn,
              opacity: _containerOpacity,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 2000),
                curve: Curves.fastLinearToSlowEaseIn,
                height: _width / _containerSize,
                width: _width / _containerSize,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                // child: Image.asset('assets/images/file_name.png')
                child: Text(
                  'YOUR APP\'S LOGO',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PageTransition extends PageRouteBuilder {
  final Widget page;

  PageTransition(this.page)
      : super(
          pageBuilder: (context, animation, anotherAnimation) => page,
          transitionDuration: Duration(milliseconds: 2000),
          transitionsBuilder: (context, animation, anotherAnimation, child) {
            animation = CurvedAnimation(
              curve: Curves.fastLinearToSlowEaseIn,
              parent: animation,
            );
            return Align(
              alignment: Alignment.bottomCenter,
              child: SizeTransition(
                sizeFactor: animation,
                child: page,
                axisAlignment: 0,
              ),
            );
          },
        );
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        brightness: Brightness.dark,
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        title: Text(
          'YOUR APP\'S NAME',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}

/* ....................................................................... */
/* ....................................................................... */

//انميشن لتكست

class MyCustomWidgete extends StatefulWidget {
  @override
  _MyCustomWidgetStatef createState() => _MyCustomWidgetStatef();
}

class _MyCustomWidgetStatef extends State<MyCustomWidgete> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SlideFadeTransition(
              curve: Curves.elasticOut,
              delayStart: Duration(milliseconds: 500),
              animationDuration: Duration(milliseconds: 1200),
              offset: 2.5,
              direction: Direction.horizontal,
              child: Text(
                'Hello! I\'m gonna animate.',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            SlideFadeTransition(
              curve: Curves.elasticOut,
              delayStart: Duration(milliseconds: 1000),
              animationDuration: Duration(milliseconds: 1200),
              offset: 2.5,
              direction: Direction.vertical,
              child: Text(
                'Hello! I\'m gonna animate.',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            SlideFadeTransition(
              delayStart: Duration(milliseconds: 1000),
              animationDuration: Duration(milliseconds: 700),
              child: Text(
                'Hello! I\'m gonna animate.\nHello! I\'m gonna animate.',
                style: TextStyle(fontSize: 20),
              ),
            ),
            SlideFadeTransition(
              curve: Curves.elasticOut,
              delayStart: Duration(milliseconds: 1800),
              animationDuration: Duration(milliseconds: 1200),
              offset: -2.5,
              direction: Direction.vertical,
              child: Text(
                'Hello! I\'m gonna animate.',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            SlideFadeTransition(
              delayStart: Duration(milliseconds: 2300),
              animationDuration: Duration(milliseconds: 1000),
              curve: Curves.fastLinearToSlowEaseIn,
              offset: 5,
              child: Text(
                'Hello! I\'m gonna animate.\nHello! I\'m gonna animate.',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

enum Direction { vertical, horizontal }

class SlideFadeTransition extends StatefulWidget {
  final Widget child;

  final double offset;

  final Curve curve;

  final Direction direction;

  final Duration delayStart;

  final Duration animationDuration;

  SlideFadeTransition({
    required this.child,
    this.offset = 1.0,
    this.curve = Curves.easeIn,
    this.direction = Direction.vertical,
    this.delayStart = const Duration(seconds: 0),
    this.animationDuration = const Duration(milliseconds: 800),
  });

  @override
  _SlideFadeTransitionState createState() => _SlideFadeTransitionState();
}

class _SlideFadeTransitionState extends State<SlideFadeTransition>
    with SingleTickerProviderStateMixin {
  Animation<Offset>? _animationSlide;

  AnimationController? _animationController;

  Animation<double>? _animationFade;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
    );

    if (widget.direction == Direction.vertical) {
      _animationSlide =
          Tween<Offset>(begin: Offset(0, widget.offset), end: Offset(0, 0))
              .animate(CurvedAnimation(
        curve: widget.curve,
        parent: _animationController!,
      ));
    } else {
      _animationSlide =
          Tween<Offset>(begin: Offset(widget.offset, 0), end: Offset(0, 0))
              .animate(CurvedAnimation(
        curve: widget.curve,
        parent: _animationController!,
      ));
    }

    _animationFade =
        Tween<double>(begin: -1.0, end: 1.0).animate(CurvedAnimation(
      curve: widget.curve,
      parent: _animationController!,
    ));

    Timer(widget.delayStart, () {
      _animationController!.forward();
    });
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animationFade!,
      child: SlideTransition(
        position: _animationSlide!,
        child: widget.child,
      ),
    );
  }
}

/* ....................................................................... */
/* ....................................................................... */
// مهم جدا







// import this Package in pubspec.yaml file
// dependencies:
// 
//   animations: ^1.0.0+5


// import 'package:animations/animations.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class MyCustomWidget extends StatefulWidget {
//   @override
//   _MyCustomWidgetState createState() => _MyCustomWidgetState();
// }

// class _MyCustomWidgetState extends State<MyCustomWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: OpenContainer(
//           closedBuilder: (_, openContainer) {
//             return Container(
//               height: 200,
//               width: 200,
//               child: IconButton(
//                 splashColor: Colors.transparent,
//                 highlightColor: Colors.transparent,
//                 onPressed: openContainer,
//                 icon: Icon(
//                   Icons.arrow_forward,
//                   size: 30,
//                   color: Colors.black.withOpacity(0.8),
//                 ),
//               ),
//             );
//           },
//           openColor: Colors.white,
//           closedElevation: 50.0,
//           closedShape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(100),
//           ),
//           closedColor: Colors.white,
//           openBuilder: (_, closeContainer) {
//             return Scaffold(
//               appBar: AppBar(
//                 backgroundColor: Colors.blue,
//                 title: Text('Go back'),
//                 leading: IconButton(
//                   onPressed: closeContainer,
//                   icon: Icon(Icons.arrow_back, color: Colors.white),
//                 ),
//               ),
//             );
//           },
//         ),
      // ),
    // );
  // }
// }
/* ....................................................................... */
/* ....................................................................... */


class SliderWidget extends StatefulWidget {
  @override
  _SliderWidgetState createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  PageController _pageController = PageController(initialPage: 1); //索引从0开始，因为有增补，所以这里设为1
  int _currentIndex = 1;
  List<String> _images = [
    'assets/wifi-icon.png',
     'assets/wifiicons.png',
   'assets/wifi-icon.png',
     'assets/wifiicons.png', 
     'assets/wifi-icon.png',
     'assets/wifiicons.png',
    'assets/wifi-icon.png',
     'assets/wifiicons.png'
  ];
  Timer ?_timer;

  @override
  void initState() {
    print(_images.asMap());
    if (_images.length > 0) {
      _setTimer();
    }
    super.initState();
  }

  _setTimer(  ) {
    _timer = Timer.periodic(Duration(seconds: 3), (_timer  ) {
      _pageController.animateToPage(
        _currentIndex + 1,
        duration: Duration(milliseconds: 400),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    List addedImages = [];
    if (_images.length > 0) {
      addedImages
        ..add(_images[_images.length - 1])
        ..addAll(_images)
        ..add(_images[0]);
    }
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Stack(
        children: [
          NotificationListener(
            onNotification: (ScrollNotification notification) {
              if (notification.depth == 0 && notification is ScrollStartNotification) {
                if (notification.dragDetails != null) {
                  _timer!.cancel();
                }
              } else if (notification is ScrollEndNotification) {
                _timer!.cancel();
                _setTimer();
              }
              return true;
            },
            child: _images.length > 0
                ? PageView(
                    physics: BouncingScrollPhysics(),
                    controller: _pageController,
                    onPageChanged: (page) {
                      int newIndex;
                      if (page == addedImages.length - 1) {
                        newIndex = 1;
                        _pageController.jumpToPage(newIndex);
                      } else if (page == 0) {
                        newIndex = addedImages.length - 2;
                        _pageController.jumpToPage(newIndex);
                      } else {
                        newIndex = page;
                      }
                      setState(() {
                        _currentIndex = newIndex;
                      });
                    },
                    children: addedImages
                        .map((item) => Container(
                              margin: EdgeInsets.all(10),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: Image.asset(
                                  item,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ))
                        .toList(),
                  )
                : Container(),
          ),
          Positioned(
            bottom: 15,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: _images
                  .asMap()
                  .map((i, v) => MapEntry(
                      i,
                      Container(
                        width: 6,
                        height: 6,
                        margin: EdgeInsets.only(left: 2, right: 2),
                        decoration: ShapeDecoration(
                          color: _currentIndex == i + 1 ? Colors.red : Colors.white,
                          shape: CircleBorder(),
                        ),
                      )))
                  .values
                  .toList(),
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
/* ....................................................................... */
/* ....................................................................... */
// اغلاق حقل النص




class KeyboardWidget extends StatefulWidget {
  @override
  _KeyboardWidgetState createState() => _KeyboardWidgetState();
}

class _KeyboardWidgetState extends State<KeyboardWidget>
    with WidgetsBindingObserver {
  var isShowUp = false;
  var focusNode = FocusNode();

  void dismissKeyboard(BuildContext context) {
    FocusScope.of(context).unfocus();
  }

  void showKeyboard(BuildContext context) {
    final focusScope = FocusScope.of(context);
    focusScope.requestFocus(FocusNode());
    Future.delayed(Duration.zero, () => focusScope.requestFocus(focusNode));
  }

  @override
  void initState() {
    WidgetsBinding.instance!.addObserver(this);
    super.initState();
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      setState(() => isShowUp = window.viewInsets.bottom > 0);
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          TextField(focusNode: focusNode),
          RaisedButton(
            onPressed: () {
              dismissKeyboard(context);
            },
            child: Text('Close keyboard'),
          ),
          RaisedButton(
            onPressed: () {
              showKeyboard(context);
            },
            child: Text('Show keyboard'),
          ),
          Text('Whether to bounce：$isShowUp')
        ],
      ),
    );
  }
}
/* ....................................................................... */
/* ....................................................................... */
// عند الضغط علا الزر يدور ثم يضهر علانه صح 



class ProgressButtonWidget extends StatefulWidget {
  @override
  _ProgressButtonWidgetState createState() => _ProgressButtonWidgetState();
}

class _ProgressButtonWidgetState extends State<ProgressButtonWidget> with TickerProviderStateMixin {
  int _state = 0;
  Animation? _animation;
  AnimationController ?_controller;
  GlobalKey _globalKey = GlobalKey();
  double _width = double.maxFinite;

  @override
  void dispose() {
    super.dispose();
    _controller!.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
            ),
            child: Align(
              alignment: Alignment.center,
              child: PhysicalModel(
                elevation: 8,
                shadowColor: Colors.lightGreenAccent,
                color: Colors.lightGreen,
                borderRadius: BorderRadius.circular(25),
                child: Container(
                  key: _globalKey,
                  height: 48,
                  width: _width,
                  child: RaisedButton(
                    animationDuration: Duration(milliseconds: 1000),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    padding: EdgeInsets.all(0),
                    child: setUpButtonChild(),
                    onPressed: () {
                      setState(() {
                        if (_state == 0) {
                          animateButton();
                        }
                      });
                    },
                    elevation: 4,
                    color: Colors.lightGreen,
                  ),
                ),
              ),
            ),
          ),
        
      ),
    );
  }

   setUpButtonChild() {
    if (_state == 0) {
      return Text(
        "Click Here",
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      );
    } else if (_state == 1) {
      return SizedBox(
        height: 36,
        width: 36,
        child: CircularProgressIndicator(
          value: null,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      );
    } else {
      return Icon(Icons.check, color: Colors.white);
    }
  }

  void animateButton() {
    double initialWidth = _globalKey.currentContext!.size!.width;

    _controller =
        AnimationController(duration: Duration(milliseconds: 300), vsync: this);

    _animation = Tween(begin: 0.0, end: 1).animate(_controller!)
      ..addListener(() {
        setState(() {
          _width = initialWidth - ((initialWidth - 48) * _animation!.value);
        });
      });
    _controller!.forward();

    setState(() {
      _state = 1;
    });

    Timer(Duration(milliseconds: 3300), () {
      setState(() {
        _state = 2;
      });
    });
  }
}
/* ....................................................................... */
/* ....................................................................... */
// مهم مهم جدا الي ادوه بعده 

/* ....................................................................... */
/* ....................................................................... */



class MyHomePage2 extends StatefulWidget {
  const MyHomePage2({Key? key}) : super(key: key);

  @override
  _MyHomePageStates createState() => _MyHomePageStates();
}

class _MyHomePageStates extends State<MyHomePage2> {
  String? searchString;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: OpenContainer<String>(
            openBuilder: (_, closeContainer) => SearchPage(closeContainer),
            onClosed: (res) => setState(() {
              searchString = res;
            }),
            tappable: false,
            closedBuilder: (_, openContainer) => SearchBar(
              searchString: searchString!,
              openContainer: openContainer,
            ),
          ),
        ),
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar(
      {Key? key, required this.searchString, required this.openContainer})
      : super(key: key);

  final String searchString;
  final VoidCallback openContainer;
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3,
      borderRadius: BorderRadius.circular(5),
      child: InkWell(
        onTap: openContainer,
        child: Container(
          padding: EdgeInsets.all(10),
          color: Colors.white,
          child: Row(
            children: [
              Icon(Icons.search),
              SizedBox(width: 10),
              searchString != null
                  ? Expanded(child: Text(searchString))
                  : Spacer(),
              Icon(Icons.mic),
            ],
          ),
        ),
      ),
    );
  }
}

class SearchPage extends StatelessWidget {
  const SearchPage(
    this.onClose, {
    Key? key,
  }) : super(key: key);

  final void Function({String returnValue}) onClose;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 2),
                    spreadRadius: 0,
                    blurRadius: 1,
                    color: Colors.black26,
                  )
                ],
                color: Colors.white,
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: onClose,
                  ),
                  Spacer(),
                  Icon(Icons.mic),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  OutlineButton(
                    onPressed: () => onClose(returnValue: 'Flutter'),
                    child: Text('Search: "Flutter"'),
                  ),
                  OutlineButton(
                    onPressed: () => onClose(returnValue: 'Rabbit'),
                    child: Text('Search: "Rabbit"'),
                  ),
                  OutlineButton(
                    onPressed: () => onClose(returnValue: 'What is the Matrix'),
                    child: Text('Search: "What is the Matrix"'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
/* ....................................................................... */
/* ....................................................................... */
//  Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.




class _BottomPicker extends StatelessWidget {
  const _BottomPicker({
    Key? key,
    required this.child,
  })  : assert(child != null),
        super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 216,
      padding: const EdgeInsets.only(top: 6),
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      color: CupertinoColors.systemBackground.resolveFrom(context),
      child: DefaultTextStyle(
        style: TextStyle(
          color: CupertinoColors.label.resolveFrom(context),
          fontSize: 22,
        ),
        child: GestureDetector(
          // Blocks taps from propagating to the modal sheet and popping.
          onTap: () {},
          child: SafeArea(
            top: false,
            child: child,
          ),
        ),
      ),
    );
  }
}

class _Menu extends StatelessWidget {
  const _Menu({
    Key? key,
    required this.children,
  })  : assert(children != null),
        super(key: key);

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: CupertinoColors.inactiveGray, width: 0),
          bottom: BorderSide(color: CupertinoColors.inactiveGray, width: 0),
        ),
      ),
      height: 44,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: children,
        ),
      ),
    );
  }
}

/////////////////////////////////////////////////////////////////////////////////////////////////
// لي انا ادرو بعده


class MyCustomWidgets extends StatefulWidget {
  @override
  _MyCustomWidgetStates createState() => _MyCustomWidgetStates();
}

class _MyCustomWidgetStates extends State<MyCustomWidgets> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: OpenContainer(
          closedBuilder: (_, openContainer) {
            return Container(
              height: 200,
              width: 200,
              child: IconButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: openContainer,
                icon: Icon(
                  Icons.arrow_forward,
                  size: 30,
                  color: Colors.black.withOpacity(0.8),
                ),
              ),
            );
          },
          openColor: Colors.white,
          closedElevation: 50.0,
          closedShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          closedColor: Colors.white,
          openBuilder: (_, closeContainer) {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.blue,
                title: Text('Go back'),
                leading: IconButton(
                  onPressed: closeContainer,
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

}

/////////////////////////////////////////////////////////////////////////////////////////////
// انميشن لتنقل بين الصفحات

class MyCustomTransitions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
              onPressed: () =>
                  Navigator.push(context, SizeTransition1(SecondPage())),
              child: Text('TAP TO VIEW SIZE ANIMATION 1')),
          ElevatedButton(
              onPressed: () =>
                  Navigator.push(context, SizeTransition2(SecondPage())),
              child: Text('TAP TO VIEW SIZE ANIMATION 2')),
          ElevatedButton(
              onPressed: () =>
                  Navigator.push(context, SizeTransition3(SecondPage())),
              child: Text('TAP TO VIEW SIZE ANIMATION 3')),
          ElevatedButton(
              onPressed: () =>
                  Navigator.push(context, SizeTransition4(SecondPage())),
              child: Text('TAP TO VIEW SIZE ANIMATION 4')),
          ElevatedButton(
              onPressed: () =>
                  Navigator.push(context, SizeTransition5(SecondPage())),
              child: Text('TAP TO VIEW SIZE ANIMATION 5')),
        ],
      ),
    );
  }
}

class SizeTransition1 extends PageRouteBuilder {
  final Widget page;

  SizeTransition1(this.page)
      : super(
    pageBuilder: (context, animation, anotherAnimation) => page,
    transitionDuration: Duration(milliseconds: 1000),
    reverseTransitionDuration: Duration(milliseconds: 200),
    transitionsBuilder: (context, animation, anotherAnimation, child) {
      animation = CurvedAnimation(
          curve: Curves.fastLinearToSlowEaseIn,
          parent: animation,
          reverseCurve: Curves.fastOutSlowIn);
      return Align(
        alignment: Alignment.bottomCenter,
        child: SizeTransition(
          sizeFactor: animation,
          child: page,
          axisAlignment: 0,
        ),
      );
    },
  );
}

class SizeTransition2 extends PageRouteBuilder {
  final Widget page;

  SizeTransition2(this.page)
      : super(
    pageBuilder: (context, animation, anotherAnimation) => page,
    transitionDuration: Duration(milliseconds: 1000),
    reverseTransitionDuration: Duration(milliseconds: 200),
    transitionsBuilder: (context, animation, anotherAnimation, child) {
      animation = CurvedAnimation(
          curve: Curves.fastLinearToSlowEaseIn,
          parent: animation,
          reverseCurve: Curves.fastOutSlowIn);
      return Align(
        alignment: Alignment.topCenter,
        child: SizeTransition(
          sizeFactor: animation,
          child: page,
          axisAlignment: 0,
        ),
      );
    },
  );
}

class SizeTransition3 extends PageRouteBuilder {
  final Widget page;

  SizeTransition3(this.page)
      : super(
    pageBuilder: (context, animation, anotherAnimation) => page,
    transitionDuration: Duration(milliseconds: 1000),
    reverseTransitionDuration: Duration(milliseconds: 200),
    transitionsBuilder: (context, animation, anotherAnimation, child) {
      animation = CurvedAnimation(
          curve: Curves.fastLinearToSlowEaseIn,
          parent: animation,
          reverseCurve: Curves.fastOutSlowIn);
      return Align(
        alignment: Alignment.center,
        child: SizeTransition(
          axis: Axis.horizontal,
          sizeFactor: animation,
          child: page,
          axisAlignment: 0,
        ),
      );
    },
  );
}

class SizeTransition4 extends PageRouteBuilder {
  final Widget page;

  SizeTransition4(this.page)
      : super(
    pageBuilder: (context, animation, anotherAnimation) => page,
    transitionDuration: Duration(milliseconds: 1000),
    reverseTransitionDuration: Duration(milliseconds: 200),
    transitionsBuilder: (context, animation, anotherAnimation, child) {
      animation = CurvedAnimation(
          curve: Curves.fastLinearToSlowEaseIn,
          parent: animation,
          reverseCurve: Curves.fastOutSlowIn);
      return Align(
        alignment: Alignment.centerLeft,
        child: SizeTransition(
          axis: Axis.horizontal,
          sizeFactor: animation,
          child: page,
          axisAlignment: 0,
        ),
      );
    },
  );
}

class SizeTransition5 extends PageRouteBuilder {
  final Widget page;

  SizeTransition5(this.page)
      : super(
    pageBuilder: (context, animation, anotherAnimation) => page,
    transitionDuration: Duration(milliseconds: 1000),
    reverseTransitionDuration: Duration(milliseconds: 200),
    transitionsBuilder: (context, animation, anotherAnimation, child) {
      animation = CurvedAnimation(
          curve: Curves.fastLinearToSlowEaseIn,
          parent: animation,
          reverseCurve: Curves.fastOutSlowIn);
      return Align(
        alignment: Alignment.centerRight,
        child: SizeTransition(
          axis: Axis.horizontal,
          sizeFactor: animation,
          child: page,
          axisAlignment: 0,
        ),
      );
    },
  );
}

class SecondPagee extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        brightness: Brightness.dark,
        centerTitle: true,
        title: Text('Size Transition'),
      ),
    );
  }
}


////////////////////////////////////////////////////////////////////////////////////////////////////////
// الافضل انميشن لتتقل بين الصفحات


class MyCustomTransitionsd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
              onPressed: () => Navigator.push(
                  context, SlideTransition1(SecondPaged())),
              child: Text('TAP TO VIEW SLIDE ANIMATION 1')),
          ElevatedButton(
              onPressed: () => Navigator.push(
                  context, SlideTransition2(SecondPaged())),
              child: Text('TAP TO VIEW SLIDE ANIMATION 2')),
        ],
      ),
    );
  }
}



class SlideTransition1 extends PageRouteBuilder {
  final Widget page;

  SlideTransition1(this.page)
      : super(
      pageBuilder: (context, animation, anotherAnimation) => page,
      transitionDuration: Duration(milliseconds: 1000),
      reverseTransitionDuration: Duration(milliseconds: 400),
      transitionsBuilder: (context, animation, anotherAnimation, child) {
        animation = CurvedAnimation(
            curve: Curves.fastLinearToSlowEaseIn,
            parent: animation,
            reverseCurve: Curves.fastOutSlowIn);
        return SlideTransition(
          position: Tween(begin: Offset(1.0, 0.0), end: Offset(0.0, 0.0))
              .animate(animation),
          child: page,
        );
      });
}

class SlideTransition2 extends PageRouteBuilder {
  final Widget page;

  SlideTransition2(this.page)
      : super(
      pageBuilder: (context, animation, anotherAnimation) => page,
      transitionDuration: Duration(milliseconds: 1000),
      reverseTransitionDuration: Duration(milliseconds: 400),
      transitionsBuilder: (context, animation, anotherAnimation, child) {
        animation = CurvedAnimation(
            curve: Curves.fastLinearToSlowEaseIn,
            parent: animation,
            reverseCurve: Curves.fastOutSlowIn);
        
        return SlideTransition(
          position: Tween(begin: Offset(1.0, 0.0), end: Offset(0.0, 0.0))
              .animate(animation),
          textDirection: TextDirection.rtl,
          child: page,
        );
      });
}



class SecondPaged extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        brightness: Brightness.dark,
        centerTitle: true,
        title: Text('Slide Transition'),
      ),
    );
  }
}



/////////////////////////////////////////////////////////////////////////////////////////////
// التعليمات للمستخدم
// import this Package in pubspec.yaml file
// dependencies:
//
//   fab_circular_menu: ^1.0.2


class MyCustomWidgetf extends StatelessWidget {

  final GlobalKey<FabCircularMenuState> fabKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          color: Color(0xFF192A56),
          child: Center(
            child: RaisedButton(
              onPressed: () {
                // The menu can be handled programatically using a key
                if (fabKey.currentState!.isOpen) {
                  fabKey.currentState!.close();
                } else {
                  fabKey.currentState!.open();
                }
              },
              color: Colors.white,
              child: Text('Toggle menu programatically', style: TextStyle(color: primaryColor)),
            ),
          ),
        ),
        floatingActionButton: Builder(
          builder: (context) => FabCircularMenu(
            key: fabKey,
            // Cannot be `Alignment.center`
            alignment: Alignment.bottomRight,
            ringColor: Colors.white.withAlpha(25),
            ringDiameter: 500.0,
            ringWidth: 150.0,
            fabSize: 64.0,
            fabElevation: 8.0,
            fabIconBorder: CircleBorder(),
            // Also can use specific color based on wether
            // the menu is open or not:
            // fabOpenColor: Colors.white
            // fabCloseColor: Colors.white
            // These properties take precedence over fabColor
            fabColor: Colors.white,
            fabOpenIcon: Icon(Icons.menu, color: primaryColor),
            fabCloseIcon: Icon(Icons.close, color: primaryColor),
            fabMargin: const EdgeInsets.all(16.0),
            animationDuration: const Duration(milliseconds: 800),
            animationCurve: Curves.easeInOutCirc,
            onDisplayChange: (isOpen) {
              _showSnackBar(context, "The menu is ${isOpen ? "open" : "closed"}");
            },
            children: <Widget>[
              RawMaterialButton(
                onPressed: () {
                  _showSnackBar(context, "You pressed 1");
                },
                shape: CircleBorder(),
                padding: const EdgeInsets.all(24.0),
                child: Icon(Icons.looks_one, color: Colors.white),
              ),
              RawMaterialButton(
                onPressed: () {
                  _showSnackBar(context, "You pressed 2");
                },
                shape: CircleBorder(),
                padding: const EdgeInsets.all(24.0),
                child: Icon(Icons.looks_two, color: Colors.white),
              ),
              RawMaterialButton(
                onPressed: () {
                  _showSnackBar(context, "You pressed 3");
                },
                shape: CircleBorder(),
                padding: const EdgeInsets.all(24.0),
                child: Icon(Icons.looks_3, color: Colors.white),
              ),
              RawMaterialButton(
                onPressed: () {
                  _showSnackBar(context, "You pressed 4. This one closes the menu on tap");
                  fabKey.currentState!.close();
                },
                shape: CircleBorder(),
                padding: const EdgeInsets.all(24.0),
                child: Icon(Icons.looks_4, color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          duration: const Duration(milliseconds: 1000),
        )
    );
  }
}


////////////////////////////////////////////////////////////////////////////////////////////////
// انميشن ضهور الWidget داخل الشاشه




class MyCustomWidgetg extends StatefulWidget {
  @override
  _MyCustomWidgetStateg createState() => _MyCustomWidgetStateg();
}

class _MyCustomWidgetStateg extends State<MyCustomWidgetg> {
  @override
  Widget build(BuildContext c) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text('VIEW ANIMATING LISTVIEW'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SlideAnimation4()),
            );
          },
        ),
      ),
    );
  }
}


class SlideAnimation4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Go Back"),
        centerTitle: true,
        brightness: Brightness.dark,
      ),
      body: AnimationLimiter(
        child: ListView.builder(
          padding: EdgeInsets.all(_w / 30),
          physics:
          BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          itemCount: 20,
          itemBuilder: (BuildContext context, int index) {
            return AnimationConfiguration.staggeredList(
              position: index,
              delay: Duration(milliseconds: 100),
              child: SlideAnimation(
                duration: Duration(milliseconds: 2500),
                curve: Curves.fastLinearToSlowEaseIn,
                verticalOffset: -250,
                child: ScaleAnimation(
                  duration: Duration(milliseconds: 1500),
                  curve: Curves.fastLinearToSlowEaseIn,
                  child: Container(
                    margin: EdgeInsets.only(bottom: _w / 20),
                    height: _w / 4,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 40,
                          spreadRadius: 10,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}


// يواي ممتاز جدا في الايقونات والالوان

class MyCustomUI extends StatefulWidget {
  @override
  _MyCustomUIState createState() => _MyCustomUIState();
}

class _MyCustomUIState extends State<MyCustomUI>
    with SingleTickerProviderStateMixin {
  AnimationController ?_controller;
  Animation<double> ?_animation;
  Animation<double>? _animation2;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    _animation = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: _controller!, curve: Curves.easeOut))
      ..addListener(() {
        setState(() {});
      });

    _animation2 = Tween<double>(begin: -30, end: 0)
        .animate(CurvedAnimation(parent: _controller!, curve: Curves.easeOut));

    _controller!.forward();
    _controller!.forward();
  }

  @override
  void dispose() {
    _controller!.dispose();
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          /// ListView
          ListView(
            physics:
            BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(_w / 17, _w / 20, 0, _w / 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'YOUR APP\'S NAME',
                      style: TextStyle(
                        fontSize: 27,
                        color: Colors.black.withOpacity(.6),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: _w / 35),
                    Text(
                      'Here you can write something\nabout your app.',
                      style: TextStyle(
                        fontSize: 19,
                        color: Colors.black.withOpacity(.5),
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
              homePageCardsGroup(
                Color(0xfff37736),
                Icons.analytics_outlined,
                'Example example',
                context,
                RouteWhereYouGo(),
                Color(0xffFF6D6D),
                Icons.all_inclusive,
                'Example example example',
                RouteWhereYouGo(),
              ),
              homePageCardsGroup(
                  Colors.lightGreen,
                  Icons.gamepad_outlined,
                  'Example example',
                  context,
                  RouteWhereYouGo(),
                  Color(0xffffa700),
                  Icons.article,
                  'Example example',
                  RouteWhereYouGo()),
              homePageCardsGroup(
                  Color(0xff63ace5),
                  Icons.ad_units_outlined,
                  'Example example example',
                  context,
                  RouteWhereYouGo(),
                  Color(0xfff37736),
                  Icons.article_sharp,
                  'Example example',
                  RouteWhereYouGo()),
              homePageCardsGroup(
                  Color(0xffFF6D6D),
                  Icons.android,
                  'Example example',
                  context,
                  RouteWhereYouGo(),
                  Colors.lightGreen,
                  Icons.text_format,
                  'Example',
                  RouteWhereYouGo()),
              homePageCardsGroup(
                  Color(0xffffa700),
                  Icons.text_fields,
                  'Example',
                  context,
                  RouteWhereYouGo(),
                  Color(0xff63ace5),
                  Icons.calendar_today_sharp,
                  'Example example',
                  RouteWhereYouGo()),
              SizedBox(height: _w / 20),
            ],
          ),

          /// SETTING ICON
          Padding(
            padding: EdgeInsets.fromLTRB(0, _w / 9.5, _w / 15, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: () {
                    HapticFeedback.lightImpact();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return RouteWhereYouGo();
                        },
                      ),
                    );
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(99)),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaY: 5, sigmaX: 5),
                      child: Container(
                        height: _w / 8.5,
                        width: _w / 8.5,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(.05),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.settings,
                            size: _w / 17,
                            color: Colors.black.withOpacity(.6),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Blur the Status bar
          blurTheStatusBar(context),
        ],
      ),
    );
  }

  Widget homePageCardsGroup(
      Color color,
      IconData icon,
      String title,
      BuildContext context,
      Widget route,
      Color color2,
      IconData icon2,
      String title2,
      Widget route2) {
    double _w = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(bottom: _w / 17),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          homePageCard(color, icon, title, context, route),
          homePageCard(color2, icon2, title2, context, route2),
        ],
      ),
    );
  }

  Widget homePageCard(Color color, IconData icon, String title,
      BuildContext context, Widget route) {
    double _w = MediaQuery.of(context).size.width;
    return Opacity(
      opacity: _animation!.value,
      child: Transform.translate(
        offset: Offset(0, _animation2!.value),
        child: InkWell(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: () {
            HapticFeedback.lightImpact();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return route;
                },
              ),
            );
          },
          child: Container(
            padding: EdgeInsets.all(15),
            height: _w / 2,
            width: _w / 2.4,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Color(0xff040039).withOpacity(.15),
                  blurRadius: 99,
                ),
              ],
              borderRadius: BorderRadius.all(
                Radius.circular(25),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(),
                Container(
                  height: _w / 8,
                  width: _w / 8,
                  decoration: BoxDecoration(
                    color: color.withOpacity(.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    icon,
                    color: color.withOpacity(.6),
                  ),
                ),
                Text(
                  title,
                  maxLines: 4,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black.withOpacity(.5),
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget blurTheStatusBar(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaY: 5, sigmaX: 5),
        child: Container(
          height: _w / 18,
          color: Colors.transparent,
        ),
      ),
    );
  }
}

class RouteWhereYouGo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        elevation: 50,
        centerTitle: true,
        shadowColor: Colors.black.withOpacity(.5),
        title: Text(
          'EXAMPLE  PAGE',
          style: TextStyle(
              color: Colors.black.withOpacity(.7),
              fontWeight: FontWeight.w600,
              letterSpacing: 1),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black.withOpacity(.8),
          ),
          onPressed: () => Navigator.maybePop(context),
        ),
      ),
    );
  }
}


/////////////////////////////////////////////////////////////////////////////////////////////////
//تحتوي علا Appar ممتاز


class MyCustomUIf extends StatefulWidget {
  @override
  _MyCustomUIStatef createState() => _MyCustomUIStatef();
}

class _MyCustomUIStatef extends State<MyCustomUIf>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double> ?_animation;
  Animation<double>? _animation2;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    _animation = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: _controller!, curve: Curves.easeOut))
      ..addListener(() {
        setState(() {});
      });

    _animation2 = Tween<double>(begin: 0, end: -30)
        .animate(CurvedAnimation(parent: _controller!, curve: Curves.easeOut));

    _controller!.forward();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, kToolbarHeight),
        child: ClipRRect(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: AppBar(
              brightness: Brightness.dark,
              backgroundColor: Colors.white.withOpacity(.05),
              elevation: 0,
              title: Text(
                ' Your App\'s name',
                style: TextStyle(
                  fontSize: _w / 17,
                  color: Colors.white.withOpacity(.7),
                  fontWeight: FontWeight.w400,
                ),
              ),
              actions: [
                IconButton(
                  tooltip: 'Settings',
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  icon:
                  Icon(Icons.settings, color: Colors.white.withOpacity(.7)),
                  onPressed: () {
                    HapticFeedback.lightImpact();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return RouteWhereYouGo2();
                        },
                      ),
                    );
                  },
                ),
                Text(''  ''),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Color(0xff2A40CE),
      body: ListView(
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        children: [
          SizedBox(height: _w / 13),
          cardsGroup(
            'Example',
            'Example',
            Icons.favorite,
            Icons.favorite,
            RouteWhereYouGo2(),
            RouteWhereYouGo2(),
          ),
          cardsGroup(
            'Example',
            'Example',
            Icons.favorite,
            Icons.favorite,
            RouteWhereYouGo2(),
            RouteWhereYouGo2(),
          ),
          cardsGroup(
            'Example',
            'Example',
            Icons.favorite,
            Icons.favorite,
            RouteWhereYouGo2(),
            RouteWhereYouGo2(),
          ),
          cardsGroup(
            'Example',
            'Example',
            Icons.favorite,
            Icons.favorite,
            RouteWhereYouGo2(),
            RouteWhereYouGo2(),
          ),
          cardsGroup(
            'Example',
            'Example',
            Icons.favorite,
            Icons.favorite,
            RouteWhereYouGo2(),
            RouteWhereYouGo2(),
          ),
          cardsGroup(
            'Example',
            'Example',
            Icons.favorite,
            Icons.favorite,
            RouteWhereYouGo2(),
            RouteWhereYouGo2(),
          ),
          cardsGroup(
            'Example',
            'Example',
            Icons.favorite,
            Icons.favorite,
            RouteWhereYouGo2(),
            RouteWhereYouGo2(),
          ),
        ],
      ),
    );
  }

  Widget cardsGroup(String title1, String title2, IconData icon1,
      IconData icon2, Widget route1, Widget route2) {
    double _w = MediaQuery.of(context).size.width;
    return Opacity(
      opacity: _animation!.value,
      child: Transform.translate(
        offset: Offset(0, _animation2!.value),
        child: Container(
          margin: EdgeInsets.fromLTRB(_w / 25, _w / 25, _w / 25, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              cardWidget(title1, icon1, route1),
              cardWidget(title2, icon2, route2),
            ],
          ),
        ),
      ),
    );
  }

  Widget cardWidget(String title, IconData icon, Widget route) {
    double _w = MediaQuery.of(context).size.width;
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () {
        HapticFeedback.lightImpact();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return route;
            },
          ),
        );
      },
      child: Container(
        height: _w / 2,
        width: _w / 2.28,
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              icon,
              color: Colors.white.withOpacity(.6),
              size: 40,
            ),
            Text(
              title,
              maxLines: 4,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: 23,
                  color: Colors.white.withOpacity(.7),
                  fontWeight: FontWeight.w700),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class RouteWhereYouGo2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        elevation: 50,
        centerTitle: true,
        shadowColor: Colors.black.withOpacity(.5),
        title: Text('EXAMPLE  PAGE',
            style: TextStyle(
                color: Colors.black.withOpacity(.7),
                fontWeight: FontWeight.w600,
                letterSpacing: 1)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black.withOpacity(.8)),
          onPressed: () => Navigator.maybePop(context),
        ),
      ),
    );
  }
}


/////////////////////////////////////////////////////////////////////////////////////////////////
// مهم جدا عند الضغط علا ايقونه اضافه تفاصيل كروت الشبكه يضهر هذا


//// We are using this plugin => expandable_bottom_bar
//// Search it on google For more information.


class MyPlugin extends StatelessWidget {
  static const routeName = '/ExpandableHeader';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultBottomBarController(
        child: Page(),
      ),
    );
  }
}

class Page extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<Page> with SingleTickerProviderStateMixin {
  BottomBarController ?controller;

  @override
  void initState() {
    super.initState();
    controller = BottomBarController(vsync: this, dragLength: 550, snap: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      extendBody: true,
      floatingActionButton: GestureDetector(
        onVerticalDragUpdate: controller!.onDrag,
        onVerticalDragEnd: controller!.onDragEnd,
        child: FloatingActionButton.extended(
          label: Text("Pull up"),
          elevation: 2,
          backgroundColor: Colors.deepOrange,
          foregroundColor: Colors.white,
          onPressed: () => controller!.swap(),
        ),
      ),
      body: Container(
        child: GridView.builder(
          itemBuilder: (context, ind) => Card(
            child: Center(
              child: Text("Card $ind"),
            ),
          ),
          padding: EdgeInsets.all(16.0),
          gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        ),
      ),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(controller!.dragLength!),
        child: BottomExpandableAppBar(
          controller: controller,
          expandedHeight: controller!.dragLength,
          horizontalMargin: 16,
          attachSide: Side.Top,
          expandedBackColor: Theme.of(context).backgroundColor,
          expandedBody: Center(
            child: Text("Hello world!"),
          ),
          bottomAppBarBody: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Expanded(
                  child: Text(
                    "Hello",
                    textAlign: TextAlign.center,
                  ),
                ),
                Spacer(
                  flex: 2,
                ),
                Expanded(
                  child: Text(
                    "World",
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////
// دايلوج لتاكد من الاتصال با الانترنت

class MyPlugind extends StatefulWidget {
  @override
  _MyPluginStated createState() => _MyPluginStated();
}

class _MyPluginStated extends State<MyPlugind> {
  Function ?toast(
      String msg, Toast toast, ToastGravity toastGravity, Color colors) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: toast,
        gravity: toastGravity,
        backgroundColor: colors,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Demo on Flutter Toast Message Plugin"),
            SizedBox(
              height: 20.0,
            ),
            MaterialButton(
              elevation: 5.0,
              height: 50.0,
              minWidth: 100,
              color: Colors.blueAccent,
              textColor: Colors.white,
              child: Text("Show Toast at Bottom"),
              onPressed: () {
                toast(
                    "This is Demo 1 Toast at BOTTOM",
                    Toast.LENGTH_LONG,
                    ToastGravity.BOTTOM,
                    Colors.green); // calling a function to show Toast message
              },
            ),
            SizedBox(
              height: 20.0,
            ),
            MaterialButton(
              elevation: 5.0,
              height: 50.0,
              minWidth: 100,
              color: Colors.redAccent,
              textColor: Colors.white,
              child: Text("Show Toast at TOP"),
              onPressed: () {
                toast(
                  "This is Demo 2 Toast at top",
                  Toast.LENGTH_SHORT,
                  ToastGravity.TOP,
                  Colors.red,
                ); // calling a function to show Toast message
              },
            ),
          ],
        ),
      ),
    );
  }
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////
//مهم

class MyPlugine extends StatefulWidget {
  @override
  _MyPluginStatee createState() => _MyPluginStatee();
}

class _MyPluginStatee extends State<MyPlugine> {
  int _counter = 0;
  bool showRaisedButtonBadge = true;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        bottomNavigationBar: _bottomNavigationBar(),
        appBar: AppBar(
          leading: Badge(
            position: BadgePosition.topEnd(top: 10, end: 10),
            badgeContent: null,
            child: IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {},
            ),
          ),
          title: Text('Badge Demo', style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.white,
          actions: <Widget>[
            _shoppingCartBadge(),
          ],
         bottom:   _tabBar(),
        ),
        body: Column(
          children: <Widget>[
            _addRemoveCartButtons(),
            _textBadge(),
            _directionalBadge(),
            _raisedButtonBadge(),
            _chipWithZeroPadding(),
            expandedBadge(),
            _badgeWithZeroPadding(),
            _badgesWithBorder(),
            _listView(),
          ],
        ),
      ),
    );
  }

  Widget expandedBadge() {
    return Expanded(
      child: Center(
        child: Badge(
          badgeContent: Text('10'),
          child: Icon(Icons.person, size: 30),
        ),
      ),
    );
  }

  Widget _shoppingCartBadge() {
    return Badge(
      position: BadgePosition.topEnd(top: 0, end: 3),
      animationDuration: Duration(milliseconds: 300),
      animationType: BadgeAnimationType.slide,
      badgeContent: Text(
        _counter.toString(),
        style: TextStyle(color: Colors.white),
      ),
      child: IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {}),
    );
  }

  PreferredSizeWidget ?_tabBar() {
    return TabBar(tabs: [
      Tab(
        icon: Badge(
          badgeColor: Colors.blue,
          badgeContent: Text(
            '3',
            style: TextStyle(color: Colors.white),
          ),
          child: Icon(Icons.account_balance_wallet, color: Colors.grey),
        ),
      ),
      Tab(
        icon: Badge(
          shape: BadgeShape.square,
          borderRadius: BorderRadius.circular(5),
          position: BadgePosition.topEnd(top: -12, end: -20),
          padding: EdgeInsets.all(2),
          badgeContent: Text(
            'NEW',
            style: TextStyle(
                color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
          ),
          child: Text(
            'MUSIC',
            style: TextStyle(color: Colors.grey[600]),
          ),
        ),
      ),
    ]);
  }

  Widget _bottomNavigationBar() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          label: 'Events',
          icon: Icon(Icons.event),
        ),
        BottomNavigationBarItem(
          label:'Messages',
          icon: Icon(Icons.message),
        ),
        BottomNavigationBarItem(
          label: 'Settings',
          icon: Badge(
            shape: BadgeShape.circle,
            borderRadius: BorderRadius.circular(100),
            child: Icon(Icons.settings),
            badgeContent: Container(
              height: 5,
              width: 5,
              decoration:
              BoxDecoration(shape: BoxShape.circle, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  Widget _addRemoveCartButtons() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          RaisedButton.icon(
              onPressed: () {
                setState(() {
                  _counter++;
                });
              },
              icon: Icon(Icons.add),
              label: Text('Add to cart')),
          RaisedButton.icon(
              onPressed: () {
                if (_counter > 0) {
                  setState(() {
                    _counter--;
                  });
                }
              },
              icon: Icon(Icons.remove),
              label: Text('Remove from cart')),
        ],
      ),
    );
  }

  Widget _textBadge() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Badge(
        padding: EdgeInsets.all(6),
        badgeContent: Text(
          '!',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        child: Text('This is a text'),
        position: BadgePosition.topStart(top: -15),
      ),
    );
  }

  Widget _raisedButtonBadge() {
    return Badge(
      showBadge: showRaisedButtonBadge,
      padding: EdgeInsets.all(8),
      badgeColor: Colors.deepPurple,
      badgeContent: Text(
        '!',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      child: RaisedButton(
        onPressed: () {
          setState(() {
            showRaisedButtonBadge = !showRaisedButtonBadge;
          });
        },
        child: Text('Raised Button'),
      ),
    );
  }

  Widget _chipWithZeroPadding() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
      Text('Chip with zero padding:'),
      Chip(
        label: Text('Hello'),
        padding: EdgeInsets.all(0),
      ),
    ]);
  }

  Widget _badgeWithZeroPadding() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('Badges:'),
        for (int i = 0; i < 5; i++)
          _getExampleBadge(padding: (i * 2).toDouble())
      ],
    );
  }

  Widget _getExampleBadge({required double padding}) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: Badge(
        badgeColor: Colors.lightBlueAccent,
        borderRadius: BorderRadius.circular(20),
        padding: EdgeInsets.all(padding),
        shape: BadgeShape.square,
        badgeContent: Text(
          'Hello',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget _badgesWithBorder() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text('Badges with borders:'),
          Badge(
            position: BadgePosition.topEnd(top: 0, end: 2),
            elevation: 0,
            shape: BadgeShape.circle,
            badgeColor: Colors.red,
            borderSide: BorderSide(color: Colors.black),
            child: Icon(
              Icons.person,
              size: 30,
            ),
          ),
          Badge(
            position: BadgePosition.topEnd(top: -5, end: -5),
            shape: BadgeShape.square,
            badgeColor: Colors.blue,
            badgeContent: SizedBox(
              height: 5,
              width: 5,
            ),
            elevation: 0,
            borderSide: BorderSide(
              color: Colors.black,
              width: 3,
            ),
            child: Icon(
              Icons.games,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }

  Widget _listView() {
    Widget _listTile(String title, String value) {
      return ListTile(
        dense: true,
        title: Text(title, style: TextStyle(fontSize: 16)),
        trailing: SizedBox(
          width: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Badge(
                elevation: 0,
                shape: BadgeShape.circle,
                padding: EdgeInsets.all(7),
                badgeContent: Text(
                  value,
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Icon(
                  Icons.arrow_forward_ios,
                  size: 14,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Expanded(
      child: ListView.separated(
        itemCount: 3,
        separatorBuilder: (BuildContext context, int index) => Divider(),
        itemBuilder: (BuildContext context, int index) {
          switch (index) {
            case 0:
              return _listTile('Messages', '2');
            case 1:
              return _listTile('Friends', '7');
            case 2:
            default:
              return _listTile('Events', '!');
          }
        },
      ),
    );
  }

  Widget _directionalBadge() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Badge(
        elevation: 0,
        position: BadgePosition.topEnd(),
        padding: EdgeInsetsDirectional.only(end: 4),
        badgeColor: Colors.transparent,
        badgeContent: Icon(Icons.error, size: 16.0, color: Colors.red),
        child: Text('This is RTL'),
      ),
    );
  }
}


//bottomshate 




class SimpleSnappingSheet extends StatelessWidget {
  final ScrollController listViewController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    return SnappingSheet(
      child: Backgrounds(),
      lockOverflowDrag: true,
      snappingPositions: [
        SnappingPosition.factor(
          positionFactor: 0.0,
          snappingCurve: Curves.easeOutExpo,
          snappingDuration: Duration(seconds: 1),
          grabbingContentOffset: GrabbingContentOffset.top,
        ),
        SnappingPosition.factor(
          snappingCurve: Curves.elasticOut,
          snappingDuration: Duration(milliseconds: 1750),
          positionFactor: 0.5,
        ),
        SnappingPosition.factor(
          grabbingContentOffset: GrabbingContentOffset.bottom,
          snappingCurve: Curves.easeInExpo,
          snappingDuration: Duration(seconds: 1),
          positionFactor: 0.9,
        ),
      ],
      grabbing: GrabbingWidget(),
      grabbingHeight: 75,
      sheetAbove: null,
      sheetBelow: SnappingSheetContent(
        draggable: true,
        childScrollController: listViewController,
        child: Container(
          color: Colors.white,
          child: ListView.builder(
            controller: listViewController,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.all(15),
                color: Colors.green[200],
                height: 100,
                child: Center(
                  child: Text(index.toString()),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

/// Widgets below are just helper widgets for this example

class Backgrounds extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: Placeholder(
        color: Colors.green[200]!,
      ),
    );
  }
}

class GrabbingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        boxShadow: [
          BoxShadow(blurRadius: 25, color: Colors.black.withOpacity(0.2)),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.only(top: 20),
            width: 100,
            height: 7,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          Container(
            color: Colors.grey[200],
            height: 2,
            margin: EdgeInsets.all(15).copyWith(top: 0, bottom: 0),
          )
        ],
      ),
    );
  }
}

class SnappingSheetExampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Snapping Sheet Examples',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey[700],
          elevation: 0,
          foregroundColor: Colors.white,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        primarySwatch: Colors.grey,
      ),
      home: PageWrapper(),
    );
  }
}

class PageWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Example",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return SignUpScreen();
                }),
              ),
            },
          )
        ],
      ),
      body: SimpleSnappingSheet(),
    );
  }
}






// عرض بوتوم شيت مشو يتقفل الا لما تضغط علا الزر هذا مهم جدا لانه انا اعاني من مشاكله كثير



class BottomSheetExample extends StatefulWidget {
  const BottomSheetExample({Key? key}) : super(key: key);

  @override
  _BottomSheetExampleState createState() => _BottomSheetExampleState();
}

class _BottomSheetExampleState extends State<BottomSheetExample> {
  // GlobalKey is needed to show bottom sheet.
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: this._scaffoldKey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text('show bottom sheet'),
              onPressed: () => this
                  ._scaffoldKey
                  .currentState!
                  .showBottomSheet((ctx) => _buildBottomSheet(ctx)),
            ),
            RaisedButton(
              child: Text('show modal bottom sheet'),
              onPressed: () => showModalBottomSheet(
                  context: context, builder: (ctx) => _buildBottomSheet(ctx)),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () =>
            Fluttertoast.showToast(msg: 'Dummy floating action button'),
      ),
    );
  }

  Container _buildBottomSheet(BuildContext context) {
    return Container(
      height: 300,
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue, width: 2.0),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: ListView(
        children: <Widget>[
          ListTile(title: Text('Bottom sheet')),
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              icon: Icon(Icons.attach_money),
              labelText: 'Enter an integer',
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: RaisedButton.icon(
              icon: Icon(Icons.save),
              label: Text('Save and close'),
              onPressed: () => Navigator.pop(context),
            ),
          )
        ],
      ),
    );
  }
}



///////////////////////////////////////////////////////////////////////////
// مهم 2 


class MyCustomBottomNavigationBar extends StatefulWidget {
  @override
  _MyCustomBottomNavigationBarState createState() =>
      _MyCustomBottomNavigationBarState();
}

class _MyCustomBottomNavigationBarState
    extends State<MyCustomBottomNavigationBar> with TickerProviderStateMixin {
  int currentValue = 0;

  AnimationController? _controller;
  Animation<double>? _animation;

  AnimationController? _controller2;
  Animation<double>? _animation2;

  AnimationController? _controller3;
  Animation<double>? _animation3;

  AnimationController ?_controller4;
  Animation<double>? _animation4;

  AnimationController ?_controller5;
  Animation<double>? _animation5;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _animation = Tween<double>(begin: 25, end: 33).animate(CurvedAnimation(
        parent: _controller!,
        curve: Curves.fastLinearToSlowEaseIn,
        reverseCurve: Curves.easeIn))
      ..addListener(() {
        setState(() {});
      });

    _controller2 =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _animation2 = Tween<double>(begin: 25, end: 33).animate(CurvedAnimation(
        parent: _controller2!,
        curve: Curves.fastLinearToSlowEaseIn,
        reverseCurve: Curves.easeIn))
      ..addListener(() {
        setState(() {});
      });

    _controller3 =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _animation3 = Tween<double>(begin: 25, end: 33).animate(CurvedAnimation(
        parent: _controller3!,
        curve: Curves.fastLinearToSlowEaseIn,
        reverseCurve: Curves.easeIn))
      ..addListener(() {
        setState(() {});
      });

    _controller4 =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _animation4 = Tween<double>(begin: 25, end: 33).animate(CurvedAnimation(
        parent: _controller4!,
        curve: Curves.fastLinearToSlowEaseIn,
        reverseCurve: Curves.easeIn))
      ..addListener(() {
        setState(() {});
      });

    _controller5 =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _animation5 = Tween<double>(begin: 25, end: 33).animate(CurvedAnimation(
        parent: _controller5!,
        curve: Curves.fastLinearToSlowEaseIn,
        reverseCurve: Curves.ease))
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller!.dispose();
    _controller2!.dispose();
    _controller3!.dispose();
    _controller4!.dispose();
    _controller5!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Stack(
        children: [
          // HOME PAGE
          SizedBox(
            height: size.height,
            width: size.width,
            child: null,
          ),

          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              height: size.width * .14,
              width: size.width,
              margin: EdgeInsets.all(size.width * .04),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.home,
                      color: currentValue == 0 ? Colors.orange : Colors.black38,
                      size: _animation!.value,
                    ),
                    onPressed: () {
                      setState(() {
                        currentValue = 0;
                        _controller!.forward();
                        _controller2!.reverse();
                        _controller3!.reverse();
                        _controller4!.reverse();
                        _controller5!.reverse();
                        HapticFeedback.lightImpact();
                      });
                    },
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.person_rounded,
                      color: currentValue == 1 ? Colors.orange : Colors.black38,
                      size: _animation2!.value,
                    ),
                    onPressed: () {
                      setState(() {
                        currentValue = 1;
                        _controller2!.forward();
                        _controller!.reverse();
                        _controller3!.reverse();
                        _controller4!.reverse();
                        _controller5!.reverse();
                        HapticFeedback.lightImpact();
                      });
                    },
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.add_box_rounded,
                      color: currentValue == 2 ? Colors.orange : Colors.black38,
                      size: _animation3!.value,
                    ),
                    onPressed: () {
                      setState(() {
                        currentValue = 2;
                        _controller3!.forward();
                        _controller!.reverse();
                        _controller2!.reverse();
                        _controller4!.reverse();
                        _controller5!.reverse();
                        HapticFeedback.lightImpact();
                      });
                    },
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.favorite_rounded,
                      color: currentValue == 3 ? Colors.orange : Colors.black38,
                      size: _animation4!.value,
                    ),
                    onPressed: () {
                      setState(() {
                        currentValue = 3;
                        _controller4!.forward();
                        _controller!.reverse();
                        _controller2!.reverse();
                        _controller3!.reverse();
                        _controller5!.reverse();
                        HapticFeedback.lightImpact();
                      });
                    },
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.settings_rounded,
                      color: currentValue == 4 ? Colors.orange : Colors.black38,
                      size: _animation5!.value,
                    ),
                    onPressed: () {
                      setState(() {
                        currentValue = 4;
                        _controller5!.forward();
                        _controller!.reverse();
                        _controller2!.reverse();
                        _controller3!.reverse();
                        _controller4!.reverse();
                        HapticFeedback.lightImpact();
                      });
                    },
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}



// مهم 1











class MyCustomBottomNavigationBarTow extends StatefulWidget {
  @override
  MyCustomBottomNavigationBarTows createState() =>
      MyCustomBottomNavigationBarTows();
}

class MyCustomBottomNavigationBarTows
    extends State<MyCustomBottomNavigationBarTow> {
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(brightness: Brightness.dark),
      body: null,
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(_width * .05),
        height: _width * .155,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.1),
              blurRadius: 30,
              offset: Offset(0, 10),
            ),
          ],
          borderRadius: BorderRadius.circular(50),
        ),
        child: ListView.builder(
          itemCount: 4,
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: _width * .02),
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              setState(() {
                currentIndex = index;
                HapticFeedback.lightImpact();
              });
            },
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Stack(
              children: [
                AnimatedContainer(
                  duration: Duration(seconds: 1),
                  curve: Curves.fastLinearToSlowEaseIn,
                  width: index == currentIndex ? _width * .32 : _width * .18,
                  alignment: Alignment.center,
                  child: AnimatedContainer(
                    duration: Duration(seconds: 1),
                    curve: Curves.fastLinearToSlowEaseIn,
                    height: index == currentIndex ? _width * .12 : 0,
                    width: index == currentIndex ? _width * .32 : 0,
                    decoration: BoxDecoration(
                      color: index == currentIndex
                          ? Colors.blueAccent.withOpacity(.2)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
                AnimatedContainer(
                  duration: Duration(seconds: 1),
                  curve: Curves.fastLinearToSlowEaseIn,
                  width: index == currentIndex ? _width * .31 : _width * .18,
                  alignment: Alignment.center,
                  child: Stack(
                    children: [
                      Row(
                        children: [
                          AnimatedContainer(
                            duration: Duration(seconds: 1),
                            curve: Curves.fastLinearToSlowEaseIn,
                            width: index == currentIndex ? _width * .13 : 0,
                          ),
                          AnimatedOpacity(
                            opacity: index == currentIndex ? 1 : 0,
                            duration: Duration(seconds: 1),
                            curve: Curves.fastLinearToSlowEaseIn,
                            child: Text(
                              index == currentIndex
                                  ? '${listOfTitles[index]}'
                                  : '',
                              style: TextStyle(
                                color: Colors.blueAccent,
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          AnimatedContainer(
                            duration: Duration(seconds: 1),
                            curve: Curves.fastLinearToSlowEaseIn,
                            width: index == currentIndex ? _width * .03 : 20,
                          ),
                          Icon(
                            listOfIcons[index],
                            size: _width * .076,
                            color: index == currentIndex
                                ? Colors.blueAccent
                                : Colors.black26,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<IconData> listOfIcons = [
    Icons.home_rounded,
    Icons.favorite_rounded,
    Icons.settings_rounded,
    Icons.person_rounded,
  ];

  List<String> listOfTitles = [
    'Home',
    'Favorite',
    'Settings',
    'Account',
  ];
}



// مهم جدا 












class MyCustomBottomNavigationBars extends StatefulWidget {
  @override
  MyCustomBottomNavigationBarsState createState() =>
      MyCustomBottomNavigationBarsState();
}

class MyCustomBottomNavigationBarsState
    extends State<MyCustomBottomNavigationBars> {
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(brightness: Brightness.dark),
      body: null,
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(20),
        height: _width * .155,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.15),
              blurRadius: 30,
              offset: Offset(0, 10),
            ),
          ],
          borderRadius: BorderRadius.circular(50),
        ),
        child: ListView.builder(
          itemCount: 4,
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: _width * .024),
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              setState(() {
                currentIndex = index;
                HapticFeedback.lightImpact();
              });
            },
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Stack(
              children: [
                SizedBox(
                  width: _width * .2125,
                  child: Center(
                    child: AnimatedContainer(
                      duration: Duration(seconds: 1),
                      curve: Curves.fastLinearToSlowEaseIn,
                      height: index == currentIndex ? _width * .12 : 0,
                      width: index == currentIndex ? _width * .2125 : 0,
                      decoration: BoxDecoration(
                        color: index == currentIndex
                            ? Colors.blueAccent.withOpacity(.2)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: _width * .2125,
                  alignment: Alignment.center,
                  child: Icon(
                    listOfIcons[index],
                    size: _width * .076,
                    color: index == currentIndex
                        ? Colors.blueAccent
                        : Colors.black26,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<IconData> listOfIcons = [
    Icons.home_rounded,
    Icons.favorite_rounded,
    Icons.settings_rounded,
    Icons.person_rounded,
  ];
}