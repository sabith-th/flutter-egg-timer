import 'package:flutter/material.dart';
import 'package:flutter_egg_timer/constants.dart';

class EggTimerDialKnob extends StatefulWidget {
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
            painter: ArrowPainter(),
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
              child: Image.network(
                'https://avatars3.githubusercontent.com/u/14101776?s=400&v=4',
                width: 50,
                height: 50,
                color: Colors.black,
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

  ArrowPainter() : dialArrowPaint = new Paint() {
    dialArrowPaint.color = Colors.black;
    dialArrowPaint.style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.save();
    canvas.translate(size.width / 2, 0.0);

    Path path = new Path();
    path.moveTo(0.0, -10.0);
    path.lineTo(10.0, 5.0);
    path.lineTo(-10.0, 5.0);
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
