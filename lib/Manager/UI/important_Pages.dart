import 'dart:convert';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

import '../../exports/export_manager.dart';

class Page2 extends StatefulWidget {
  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2>
    with AutomaticKeepAliveClientMixin<Page2> {
  //^^^^^====>>  /* =====>تعمل علا حفظ البيانات عند التنقل بين الصفحات وبمجرد انك انتقلت الا صفحه معينه وتم تحميل البيانات عند الانتقال اليها مرة اخرى لا يعمل علا اعادة تحميل البيانات من جديد */
  var list = [];

  _loadList() async {
    final response = await http
        .get(Uri.parse("https://jsonplaceholder.typicode.com/photos/"));
    if (response.statusCode == 200) {
      await Future.delayed(const Duration(seconds: 1));
      if (mounted) {
        setState(() {
          list = json.decode(response.body) as List;
        });
      }
    } else {
      throw Exception('Failed to load posts');
    }
  }

  @override
  void initState() {
    _loadList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Column(
        children: <Widget>[
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => CoverageAreaScareen()));
            },
            child: null,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: list.length,
              itemBuilder: (BuildContext context, int index) {
                final data = list[index];
                return
                    // Text(data['title']);
                    ListTile(
                  contentPadding: EdgeInsets.all(1.0),
                  title: Text(data['title']),
                  trailing: Image.network(
                    data['thumbnailUrl'],
                    height: 20.0,
                    width: 20.0,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
