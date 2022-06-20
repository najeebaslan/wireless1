import 'package:flutter/material.dart';

import 'apps_events.dart';
import 'apps_list.dart';


class ExampleApp extends StatelessWidget {
   const ExampleApp();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Device apps demo')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<Object>(
                        builder: (BuildContext context) => AppsListScreen()),
                  );
                },
                child: Text('Applications list')),
            TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<Object>(
                        builder: (BuildContext context) => AppsEventsScreen()),
                  );
                },
                child: Text('Applications events'))
          ],
        ),
      ),
    );
  }
}
