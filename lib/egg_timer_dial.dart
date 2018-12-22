import 'package:flutter/material.dart';
import 'package:flutter_egg_timer/egg_timer_knob.dart';
import 'package:flutter_egg_timer/constants.dart';
import 'dart:math';

class EggTimerDial extends StatefulWidget {
  @override
  _EggTimerDialState createState() => _EggTimerDialState();
}

class _EggTimerDialState extends State<EggTimerDial> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.all(30.0),
          child: AspectRatio(
            aspectRatio: 1.0,
            child: Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                      colors: [gradientTop, gradientBottom],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter),
                  boxShadow: [
                    BoxShadow(
                        color: Color(0x44000000),
                        blurRadius: 2.0,
                        spreadRadius: 1.0,
                        offset: Offset(0.0, 1.0))
                  ]),
              child: Stack(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    padding: EdgeInsets.all(55.0),
                    child: CustomPaint(
                      painter: TickPainter(),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.all(65.0), child: EggTimerDialKnob())
                ],
              ),
            ),
          ),
        ));
  }
}

class TickPainter extends CustomPainter {
  final longTick = 14.0;
  final shortTick = 4.0;

  final tickCount;
  final ticksPerSection;
  final tickInset;
  final tickPaint;

  TickPainter({
    this.tickCount = 35,
    this.ticksPerSection = 5,
    this.tickInset = 0.0,
  }) : tickPaint = new Paint() {
    tickPaint.color = Colors.black;
    tickPaint.strokeWidth = 1.5;
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(size.width / 2, size.height / 2);
    canvas.save();

    final radius = size.width / 2;
    for (var i = 0; i < tickCount; i++) {
      final tickLength = i % ticksPerSection == 0 ? longTick : shortTick;
      canvas.drawLine(
          Offset(0.0, -radius), Offset(0.0, -radius - tickLength), tickPaint);
      canvas.rotate(2 * pi / tickCount);
    }

    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
