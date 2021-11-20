// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'clock_view.dart';

void main() {
  runApp(const Clock());
}

class Clock extends StatelessWidget {
  const Clock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DefaultTabController(
          length: 5,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Color(0xff1E2739),
              elevation: 0.0,
              bottom: PreferredSize(
                child: TabBar(
                  tabs: [
                    Tab(
                        icon: ImageIcon(
                            AssetImage('assets/images/desklamp.png'),
                            color: Color(0xffFFAC00))),
                    Tab(
                        icon: ImageIcon(
                            AssetImage('assets/images/television.png'))),
                    Tab(
                        icon: ImageIcon(
                            AssetImage('assets/images/air-conditioner.png'))),
                    Tab(icon: ImageIcon(AssetImage('assets/images/lamp.png'))),
                    Tab(
                        icon: ImageIcon(
                            AssetImage('assets/images/musical-note.png'))),
                  ],
                ),
                preferredSize: Size.fromHeight(70),
              ),
              title: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  // SizedBox(
                  //   height: 10,
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Living-room',
                          style: TextStyle(color: Colors.grey, fontSize: 30)),
                      Icon(
                        Icons.keyboard_arrow_down_sharp,
                        size: 30,
                        color: Colors.grey,
                      )
                    ],
                  ),
                  // SizedBox(
                  //   height: 10,
                  // ),
                  Text('Work Lamp',
                      style: TextStyle(color: Colors.grey, fontSize: 15)),
                  // SizedBox(
                  //   height: 10,
                  // ),
                ],
              ),
              centerTitle: true,
            ),
            body: Container(
              alignment: Alignment.center,
              color: Color(0xff171C2A),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 30, 0, 15),
                    child: ClockView(),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Color(0xff272E45),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(
                            Icons.check_circle_outline,
                            color: Colors.grey,
                            size: 30,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Icon(
                            Icons.wb_sunny_outlined,
                            color: Colors.grey,
                            size: 30,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Icon(
                            Icons.loop_sharp,
                            color: Colors.grey,
                            size: 30,
                          ),
                        ],
                      ),
                    ),
                  ),
                  //SizedBox(height: 20),
                  CircleAvatar(
                    radius: 30.0,
                    backgroundColor: Color(
                      0xff272E45,
                    ),
                    child: Icon(
                      Icons.access_time_outlined,
                      size: 30,
                    ),
                  ),
                  //SizedBox(height: 10),
                  CircleAvatar(
                    radius: 30.0,
                    backgroundColor: Color(
                      0xffFFAC00,
                    ),
                    child: Icon(
                      Icons.power_settings_new,
                      size: 30,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
