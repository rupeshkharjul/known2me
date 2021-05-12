import 'dart:async';

import 'package:flutter/material.dart';
import 'package:know2me_sample_project/detail_screen.dart';
import 'package:know2me_sample_project/list_screen.dart';
import 'package:know2me_sample_project/splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      initialRoute: 'Home_PAGE',
      routes: {
        MyHomePage.id: (context) => MyHomePage(),
        ListScreen.id: (context) => ListScreen(),
        DetailScreen.id: (context) => DetailScreen(),
      },
    );
  }
}
