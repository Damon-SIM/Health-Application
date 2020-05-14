import 'package:TMW/pages/training/training_map_page.dart';
import 'package:TMW/services/training_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyFlexiableAppBar2 extends StatelessWidget {
  final double appBarHeight = 66.0;

  const MyFlexiableAppBar2();

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    BuildingNotifier buildingNotifier = Provider.of<BuildingNotifier>(context);

    return new Container(
      padding: new EdgeInsets.only(top: statusBarHeight),
      height: statusBarHeight + appBarHeight,
      child: new Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: new Text(buildingNotifier.currentBuilding.name,
                      style:
                          const TextStyle(color: Colors.white, fontSize: 28.0)),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 40.0),
                    child: new Text(
                        '${buildingNotifier.currentBuilding.desc}',
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                            fontSize: 36.0)),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 16.0, right: 8.0),
                    child: Container(
                        child: InkWell(
                      onTap: () {
                        // Navigator.of(context).push(
                        //     MaterialPageRoute(builder: (context) => GMap()));
                        Navigator.of(context)
                          .pushReplacementNamed('/map');
                      },
                      child: Row(
                        children: <Widget>[
                          Container(
                            child: Icon(
                              Icons.map,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            child: Text(
                              'Check Map',
                              style: const TextStyle(
                                  color: Colors.white70, fontSize: 16.0),
                            ),
                          ),
                        ],
                      ),
                    )),
                  ),
                ),
              ],
            ),
          ),
        ],
      )),
      decoration: new BoxDecoration(
        gradient: LinearGradient(
                  colors: const [Color(0xFF262AAA), Color(0xFF0099ff)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
      ),
    );
  }
}
