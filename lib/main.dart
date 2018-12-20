import 'package:flutter/material.dart';
import 'package:flutter_egg_timer/fluttery/framing.dart';

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
        body: Center(
          child: Column(
            children: [
              RandomColorBlock(
                width: double.infinity,
                height: 150.0,
              ),
              RandomColorBlock(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.all(30.0),
                  child: AspectRatio(
                    aspectRatio: 1.0,
                    child: RandomColorBlock(
                      width: double.infinity,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(),
              ),
              RandomColorBlock(
                width: double.infinity,
                height: 50.0,
              ),
              RandomColorBlock(
                width: double.infinity,
                height: 50.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
