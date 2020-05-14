import 'package:TMW/services/training_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'timer/timer.dart';
import 'building_sliver.dart';

class BuildingDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BuildingNotifier buildingNotifier = Provider.of<BuildingNotifier>(context);

    return Scaffold(
        body: CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          centerTitle: true,
          title: Text(
            'Task Details',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25.0,
            ),
          ),
          pinned: true,
          expandedHeight: 240.0,
          flexibleSpace: FlexibleSpaceBar(background: MyFlexiableAppBar2()),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Column(
                children: buildingNotifier.currentBuilding.subType
                    .map(
                      (ingredient) => Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                image: NetworkImage(
                                  buildingNotifier.currentBuilding.image,
                                ),
                                fit: BoxFit.cover),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(bottom:20.0, top: 40.0),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Text(
                                      ingredient,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          backgroundColor: Colors.white54,
                                          ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 30.0,
                                ),
                                RaisedButton(
                                  child: Text('GO'),
                                  splashColor: Colors.blue,
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                CountDownTimer()));
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
              Container(
                height: 200,
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
