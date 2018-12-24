import 'package:flutter/material.dart';
import 'package:flutter_egg_timer/constants.dart';
import 'package:flutter_egg_timer/egg_timer.dart';
import 'package:flutter_egg_timer/egg_timer_controls.dart';
import 'package:flutter_egg_timer/egg_timer_dial.dart';
import 'package:flutter_egg_timer/egg_timer_time_display.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() {
    return new _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  EggTimer eggTimer;

  _MyAppState() {
    eggTimer = new EggTimer(
      maxTime: Duration(minutes: 35),
      onTimerUpdate: _onTimerUpdate,
    );
  }

  _onTimeSelected(Duration newTime) {
    setState(() {
      eggTimer.currentTime = newTime;
    });
  }

  _onDialStopTurning(Duration newTime) {
    setState(() {
      eggTimer.currentTime = newTime;
      eggTimer.resume();
    });
  }

  _onTimerUpdate() {
    setState(() {});
  }

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
              end: Alignment.bottomCenter,
            ),
          ),
          child: Center(
            child: Column(
              children: [
                EggTimerTimeDisplay(
                  eggTimerState: eggTimer.state,
                  selectionTime: eggTimer.lastStartTime,
                  countdownTime: eggTimer.currentTime,
                ),
                EggTimerDial(
                  currentTime: eggTimer.currentTime,
                  maxTime: eggTimer.maxTime,
                  ticksPerSection: 5,
                  onTimeSelected: _onTimeSelected,
                  onDialStopTurning: _onDialStopTurning,
                ),
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
