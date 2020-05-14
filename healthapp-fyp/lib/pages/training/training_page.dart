import 'package:TMW/pages/training/tabbarview/1.dart';
import 'package:TMW/pages/training/tabbarview/2.dart';
import 'package:TMW/pages/training/tabbarview/3.dart';
import 'package:TMW/pages/training/tabbarview/4.dart';

import 'package:flutter/material.dart';

class TrainingPage extends StatefulWidget {
  TrainingPage({Key key}) : super(key: key);

  @override
  _TrainingPageState createState() => _TrainingPageState();
}

class _TrainingPageState extends State<TrainingPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            brightness: Brightness.light,
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            title: Text(
              "Training",
              // textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
              ),
            ),

            // actions: <Widget>[
            //   IconButton(
            //     icon: Icon(Icons.notifications_none, color: Colors.black,),
            //   ),
            // ],
            bottom: TabBar(
                // isScrollable: true,
                indicatorColor: Colors.black,
                labelColor: Colors.black,
                labelStyle: TextStyle(fontWeight: FontWeight.bold),
                tabs: <Widget>[
                  Tab(
                    text: "All",
                  ),
                  Tab(text: "Running"),
                  Tab(text: "Building"),
                  Tab(text: "Likes"),
                ]),
          ),
          body: TabBarView(
            children: <Widget>[
              Tab1(),
              Tab2(),
              Tab3(),
              Tab4(),
            ],
          )),
    );
  }
}
