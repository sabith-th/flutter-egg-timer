import 'package:flutter/material.dart';
import 'package:flutter_egg_timer/egg_timer_knob.dart';
import 'package:flutter_egg_timer/constants.dart';
import 'dart:math';

class EggTimerDial extends StatefulWidget {
  final Duration currentTime;
  final Duration maxTime;
  final int ticksPerSection;

  const EggTimerDial(
      {this.currentTime = const Duration(minutes: 0),
      this.maxTime = const Duration(minutes: 35),
      this.ticksPerSection = 5});

  @override
  _EggTimerDialState createState() => _EggTimerDialState();
}

class _EggTimerDialState extends State<EggTimerDial> {
  _rotationPercent() {
    return widget.currentTime.inSeconds / widget.maxTime.inSeconds;
  }

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
                      painter: TickPainter(
                          tickCount: widget.maxTime.inMinutes,
                          ticksPerSection: widget.ticksPerSection),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.all(65.0),
                      child:
                          EggTimerDialKnob(rotationPercent: _rotationPercent()))
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
  final textPainter;
  final textStyle;

  TickPainter({
    this.tickCount = 35,
    this.ticksPerSection = 5,
    this.tickInset = 0.0,
  })  : tickPaint = new Paint(),
        textPainter = new TextPainter(
            textAlign: TextAlign.center, textDirection: TextDirection.ltr),
        textStyle = const TextStyle(
            color: Colors.black, fontFamily: 'BebasNeue', fontSize: 20.0) {
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

      if (i % ticksPerSection == 0) {
        canvas.save();
        canvas.translate(0.0, -(size.width / 2) - 30.0);

        textPainter.text = TextSpan(text: '$i', style: textStyle);
        textPainter.layout();

        final tickPercent = i / tickCount;
        var quadrant;
        if (tickPercent < 0.25) {
          quadrant = 1;
        } else if (tickPercent < 0.5) {
          quadrant = 4;
        } else if (tickPercent < 0.75) {
          quadrant = 3;
        } else {
          quadrant = 2;
        }

        switch (quadrant) {
          case 4:
            canvas.rotate(-pi / 2);
            break;
          case 2:
          case 3:
            canvas.rotate(pi / 2);
            break;
        }

        textPainter.paint(
            canvas, Offset(-textPainter.width / 2, -textPainter.height / 2));

        canvas.restore();
      }

      canvas.rotate(2 * pi / tickCount);
    }

    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
