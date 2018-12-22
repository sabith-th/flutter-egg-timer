import 'package:flutter/material.dart';
import 'package:flutter_egg_timer/egg_timer_controls.dart';
import 'package:flutter_egg_timer/egg_timer_dial.dart';
import 'package:flutter_egg_timer/egg_timer_time_display.dart';
import 'package:flutter_egg_timer/constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Egg Timer',
      theme: ThemeData(
        fontFamily: 'BebasNeue',
      ),
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [gradientTop, gradientBottom],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
          child: Center(
            child: Column(
              children: [
                EggTimerTimeDisplay(),
                EggTimerDial(),
                Expanded(
                  child: Container(),
                ),
                EggTimerControls()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
