import 'package:flutter/material.dart';
import 'package:TMW/models/task.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:TMW/widgets/provider_widget.dart';

class NewTripBudgetView extends StatelessWidget {
  final db = Firestore.instance;

  final Trip trip;
  NewTripBudgetView({Key key, @required this.trip}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: Color(0xff622F74),
            gradient: LinearGradient(
              colors: [Color(0xff29dfb7), Color(0xff3ec7fd)],
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
            ),
          ),
        ),
        Positioned(
          child: Container(
            margin: EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Row(
              children: <Widget>[
                Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(top: 15),
                  child: BackButton(),
                ),
              ],
            ),
          ),
        ),
        Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Task Name: ${trip.title}",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Start Date ${trip.startDate}",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "End Date ${trip.endDate}",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      child: Text("Finish"),
                      color: Colors.white,
                      textColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      onPressed: () async {
                        // save data to firebase
                        final uid =
                            await Provider2.of(context).auth.getCurrentUID();
                        await db
                            .collection("User")
                            .document(uid)
                            .collection("Task")
                            .add(trip.toJson());

                        Navigator.of(context).pushReplacementNamed('/home');
                      },
                    ),
                  ],
                ),
              ],
            )),
      ],
    ));
  }
}
