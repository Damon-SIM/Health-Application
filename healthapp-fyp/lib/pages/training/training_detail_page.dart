import 'package:TMW/services/training_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'course/constants.dart';
import 'course/custom_tile.dart';
import 'sliver_background.dart';

class TrainingDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TrainingNotifier trainingNotifier = Provider.of<TrainingNotifier>(context);

    return Scaffold(
        backgroundColor: Color(0xFF0099ff),
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              centerTitle: true,
              title: Text(
                "Training",
                // textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
              pinned: true,
              expandedHeight: 240.0,
              flexibleSpace: FlexibleSpaceBar(background: MyFlexiableAppBar()),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(
                            top: Radius.circular(25),
                            bottom: Radius.circular(25))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 40,
                          ),
                          Text(
                            'Course Content',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Column(
                            children: courseContent.map((content) {
                              return CustomTile(content['number'],
                                  content['title'], content['time']);
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height/4,
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
