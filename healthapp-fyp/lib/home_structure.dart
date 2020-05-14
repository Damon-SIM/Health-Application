import 'package:TMW/pages/diet/diet_page.dart';
import 'package:TMW/pages/drawer/contact_us.dart';
import 'package:TMW/pages/drawer/setting.dart';
import 'package:TMW/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'pages/dashboard/dashboard_home.dart';
import 'pages/drawer/about_us.dart';
import 'pages/drawer/password_change.dart';
import 'pages/planning/planning_page.dart';
import 'pages/training/training_page.dart';
import 'pages/userinfo/userinfo_page.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:TMW/widgets/provider_widget.dart';

class App extends StatefulWidget {
  App({Key key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  //当前选择页面索引

  GlobalKey _bottomNavigationKey = GlobalKey();
  var _currentIndex = 0;

  DietPage dietPage;

  PlanningPage planningPage;

  TrainingPage trainingPage;

  DashboardPage dashboardPage;

  UserInfoPage userInfoPage;

  //根据当前索引返回不同页面
  currentPage() {
    switch (_currentIndex) {
      case 0:
        if (planningPage == null) {
          planningPage = PlanningPage();
        }
        return planningPage;
      case 1:
        if (dietPage == null) {
          dietPage = DietPage();
        }
        return dietPage;
      case 2:
        if (trainingPage == null) {
          trainingPage = TrainingPage();
        }
        return trainingPage;
      case 3:
        if (dashboardPage == null) {
          dashboardPage = DashboardPage();
        }
        return dashboardPage;
      case 4:
        if (userInfoPage == null) {
          userInfoPage = UserInfoPage();
        }
        return userInfoPage;
      default:
    }
  }

  @override
  Widget build(BuildContext con) {
    return Scaffold(
      //中间
      body: currentPage(),
      //底部
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
        height: 50.0,
        items: <Widget>[
          Icon(Icons.book, size: 30),
          Icon(Icons.shopping_basket, size: 30),
          Icon(Icons.fitness_center, size: 30),
          Icon(Icons.pie_chart, size: 30),
          Icon(Icons.person, size: 30),
        ],
        color: Color(0xFFfbab66),
        buttonBackgroundColor: Colors.orange[300],
        backgroundColor: Colors.white,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 300),
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      //侧边栏
      drawer: Drawer(
          child: Row(children: <Widget>[
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: const [
                  Color(0xFF6a58f1),
                  Color(0xFFa28bf4),
                  Color(0xFFe4c6f7),
                  Color(0xFFa3dcdf),
                  Color(0xFF6fe8cd),

                  // Color(0xFF0e157b),
                  // Color(0xFF613ea3),
                  // Color(0xFFed738b),
                  // Color(0xFFfd9d53),
                  // Color(0xFFfcc0cf),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 100,
                ),
                ListTile(
                  title: Text(
                    "Welcome !",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w800),
                  ),
                  subtitle: Text(
                    "Our Email: wt6@gmail.com",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
                Divider(
                  height: 64,
                  thickness: 0.5,
                  color: Colors.white.withOpacity(0.3),
                  indent: 32,
                  endIndent: 32,
                ),
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    child: Icon(Icons.person, color: Colors.white),
                  ),
                  title: Text(
                    'My Account',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ChangePassPage()));
                  },
                ),
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    child: Icon(Icons.location_on, color: Colors.white),
                  ),
                  title: Text(
                    'About Us',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AboutUs()));
                  },
                ),
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    child: Icon(Icons.email, color: Colors.white),
                  ),
                  title: Text(
                    'Contact Us',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ContactUs()));
                  },
                ),
                Divider(
                  height: 64,
                  thickness: 0.5,
                  color: Colors.white.withOpacity(0.3),
                  indent: 32,
                  endIndent: 32,
                ),
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    child: Icon(Icons.settings, color: Colors.white),
                  ),
                  title: Text(
                    'Setting',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Setting()));
                  },
                ),
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    child: Icon(Icons.exit_to_app, color: Colors.white),
                  ),
                  title: Text(
                    'Logout',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onTap: () async {
                    try {
                      AuthService auth = Provider2.of(context).auth;
                      await auth.signOut();
                      print("Signed Out!");
                    } catch (e) {
                      print(e);
                    }
                  },
                ),
              ],
            ),
          ),
        )
      ])),
    );
  }
}
