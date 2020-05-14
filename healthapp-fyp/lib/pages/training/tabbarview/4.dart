import 'package:flutter/material.dart';

class Tab4 extends StatefulWidget {
  Tab4({Key key}) : super(key: key);

  @override
  _Tab4State createState() => _Tab4State();
}

class _Tab4State extends State<Tab4> {
  @override
  Widget build(BuildContext context) {
    //设备宽度
    double deviceWidth = MediaQuery.of(context).size.width;

    //背景容器
    return Container(
      width: deviceWidth,
      color: Colors.white,
      padding: EdgeInsets.only(
        top: 10,
        bottom: 10,
      ),
      child: _build(context, deviceWidth),
    );
  }

  Widget _build(BuildContext context, double deviceWidth) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Text(
            "No Likes",
            style: TextStyle(
              fontSize: 32.0, 
            ),
          ),
        ),
    
    );
  }
}
