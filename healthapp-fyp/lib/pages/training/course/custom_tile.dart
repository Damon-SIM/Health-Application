import 'package:TMW/pages/training/timer/timer.dart';
import 'package:flutter/material.dart';

class CustomTile extends StatelessWidget {
  final _number;
  final _title;
  final _time;

  CustomTile(this._number, this._title, this._time);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.only(bottom: 15.0),
      leading: Text(
        _number,
        style: TextStyle(
          color: Color(0xffE4E7F4),
          fontWeight: FontWeight.bold,
          fontSize: 30,
        ),
      ),
      title: Text(
        _title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
      subtitle: Text(_time),
      trailing: MaterialButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => CountDownTimer()));
        },
        color: Color(0xff49CC96),
        padding: EdgeInsets.all(7),
        minWidth: 30,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        child: Icon(
          Icons.arrow_right,
          size: 30,
          color: Colors.white,
        ),
      ),
    );
  }
}
