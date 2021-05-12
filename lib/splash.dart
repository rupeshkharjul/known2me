import 'dart:async';

import 'package:flutter/material.dart';
import 'package:know2me_sample_project/list_screen.dart';

class MyHomePage extends StatelessWidget {
  static final String id = "home_page";

  Timer _timer;
  int _start = 3;

  void startTimer(BuildContext context) {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          Navigator.pushNamed(context, ListScreen.id);
          _timer.cancel();
        } else {
          _start--;
        }
      },
    );
  }

  @override
  void dispose() {
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    startTimer(context);
    return Scaffold(
      body: Center(
        child: Image.asset('images/welcome.png'),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
