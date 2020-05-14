import 'package:TMW/main.dart';
import 'package:flutter/material.dart';
import 'wave_slider.dart';


class AgeSelect extends StatefulWidget {
  @override
  _AgeSelectState createState() => _AgeSelectState();
}

class _AgeSelectState extends State<AgeSelect> {
  int _age = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Select Your Age',
                style: TextStyle(
                  fontSize: 45,
                ),
              ),
              WaveSlider(
                onChanged: (double val) {
                  setState(() {
                    _age = (val * 100).round();
                  });
                },
              ),
              SizedBox(
                height: 50.0,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: <Widget>[
                  SizedBox(width: 20.0),
                  Text(
                    _age.toString(),
                    style: TextStyle(fontSize: 45.0),
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Text(
                    'YEARS',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                ],
              ),
              SizedBox(
                    height: 50.0,
                  ),
              RaisedButton(
                  color: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 10.0, bottom: 10.0, left: 30.0, right: 30.0),
                    child: Text(
                      "Finished",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Wrapper()));
                  },
                ),
            
            ],
          ),
        ),
      ),
    );
  }
}