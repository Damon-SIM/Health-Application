import 'package:flutter/material.dart';

import 'age_selection.dart';

class SexSelectionPage extends StatefulWidget {
  SexSelectionPage({Key key}) : super(key: key);

  @override
  _SexSelectionPageState createState() => _SexSelectionPageState();
}

class _SexSelectionPageState extends State<SexSelectionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(left: 32.0, top: 80, bottom: 20),
            alignment: Alignment.centerLeft,
            child: Column(
              children: <Widget>[
                Text(
                  'Help us tailor the',
                  style: TextStyle(fontSize: 25),
                ),
                Text(
                  'experience to you',
                  style: TextStyle(fontSize: 25),
                ),
              ],
            ),
          ),
          Container(
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
              child: Container(
                width: 350.0,
                height: 200.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: AssetImage(
                        'assets/images/selection/1.png',
                      ),
                      fit: BoxFit.cover),
                ),
                 child: FavoriteWidget(),
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
              child: Container(
                width: 350.0,
                height: 200.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: AssetImage(
                        'assets/images/selection/2.png',
                      ),
                      fit: BoxFit.cover),
                ),
                child: FavoriteWidget(),
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  'You ar all set',
                  style: TextStyle(fontSize: 30),
                ),
                SizedBox(
                  width: 52.0,
                ),
                FloatingActionButton(
                  child: Icon(
                    Icons.navigate_next,
                    color: Colors.white,
                  ),
                  backgroundColor: Colors.purpleAccent,
                  onPressed: () {
                    Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AgeSelect()));
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FavoriteWidget extends StatefulWidget {
  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = true;
  int _favoriteCount = 1;

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _favoriteCount -= 1;
        _isFavorited = false;
      } else {
        _favoriteCount += 1;
        _isFavorited = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 130.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
            icon: (_isFavorited
                ? Icon(Icons.check_circle_outline)
                : Icon(Icons.check_circle)),
            color: Colors.white,
            iconSize: 40,
            onPressed: _toggleFavorite,
          ),
        ],
      ),
    );
  }
}
