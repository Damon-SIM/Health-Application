import 'package:flutter/material.dart';

import 'account_card.dart';
import 'appointment_card.dart';
import 'chart_painter.dart';

Color primaryColor = Color(0xff0074ff);

class DashboardPage2 extends StatefulWidget {
  const DashboardPage2({Key key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage2> {
  String _currentMenuItem = 'Monthly';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Flexible(
          flex: 2,
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: 120,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Color(0xff4d9eff),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            _currentMenuItem,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          PopupMenuButton(
                            icon: Icon(
                              Icons.arrow_drop_down_circle,
                              color: Colors.white,
                              size: 20,
                            ),
                            onSelected: (value) {
                              setState(() {
                                _currentMenuItem = value;
                              });
                            },
                            itemBuilder: (BuildContext context) => [
                              PopupMenuItem(
                                value: 'Daily',
                                child: Text('Daily'),
                              ),
                              PopupMenuItem(
                                value: 'Weekly',
                                child: Text('Weekly'),
                              ),
                              PopupMenuItem(
                                value: 'Monthly',
                                child: Text('Monthly'),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Expanded(
                    child: CustomPaint(
                      foregroundPainter: ChartPainter(),
                    ),
                  ),
                  Container(
                    height: 30,
                    width: MediaQuery.of(context).size.width,
                    child: Stack(
                      children: _buildChartLegend(context),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Flexible(
          flex: 3,
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
              child: ListView(
                children: <Widget>[
                  Text(
                    "Training Records",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  _buildCard(context, child: AppointmentCard()),
                  SizedBox(height: 20),
                  Text(
                    "Today (04 May)",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  _buildCard(
                    context,
                    child: AccountCard(
                      name: 'Running',
                      id: 'Level: Beginner',
                      hour: '30:00 min',
                      active: true,
                    ),
                  ),
                  SizedBox(height: 10),
                  _buildCard(
                    context,
                    child: AccountCard(
                      name: 'PWR',
                      id: 'Level: One',
                      hour: '10:00 min',
                    ),
                  ),
                  SizedBox(height: 10),
                  _buildCard(
                    context,
                    child: AccountCard(
                      name: 'FIIERCE',
                      id: 'Level: Two',
                      hour: '15:00 min',
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCard(context, {Widget child}) {
    return Card(
      elevation: 2,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Container(
        height: 90,
        width: MediaQuery.of(context).size.width,
        child: child,
      ),
    );
  }

  List<Widget> _buildChartLegend(BuildContext context) {
    List<Widget> legend = [];
    int monthIndex = 0;
    for (double i = 1; i < 16.0; i++) {
      if (i % 2 != 0) {
        legend.add(
          Positioned(
            left: (i * 23) - 10,
            top: 10,
            child: Container(
              height: 30,
              child: Text(
                getMonth(monthIndex++),
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        );
      }
    }

    return legend.toList();
  }

  String getMonth(int index) {
    final months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug'];
    return months[index];
  }
}
