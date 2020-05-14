import 'package:TMW/models/task.dart';
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:TMW/widgets/provider_widget.dart';

class TaskDetail extends StatefulWidget {
  final Trip trip;

  TaskDetail({Key key, @required this.trip}) : super(key: key);

  @override
  _TaskDetailState createState() => _TaskDetailState();
}

class _TaskDetailState extends State<TaskDetail> {
  TextEditingController _taskController = TextEditingController();

  void initState() {
    super.initState();
    _taskController.text = widget.trip.title.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Task Details'),
      //   backgroundColor: Colors.green,
      // ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Color(0xff622F74),
              gradient: LinearGradient(
                colors: [Color(0xff6094e8), Color(0xffde5cbc)],
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
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
            margin: EdgeInsets.only(top: 200),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Update Your Task",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Update your task',
                            fillColor: Colors.white,
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 2.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.pinkAccent, width: 2.0),
                            ),
                          ),
                          controller: _taskController,
                        ),
                      ),
                    ],
                  ),
                  // Row(
                  //   children: <Widget>[
                  //     Padding(
                  //       padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
                  //       child: Text(
                  //           "${DateFormat('MM/dd/yyyy').format(widget.trip.startDate).toString()} - ${DateFormat('MM/dd/yyyy').format(widget.trip.endDate).toString()}"),
                  //     ),
                  //   ],
                  // ),
                  SizedBox(height: 20),
                  GestureDetector(
                    onTap: () async {
                      widget.trip.title = _taskController.text;
                      await updateTrip(context);
                      Navigator.of(context).pop();
                    },
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.only(left: 0, right: 0, bottom: 20),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(100))),
                        child: Text(
                          "Update",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                          textAlign: TextAlign.center,
                        )),
                  ),
                  GestureDetector(
                    onTap: () async {
                      await deleteTrip(context);
                      Navigator.of(context).pop();
                    },
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.only(left: 0, right: 0, bottom: 20),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(100))),
                        child: Text(
                          "Delete",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                          textAlign: TextAlign.center,
                        )),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future updateTrip(context) async {
    var uid = await Provider2.of(context).auth.getCurrentUID();
    final doc = Firestore.instance
        .collection('User')
        .document(uid)
        .collection("Task")
        .document(widget.trip.documentId);

    return await doc.setData(widget.trip.toJson());
  }

  Future deleteTrip(context) async {
    var uid = await Provider2.of(context).auth.getCurrentUID();
    final doc = Firestore.instance
        .collection('User')
        .document(uid)
        .collection("Task")
        .document(widget.trip.documentId);

    return await doc.delete();
  }
}
