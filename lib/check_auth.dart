import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'exports/export_manager.dart';

class CheckAuth extends StatefulWidget {
  const CheckAuth({Key? key}) : super(key: key);
  @override
  _CheckAuthState createState() => _CheckAuthState();
}

class _CheckAuthState extends State<CheckAuth> {
  String? token;
  bool initiate = true;
  String? typeAccount;
  String? _networkId;
  String? _level;

  @override
  Widget build(BuildContext context) {
    late final providerToken =
        Provider.of<UtilsUserProvider>(context, listen: false);
    if (initiate) {
      SharedPreferences.getInstance().then((value) async {
        await providerToken.getToken();
        print(providerToken.myToken);
        var typeUser = await FuSharedPreferences.getString(HEADERS.USER_TYPE);
        var networkId = await FuSharedPreferences.getString(HEADERS.NETWORK_ID);
        var profileUser = await MySharedPreferences.getDataUser();
        await providerToken.getUserProfile(profileUser);
        // check level
        var level = await FuSharedPreferences.getString('level');

        if (level == '1') {
          context.read<ProviderNetworkDetails>().timeliene(value: 0);
        }
        if (level == '2') {
          context.read<ProviderNetworkDetails>().timeliene(value: 1);
        }
        if (level == '3') {
          context.read<ProviderNetworkDetails>().timeliene(value: 2);
        }

        setState(() {
          initiate = false;
          token = value.getString(HEADERS.KAY_TOkEN);
          typeAccount = typeUser;
          _networkId = networkId;
          _level = level;
        });
      });

      return SplashScreen();
    } else {
      if (_level == '1') {
        return NetworkDetails();
      } else if (_level == '2') {
        return CoverageAreaScareen();
      } else if (_level == '3') {
        return CheckHavePassword();
      }

      if (token == null) {
        return SignUpScreen();
      } else {
        if (typeAccount == 'Client') {
          return MainScreenClient();
        } else if (typeAccount == 'network_Owner' ||
            typeAccount == 'network_Engineer') {
          if (_networkId == null) {
            return NetworkDetails();
          } else
            return DrawerWithAppBar();
        } else
          return SecondSignUp();
      }
    }
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(child: CircularProgressIndicator()),
          ],
        ),
      ),
    );
  }
}
