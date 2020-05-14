import 'package:TMW/widgets/provider_widget.dart';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'dart:io';

class UserInfoPage extends StatefulWidget {
  UserInfoPage({Key key}) : super(key: key);

  @override
  _UserInfoPageState createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage> {
  var _height;
  var _weight;
  File _image;
  final heightCon = new TextEditingController();
  final weightCon = new TextEditingController();

  Future<String> createAlertDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            title: Text("Height"),
            content: TextField(
              keyboardType: TextInputType.number,
              controller: heightCon,
              decoration: InputDecoration(
                hintText: 'Change Your Height',
                fillColor: Colors.white,
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.pink, width: 2.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green, width: 2.0),
                ),
              ),
            ),
            actions: <Widget>[
              MaterialButton(
                  elevation: 5.0,
                  child: Text("Saved"),
                  onPressed: () {
                    setState(() {
                      _height = heightCon.text;
                    });
                    Navigator.of(context).pop();
                  }),
            ],
          );
        });
  }

  Future<String> createAlertDialog2(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            title: Text("Weight"),
            content: TextField(
              keyboardType: TextInputType.number,
              controller: weightCon,
              decoration: InputDecoration(
                hintText: 'Change Your Weight',
                fillColor: Colors.white,
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange, width: 2.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green, width: 2.0),
                ),
              ),
            ),
            actions: <Widget>[
              MaterialButton(
                  elevation: 5.0,
                  child: Text("Saved"),
                  onPressed: () {
                    setState(() {
                      _weight = weightCon.text;
                    });
                    Navigator.of(context).pop();
                  }),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          FutureBuilder(
            future: Provider2.of(context).auth.getCurrentUser(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return displayUserInformation(context, snapshot);
              } else {
                return CircularProgressIndicator();
              }
            },
          )
        ],
      ),
    );
  }

  Widget displayUserInformation(context, snapshot) {
    Future getImage() async {
      var image = await ImagePicker.pickImage(source: ImageSource.gallery);

      setState(() {
        _image = image;
        print('Image Path $_image');
      });
    }

    final user = snapshot.data;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ClipPath(
          child: Container(
            height: 350,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFf7418c), Color(0xFFfbab66)],
                begin: Alignment.topLeft,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            getImage();
                          },
                        ),
                      ],
                    )),
                Padding(
                    padding: EdgeInsets.only(top: 10, left: 32),
                    child: SizedBox(
                      width: 100,
                      height: 100,
                      child: Stack(
                        alignment: AlignmentDirectional.bottomCenter,
                        children: <Widget>[
                          ClipOval(
                            child: new SizedBox(
                              width: 180.0,
                              height: 180.0,
                              child: (_image != null)
                                  ? Image.file(
                                      _image,
                                      fit: BoxFit.fill,
                                    )
                                  : Image.asset(
                                      "assets/images/user.png",
                                      fit: BoxFit.fill,
                                    ),
                            ),
                          ),
                        ],
                      ),
                    )),
                Padding(
                  padding: EdgeInsets.only(top: 15, left: 32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "${user.displayName}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 26),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${user.email}",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          clipper: MyWavyClipper(),
        ),
        Container(
            width: MediaQuery.of(context).size.width,
            height: 280,
            padding: EdgeInsets.only(left: 32),
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Text(
                    'Height (Centimetres)',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () {
                    createAlertDialog(context);
                  },
                  subtitle: Text('Click to update data'),
                  trailing: Text('$_height cm'),
                ),
                Divider(),
                ListTile(
                  title: Text(
                    'Weight (Kilograms)',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text('Click to update data'),
                  trailing: Text('$_weight kg'),
                  onTap: () {
                    createAlertDialog2(context);
                  },
                ),
                Divider(),
                ListTile(
                  title: Row(
                    children: <Widget>[
                      Icon(Icons.help_outline),
                      SizedBox(width: 5.0),
                      Text(
                        'Need Help ?',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  trailing: Icon(Icons.navigate_next),
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => ChangePassPage()));
                  },
                ),
              ],
            )),
      ],
    );
  }
}

class MyWavyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    var path = Path();

    path.lineTo(0, size.height - 80);

    path.quadraticBezierTo(
        0.3 * size.width, size.height, 0.68 * size.width, size.height - 80);

    path.lineTo(0.68 * size.width, size.height - 80);

    path.quadraticBezierTo(
        0.8416 * size.width, size.height - 120, size.width, size.height - 80);

    path.lineTo(size.width, size.height - 80);

    path.lineTo(size.width, 0);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
}
