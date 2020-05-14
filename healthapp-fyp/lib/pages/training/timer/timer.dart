import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'screen/main_screen_landscape.dart';
import 'screen/main_screen_portrait.dart';

import 'classes/dependencies.dart';

class CountDownTimer extends StatelessWidget {
  final Dependencies dependencies = new Dependencies();

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          brightness: Brightness.light,
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: Text(
            "Timer",
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
            ),
          ),
        ),
        body: new Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(20.0),
            child: mediaQueryData.orientation == Orientation.portrait
                ? MainScreenPortrait(dependencies: dependencies)
                : MainScreenLandscape(dependencies: dependencies)));
  }
}
