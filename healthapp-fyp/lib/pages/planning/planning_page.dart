import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:TMW/models/task.dart';
import 'package:TMW/pages/planning//add_task.dart';
import 'package:TMW/pages/planning/task_detail.dart';


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:TMW/widgets/provider_widget.dart';


class PlanningPage extends StatefulWidget {

  PlanningPage({Key key}) : super(key: key);

  @override
  _PlanningPageState createState() => _PlanningPageState();
}

class _PlanningPageState extends State<PlanningPage> {
  

  List list = new List();
  //   void initState() {
  //   super.initState();
  //   _taskController.text = widget.trip.title.toString();
  
  // }

  @override
  Widget build(BuildContext context) {
    final newTrip = new Trip(null, null, null);
    
    return Scaffold(
      backgroundColor: Colors.deepPurple[600],
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            width: 400,
            height: 600,
            child: Image.asset(
              'assets/images/image.png',
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            child: Text(
              "Goals",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold),
            ),
            top: 40,
            left: 20,
          ),
          DraggableScrollableSheet(
            maxChildSize: 0.85,
            minChildSize: 0.1,
            builder: (BuildContext context, ScrollController scrolController) {
              return Stack(
                overflow: Overflow.visible,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(40),
                          topLeft: Radius.circular(40)),
                    ),
                    child: StreamBuilder(
                        stream: getUsersTasksStreamSnapshots(context),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) return const Text("");
                          return new ListView.builder(
                            itemCount: snapshot.data.documents.length,
                            controller: scrolController,
                            itemBuilder: (BuildContext context, int index) =>
                                buildTaskList(
                                    context, snapshot.data.documents[index]),
                          );
                        }),
                  ),
                  Positioned(
                    child: FloatingActionButton(
                      child: Icon(
                        Icons.add,
                        color: Colors.black,
                      ),
                      backgroundColor: Colors.yellowAccent,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NewTripLocationView(
                                    trip: newTrip,
                                  )),
                        );
                      },
                    ),
                    top: -30,
                    right: 30,
                  )
                ],
              );
            },
          )
        ],
      ),
    );
  }

  Stream<QuerySnapshot> getUsersTasksStreamSnapshots(
      BuildContext context) async* {
    final uid = await Provider2.of(context).auth.getCurrentUID();
    yield* Firestore.instance
        .collection('User')
        .document(uid)
        .collection('Task')
        .snapshots();
  }

  Widget buildTaskList(BuildContext context, DocumentSnapshot document) {
    final trip = Trip.fromSnapshot(document);
    return new Container(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text(
                trip.title,
                style: new TextStyle(
                    color: Colors.grey[900], fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                "${DateFormat('dd/MM/yyyy').format(trip.startDate).toString()} - ${DateFormat('dd/MM/yyyy').format(trip.endDate).toString()}",
                style: TextStyle(color: Colors.grey[700]),
              ),
              trailing: Icon(
                Icons.edit,
                color: Colors.pinkAccent,
              ),
              onTap: () {
                  Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => TaskDetail(trip: trip)),
            );
              }
            ),
          ],
        ),
      ),
    );
  }

}
