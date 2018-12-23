import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_egg_timer/constants.dart';

class EggTimerDialKnob extends StatefulWidget {
  final rotationPercent;

  const EggTimerDialKnob({this.rotationPercent});

  @override
  _EggTimerDialKnobState createState() => _EggTimerDialKnobState();
}

class _EggTimerDialKnobState extends State<EggTimerDialKnob> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          width: double.infinity,
          height: double.infinity,
          child: CustomPaint(
            painter: ArrowPainter(rotationPercent: widget.rotationPercent),
          ),
        ),
        Container(
          padding: EdgeInsets.all(10.0),
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
          child: Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Color(0xFFDFDFDF),
                  width: 1.5,
                )),
            child: Center(
              child: Transform(
                transform: Matrix4.rotationZ(2 * pi * widget.rotationPercent),
                alignment: Alignment.center,
                child: Image.network(
                  'https://avatars3.githubusercontent.com/u/14101776?s=400&v=4',
                  width: 50,
                  height: 50,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class ArrowPainter extends CustomPainter {
  final Paint dialArrowPaint;
  final double rotationPercent;

  ArrowPainter({this.rotationPercent}) : dialArrowPaint = new Paint() {
    dialArrowPaint.color = Colors.black;
    dialArrowPaint.style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.save();
    final radius = size.height / 2;
    canvas.translate(radius, radius);
    canvas.rotate(2 * pi * rotationPercent);

    Path path = new Path();
    path.moveTo(0.0, -radius - 10.0);
    path.lineTo(10.0, -radius + 5.0);
    path.lineTo(-10.0, -radius + 5.0);
    path.close();

    canvas.drawPath(path, dialArrowPaint);
    canvas.drawShadow(path, Colors.black, 3.0, false);

    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
