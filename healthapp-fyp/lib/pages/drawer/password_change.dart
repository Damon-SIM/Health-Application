import 'package:flutter/material.dart';

import 'form.dart';

class ChangePassPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ChangePassPageState();
  }
}

class ChangePassPageState extends State<ChangePassPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black,
          title: Text("Change Password"),
        ),
        body: SafeArea(
          child: Column(
            children: <Widget>[
              ChangePassForm(),
            ],
          ),
        ));
  }
}
