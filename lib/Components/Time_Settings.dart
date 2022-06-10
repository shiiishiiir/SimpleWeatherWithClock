import 'dart:async';

import 'package:flutter/material.dart';

class MyTimeSettings extends StatefulWidget {
  const MyTimeSettings({Key? key}) : super(key: key);

  @override
  State<MyTimeSettings> createState() => _MyTimeSettingsState();
}

class _MyTimeSettingsState extends State<MyTimeSettings> {
  TimeOfDay _timeOfDay = TimeOfDay.now();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (_timeOfDay.minute != TimeOfDay.now().minute) {
        setState(() {
          _timeOfDay = TimeOfDay.now();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String _period = _timeOfDay.period == DayPeriod.am ? "AM" : "PM";
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "${_timeOfDay.hourOfPeriod} : ${_timeOfDay.minute}",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              fontSize: 50,
              letterSpacing: 02),
        ),
        SizedBox(
          width: 5,
        ),
        RotatedBox(
          quarterTurns: 3,
          child: Text(
            _period,
            style: TextStyle(fontSize: 20, letterSpacing: 03),
          ),
        ),
      ],
    );
  }
}
