import 'package:flutter/material.dart';

const Color GRADIENT_TOP = Color(0xFFF5F5F5);
const Color GRADIENT_BOTTOM = Color(0xFFE8E8E8);

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
                    colors: [GRADIENT_TOP, GRADIENT_BOTTOM],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter),
                boxShadow: [
                  BoxShadow(
                      color: Color(0x44000000),
                      blurRadius: 2.0,
                      spreadRadius: 1.0,
                      offset: Offset(0.0, 1.0))
                ]),
            child: Padding(
              padding: EdgeInsets.all(65.0),
              child: Container(
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                        colors: [GRADIENT_TOP, GRADIENT_BOTTOM],
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
              ),
            ),
          ),
        ),
      ),
    );
  }
}
