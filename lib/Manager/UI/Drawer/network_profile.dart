import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import '../../../exports/export_manager.dart';
late FSBStatus drawerStatus;
enum OrderOptions { OrderAZ, OrderZA }

class DrawerWithAppBar extends StatefulWidget {
  @override
  _DrawerWithAppBarState createState() => _DrawerWithAppBarState();
}

class _DrawerWithAppBarState extends State<DrawerWithAppBar> {
  bool valuefirst = false;
  bool? isLogin;
  //refresh data form server
  Future<Null> _refreshData() async {
    setState(() {
      getUserProfile();
      getUserProfile11();
    });
  }

  void _orderList(OrderOptions result) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => NeonButonMain(),
    ));
    print('Do');
    setState(() {});
  }

  Widget? userImage;
  var dataUserNetwork;
  var dataUserProfile;
  var username;
  String nn = '';
  Widget? namenetwork;
  getUserProfile() async {

    var baseURL = Uri.parse('${URI.Uri}/user/profile/userId');
    print(baseURL);
    print('userId');
    try {
      // await context.read<UtilsUserProvider>().getNetworkId();
      final provider = Provider.of<UtilsUserProvider>(context, listen: false);
      var response = await http.get(
        baseURL,
        headers:FuHeader.headerWithToken(provider.myToken.toString())
        //  headers(),
      );
      List list = jsonDecode(response.body);
      //قفلته موقت وهو شغال اصلا بس جربت شي

      late final users = list.map((model) => User.fromJson(model)).toList();
      print(users.length);
      return users.forEach((post) {
        dataUserProfile = post;
        username = post.numberAccount;
      });
    } catch (e) {
      print("${e.toString()}هناك خطاء");
    }
    return null;
  }

  String datt = '';

  //Cardspi('6089bf63e84b4f103005837e',datt);
  getUserProfile11() async {
    var baseURL = Uri.parse('${URI.Uri}/network/$networkId');
    print(baseURL);
    try {
      final provider = Provider.of<UtilsUserProvider>(context, listen: false);

      var response = await http.get(
        baseURL,
        headers:FuHeader.headerWithToken(provider.myToken.toString())
        // headers,
      );
      List list = jsonDecode(response.body);
      late final networks =
          list.map((model) => NetworkById.fromJson(model)).toList();
      print(networks.length);
      return networks.forEach((post) async {
        dataUserNetwork = post;

        namenetwork = ts(
          '${post.nameA.toString()}',
          const TextStyle(
              color: StyleWidget.nearlyBlack,
              fontFamily: StyleWidget.fontName,
              fontSize: 14),
        );
        setState(() {});
        saveNaneNetwork() async {
          SharedPreferences myPrefs = await SharedPreferences.getInstance();

          await myPrefs.setString('namenetwork', post.nameA!);
        }

        await saveNaneNetwork();
        userImage = ClipOval(
            child: Image.network('${URI.Uri}/${post.img}',
                height: 30 * 2,
                width: 30 * 2,
                fit: BoxFit.cover,
                scale: 1.1, loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loadingProgress) {
          if (loadingProgress == null) return child;
          return Center(
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                      loadingProgress.expectedTotalBytes!
                  : null,
            ),
          );
        }));
      });
    } catch (e) {
      print("${e.toString()}هناك خطاء");
    }
  }

  void initState() {
    super.initState();

    drawerStatus = FSBStatus.noResult;
    // saveNaneNetwork();
    networkId.toString();
    getUserProfile11();
    getUserProfile();
  }

  @override
  Widget build(BuildContext context) {
    final appStyleMode = Provider.of<DarkMode>(context);
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: drawerStatus != FSBStatus.FSB_OPEN
                    ? Icon(Icons.menu)
                    : Icon(Icons.clear),
                onPressed: () {
                  if (isLogin!) {
                    _refreshData();
                  }
                  setState(() {
                    if (drawerStatus != FSBStatus.FSB_CLOSE) {
                      isLogin = false;
                    }
                    drawerStatus = drawerStatus == FSBStatus.FSB_OPEN
                        ? FSBStatus.FSB_CLOSE
                        : FSBStatus.FSB_OPEN;
                  });
                },
              ),
              elevation: 5,
              iconTheme: const IconThemeData.fallback(),
              title: namenetwork,
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.notifications_none,
                        color: Colors.grey.shade800,
                      ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => MainScreenClient()));
                      },
                    ),
                    PopupMenuButton<OrderOptions>(
                      itemBuilder: (context) => <PopupMenuEntry<OrderOptions>>[
                        PopupMenuItem<OrderOptions>(
                          child: text("المساعدة و التعليقات"),
                          height: 20,
                          value: OrderOptions.OrderAZ,
                        ),
                      ],
                      onSelected: _orderList,
                    ),
                  ],
                ),
              ],
              backgroundColor: Color(0xFFF2F3F8),
            ),
            body: Theme(
              data: HotelAppTheme.buildLightTheme(),
              child: RefreshIndicator(
                strokeWidth: 3,
                onRefresh: _refreshData,
                child: FoldableSidebarBuilder(
                  drawer: Container(
                      color: Colors.white,
                      width: mediaQuery.size.width * 0.60,
                      height: mediaQuery.size.height,
                      child: Container(
                        color: Colors.white54,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              SizedBox(
                                child: UserAccountsDrawerHeader(
                                    currentAccountPicture: Image.asset(
                                      'assets/home_images/image.jpg',
                                      fit: BoxFit.cover,
                                    ),
                                    accountName: null,
                                    // otherAccountsPictures: [Image.asset('assets/home_images/image.jpg'),],
                                    accountEmail: namenetwork),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => CustomSliverHeader(
                                            dataUserNetwork: dataUserNetwork,
                                            dataUserProfile: dataUserProfile,
                                          )));
                                },
                                child: SizedBox(
                                  height: 70,
                                  child: Card(
                                    margin: EdgeInsets.all(5),
                                    elevation: 3,
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                          child: Padding(
                                              padding: const EdgeInsets.only(
                                                right: 5.0,
                                                bottom: 2,
                                                left: 5,
                                                top: 2,
                                              ),
                                              child: userImage),
                                        ),
                                        Expanded(
                                          child: Stack(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(1.0),
                                                child: ts(
                                                  'الملف الشخصي',
                                                  const TextStyle(
                                                      fontSize: 15.1),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                bottom: 40, right: 0),
                                            child: ts(
                                              '${username.toString()}',
                                              // "نجيب عسلان",
                                              TextStyle(
                                                  fontSize: 10.1,
                                                  color: Colors.grey[700],
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Card(
                                elevation: 3,
                                child: Row(
                                  children: [
                                    IconButton(
                                        icon: const Icon(Icons.settings),
                                        onPressed: () {}),
                                    ts('الاعدادات',
                                        const TextStyle(fontSize: 15.2))
                                  ],
                                ),
                              ),
                              Card(
                                elevation: 3,
                                child: Row(
                                  children: [
                                    Checkbox(
                                      checkColor: Colors.greenAccent,
                                      activeColor: Colors.blue,
                                      value: this.valuefirst,
                                      onChanged: (bool? value) {
                                        appStyleMode.switchMode();
                                        this.valuefirst = value!;
                                      },
                                    ),
                                    FlatButton(
                                      onPressed: () {},
                                      highlightColor: Colors.blue,
                                      hoverColor: Colors.orange,
                                      child: Text(
                                        'تفعيل الوضع اليلي',
                                        style: TextStyle(
                                            color: appStyleMode.Blackandwhite,
                                            fontSize: 15.2),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Card(
                                elevation: 3,
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 14.0),
                                  child: Row(
                                    children: [
                                      Icon(Icons.add_to_home_screen_rounded),
                                      FlatButton(
                                        onPressed: () {},
                                        highlightColor: Colors.blue,
                                        hoverColor: Colors.orange,
                                        child: const Text(
                                          ' من نحن',
                                          textDirection: TextDirection.ltr,
                                          style: const TextStyle(
                                              color: Colors.black),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Card(
                                elevation: 3,
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 14.0),
                                  child: Row(
                                    children: [
                                      Icon(Icons.star_half_outlined),
                                      FlatButton(
                                        onPressed: () {},
                                        highlightColor: Colors.blue,
                                        hoverColor: Colors.orange,
                                        child: const Text(
                                          'تقييم التطبيق',
                                          textDirection: TextDirection.ltr,
                                          style: const TextStyle(
                                              color: Colors.black),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Card(
                                elevation: 3,
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 14.0),
                                  child: Row(
                                    children: [
                                      Icon(Icons.exit_to_app),
                                      FlatButton(
                                        onPressed: () {
                                          Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    LoginScreen()),
                                            (Route<dynamic> route) => false,
                                          );
                                        },
                                        highlightColor: Colors.blue,
                                        hoverColor: Colors.orange,
                                        child: const Text(
                                          'تسجيل الخروج',
                                          textDirection: TextDirection.ltr,
                                          style: const TextStyle(
                                              color: Colors.black),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )),
                  screenContents: Main(),
                  status: drawerStatus,
                  drawerBackgroundColor: Colors.red,
                ),
              ),
            )));
  }
}
