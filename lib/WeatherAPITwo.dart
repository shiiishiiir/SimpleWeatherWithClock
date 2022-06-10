import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:weatherclock/Components/MyClock.dart';
import 'package:weatherclock/Components/Time_Settings.dart';

class WeatherAPICall extends StatefulWidget {
  const WeatherAPICall({Key? key}) : super(key: key);

  @override
  State<WeatherAPICall> createState() => _WeatherAPICallState();
}

class _WeatherAPICallState extends State<WeatherAPICall> {
  var cityname, maintemp, min, max, pressure, sunrise, sunset;

  Future sunRiseSet() async {
    final RiseSetAPI= await http.get(Uri.parse("https://api.sunrise-sunset.org/json?lat=36.7201600&lng=-4.4203400"));
    var sunData = jsonDecode(RiseSetAPI.body);

    setState(() {

      this.sunrise = sunData["results"]["sunrise"];
      this.sunset = sunData["results"]["sunset"];
    });
  }




  Future getWeather() async {
    final response = await http.get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=dhaka&units=metric&appid=31a1aa0c753b5b3f511601169347af60"));
    var showData = jsonDecode(response.body);

    setState(() {
      this.cityname = showData["name"];
      this.maintemp = showData["main"]["temp"];
      this.min = showData["main"]["temp_min"];
      this.max = showData["main"]["temp_max"];
      this.pressure = showData["main"]["pressure"];
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.getWeather();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Text(
            "Weather Updates",
            style: TextStyle(fontFamily: "azonix"),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: <Widget>[
              Card(
                elevation: 10,
                color: Colors.tealAccent[100],
                child: Container(
                  height: MediaQuery.of(context).size.height / 1.4,
                  width: MediaQuery.of(context).size.width,
                  decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(50)),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "You Are In ",
                            style: TextStyle(fontSize: 30),
                          ),
                          Text(cityname != null ? cityname.toString() : "Dhaka",
                              style: TextStyle(
                                  fontSize: 30,
                                  fontFamily: "azonix",
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                      Text(
                        maintemp != null
                            ? "Here is " + maintemp.toString() + "\u00B0 C"
                            : "Here is  30 \u00B0 C",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.redAccent),
                      ),
                      SizedBox(height: 10,),
                      MyClock(),
                      MyTimeSettings(),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10,),
              ListTile(
                leading: FaIcon(FontAwesomeIcons.temperatureLow),
                title: Text(" Minimum Temperature"),
                tileColor: Colors.tealAccent,
                trailing: Text(min != null
                    ? min.toString() + "\u00B0 C"
                    : "20 \u00B0 C"),
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                leading: FaIcon(FontAwesomeIcons.temperatureHigh),
                title: Text(" Maximum Temperature"),
                tileColor: Colors.greenAccent,
                trailing: Text(max != null
                    ? max.toString() + "\u00B0 C"
                    : "20 \u00B0 C"),
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                leading: FaIcon(FontAwesomeIcons.temperatureLow),
                title: Text(" Pressure "),
                tileColor: Colors.greenAccent,
                trailing: Text(pressure != null
                    ? pressure.toString() + " Pa "
                    : "20 Pa"),
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                leading: FaIcon(FontAwesomeIcons.sun),
                title: Text(" Sun Rise"),
                tileColor: Colors.tealAccent,
                trailing: Text(sunrise != null
                    ? sunrise.toString() + "AM "
                    : "05:20AM"),
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                leading: FaIcon(FontAwesomeIcons.cloudSun),
                title: Text(" Sun Set"),
                tileColor: Colors.greenAccent,
                trailing: Text(
                    sunset != null ? sunset.toString() + "PM " : "06:20PM"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}