import 'package:flutter/material.dart';

import '1.dart';
import '2.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Color(0xff0074ff),
            elevation: 0,
            title: TabBar(
                indicatorColor: Colors.white,
                labelColor: Colors.white,
                labelStyle: TextStyle(fontWeight: FontWeight.bold),
                tabs: <Widget>[
                  Tab(
                    text: "PEDOMETER",
                  ),
                  Tab(text: "STATISTICS"),
                ]),
          ),
          body: TabBarView(
            children: <Widget>[
              DashboardPage1(),
              DashboardPage2(),
            ],
          )),
    );
  }
}
