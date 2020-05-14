import 'package:TMW/services/api.dart';
import 'package:TMW/services/training_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:TMW/pages/training/building_detail_page.dart';


class Tab3 extends StatefulWidget {
  Tab3({Key key}) : super(key: key);

  @override
  _Tab3State createState() => _Tab3State();
}

class _Tab3State extends State<Tab3> {
   @override
  void initState() {
    BuildingNotifier buildingNotifier =
        Provider.of<BuildingNotifier>(context, listen: false);
    getBuilding(buildingNotifier);
    super.initState();
  }

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
    double itemWidth = deviceWidth * 168.5 / 180;

    BuildingNotifier buildingNotifier = Provider.of<BuildingNotifier>(context);

    return Scaffold(
        backgroundColor: Colors.white,
        body: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                buildingNotifier.currentBuilding =
                    buildingNotifier.buildingList[index];
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return BuildingDetail();
                }));
              },
              child: Container(
                width: itemWidth,
                margin: EdgeInsets.only(
                  top: 20,
                  left: 5,
                  right: 5,
                ),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: NetworkImage(
                          buildingNotifier.buildingList[index].image),
                      fit: BoxFit.cover),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey[400],
                        blurRadius: 10,
                        offset: Offset(0, 10))
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                buildingNotifier.buildingList[index].name,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                buildingNotifier.buildingList[index].desc,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                        FavoriteWidget(),
                      ],
                    ),
                    Text(
                      '${buildingNotifier.buildingList[index].mins} min',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            );
          },
          itemCount: buildingNotifier.buildingList.length,
          separatorBuilder: (BuildContext context, int index) {
            return Divider(
              color: Colors.white,
            );
          },
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
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 35,
          height: 35,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: IconButton(
            icon: (_isFavorited
                ? Icon(Icons.favorite_border)
                : Icon(Icons.favorite)),
            color: Colors.red,
            iconSize: 20,
            onPressed: _toggleFavorite,
          ),
        ),
      ],
    );
  }
}
