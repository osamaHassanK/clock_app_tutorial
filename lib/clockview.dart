import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class ClockView extends StatefulWidget {
  const ClockView({Key? key}) : super(key: key);

  @override
  State<ClockView> createState() => _ClockViewState();
}

class _ClockViewState extends State<ClockView> {
  initState(){
    Timer.periodic(Duration(microseconds: 1), (timer) {
      setState(() {

      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
       return Container(
      height: 300,
      width: 300,
      child: Transform.rotate(
        angle: -pi/2,
        child: CustomPaint(
          painter: ClockPainter(),
        ),
      ),
    );
  }
}

class ClockPainter extends CustomPainter{
  var currentTime  = DateTime.now();
  @override
  void paint(Canvas canvas, Size size) {
    var centerX =size.width*0.5;
    var centerY = size.width*0.5;

    var center = Offset(centerX, centerY);
    var radius = min(centerX, centerY);

    var fillbrush = Paint()..color= Colors.white12;
    canvas.drawCircle(center, radius, fillbrush);

    var brushCircle3 = Paint()..color= Color(0xffd92d7b);
    canvas.drawCircle(center, 8,brushCircle3);

    var brushCircle2= Paint()..color=Colors.white..style=PaintingStyle.stroke..strokeWidth=20;
    canvas.drawCircle(center, radius, brushCircle2);

    var secHandX = centerX+120*cos(currentTime.second*6*pi/180);  //we use cos for x
    var secHandY = centerX+120*sin(currentTime.second*6*pi/180);  //we use sin for y
    var brushSec =Paint()..color=Colors.white..strokeWidth=5..strokeCap=StrokeCap.round;
    canvas.drawLine(center, Offset(secHandX,secHandY), brushSec);


    var minHandX = centerX+90*cos(currentTime.minute*6*pi/180);  //we use cos for x
    var minHandY = centerX+90*sin(currentTime.minute*6*pi/180);  //we use sin for y
    var brushMin =Paint()..color=Colors.purple..strokeWidth=8..strokeCap=StrokeCap.round;
    canvas.drawLine(center, Offset(minHandX,minHandY), brushMin);

    var hourHandX = centerX+60*cos(currentTime.hour*30*currentTime.minute*0.5*pi/180);  //we use cos for x
    var hourHandY = centerX+60*sin(currentTime.hour*30*currentTime.minute*0.5*pi/180);  //we use sin for y
    var brushHour =Paint()..color=Colors.black..strokeWidth=8..strokeCap=StrokeCap.round;
    canvas.drawLine(center, Offset(hourHandX,hourHandY), brushHour);





  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }


}