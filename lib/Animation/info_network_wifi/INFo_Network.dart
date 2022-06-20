import 'dart:async';
import 'dart:io';
import 'package:network_info_plus/network_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class InfoNetwork extends StatefulWidget {
  InfoNetwork({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _InfoNetworkState createState() => _InfoNetworkState();
}

class _InfoNetworkState extends State<InfoNetwork> {
  String _connectionStatus = 'Unknown';
  final NetworkInfo _networkInfo = NetworkInfo();

  @override
  void initState() {
    super.initState();
    sfsf();
    _initNetworkInfo();
  }
sfsf()async{

  var wifiBSSID = await (NetworkInfo().getWifiBSSID());
  //getWifiBSSID());
  var wifiIP = await (NetworkInfo().getWifiIP());
  //network
  var wifiName = await (NetworkInfo().getWifiName());
  print(wifiBSSID);
  //wifi network
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NetworkInfo example app'),
      ),
      body: Center(child: Text('Connection Status: $_connectionStatus')),
    );
  }

  Future<void> _initNetworkInfo() async {
    String? wifiName, wifiBSSID, wifiIP;

    try {
      if (!kIsWeb && Platform.isIOS) {
        var status = await _networkInfo.getLocationServiceAuthorization();
        if (status == LocationAuthorizationStatus.notDetermined) {
          status = await _networkInfo.requestLocationServiceAuthorization();
        }
        if (status == LocationAuthorizationStatus.authorizedAlways ||
            status == LocationAuthorizationStatus.authorizedWhenInUse) {
          wifiName = await _networkInfo.getWifiName();
        } else {
          wifiName = await _networkInfo.getWifiName();
        }
      } else {
        wifiName = await _networkInfo.getWifiName();
      }
    } on PlatformException catch (e) {
      print(e.toString());
      wifiName = 'Failed to get Wifi Name';
    }

    try {
      if (!kIsWeb && Platform.isIOS) {
        var status = await _networkInfo.getLocationServiceAuthorization();
        if (status == LocationAuthorizationStatus.notDetermined) {
          status = await _networkInfo.requestLocationServiceAuthorization();
        }
        if (status == LocationAuthorizationStatus.authorizedAlways ||
            status == LocationAuthorizationStatus.authorizedWhenInUse) {
          wifiBSSID = await _networkInfo.getWifiBSSID();
        } else {
          wifiBSSID = await _networkInfo.getWifiBSSID();
        }
      } else {
        wifiBSSID = await _networkInfo.getWifiBSSID();
      }
    } on PlatformException catch (e) {
      print(e.toString());
      wifiBSSID = 'Failed to get Wifi BSSID';
    }

    try {
      wifiIP = await _networkInfo.getWifiIP();
    } on PlatformException catch (e) {
      print(e.toString());
      wifiIP = 'Failed to get Wifi IP';
    }

    setState(() {
      _connectionStatus = 'Wifi Name: $wifiName\n'
          'Wifi BSSID: $wifiBSSID\n'
          'Wifi IP: $wifiIP\n';
    });
  }
}