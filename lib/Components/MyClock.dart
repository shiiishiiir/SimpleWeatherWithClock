import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class MyClock extends StatefulWidget {
  const MyClock({Key? key}) : super(key: key);

  @override
  State<MyClock> createState() => _MyClockState();
}

class _MyClockState extends State<MyClock> {
  DateTime _dateTime = DateTime.now();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _dateTime=DateTime.now();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.1,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: <BoxShadow>[
            BoxShadow(
                offset: Offset(0, 0), blurRadius: 64, color: Colors.black12),
          ],
        ),
        child: Transform.rotate(
          angle: -pi/2,
          child: CustomPaint(
            painter: ClockPainter(context, _dateTime),
          ),
        ),
      ),
    );
  }
}

class ClockPainter extends CustomPainter {
  final BuildContext context;
  final DateTime dateTime;

  ClockPainter(this.context, this.dateTime);
  @override
  void paint(Canvas canvas, Size size) {
    double centerX = size.width / 2;
    double centerY = size.height / 2;
    Offset center = Offset(centerX, centerY);

    // Minute Calculation
    double minX =
        centerX + size.width * 0.35 * cos((dateTime.minute * 6) * pi / 180);
    double minY =
        centerY + size.width * 0.35 * sin((dateTime.minute * 6) * pi / 180);
    //Minute Line
    canvas.drawLine(center, Offset(minX, minY), Paint()..color = Colors.blueGrey..style=PaintingStyle.stroke..strokeWidth=4);

    // Hour Calculation
    // dateTime.hour * 30 because 360/12 = 30
    // dateTime.minute * 0.5 each minute we want to turn our hour line a little
    double hourX = centerX +
        size.width *
            0.3 *
            cos((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);
    double hourY = centerY +
        size.width *
            0.3 *
            sin((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);
    // hour Line
    canvas.drawLine(center, Offset(hourX, hourY), Paint()..color = Colors.indigoAccent..strokeWidth=6);


    // Second Calculation
    // size.width * 0.4 define our line height
    // dateTime.second * 6 because 360 / 60 = 6
    double secondX =
        centerX + size.width * 0.4 * cos((dateTime.second * 6) * pi / 180);
    double secondY =
        centerY + size.width * 0.4 * sin((dateTime.second * 6) * pi / 180);
    // Second Line
    canvas.drawLine(center, Offset(secondX, secondY), Paint()..color = Colors.brown..strokeWidth=2);



    canvas.drawCircle(
        center, 20, Paint()..color = Colors.black12);
    canvas.drawCircle(center, 18, Paint()..color = Colors.white);
    canvas.drawCircle(center, 10, Paint()..color = Colors.black12);




  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
