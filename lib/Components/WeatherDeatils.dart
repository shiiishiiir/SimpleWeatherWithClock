import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

class WeatherApi extends StatefulWidget {
  const WeatherApi({Key? key}) : super(key: key);

  @override
  State<WeatherApi> createState() => _WeatherApiState();
}

class _WeatherApiState extends State<WeatherApi> {
  var cityname, maintemp;

  Future getWeather() async {
    final response = await http.get(Uri.parse("uri"));

    var showData = jsonDecode(response.body);

    setState(() {
      this.cityname = showData["name"];
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    this.getWeather();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(11.0),
            child: Card(
              elevation: 10,
              color: Colors.tealAccent[100],
              child: Container(
                height: MediaQuery.of(context).size.height / 3,
                width: MediaQuery.of(context).size.width,
                decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(50)),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "You Are In ",
                          style: TextStyle(
                            fontSize: 30,
                          ),
                        ),
                        Text(
                          cityname != null ? cityname.toString() : "Cox",
                          style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                              fontFamily: "azonix"),
                        ),
                      ],
                    ),
                    Text(
                      maintemp != null
                          ? "here is " + maintemp.toString() + "\u00B0"
                          : "here is 36\u00B0 hot",
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        fontFamily: "azonix",
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
              children: <Widget>[
                ListTile(
                  leading: FaIcon(FontAwesomeIcons.temperatureLow),
                  title: Text("Minimum Temperature "),
                  tileColor: Colors.tealAccent,
                  trailing: Text("\u00B0"),
                ),
                SizedBox(
                  height: 10,
                ),
                ListTile(
                  leading: FaIcon(FontAwesomeIcons.temperatureLow),
                  title: Text("Minimum Temperature "),
                  tileColor: Colors.tealAccent,
                  trailing: Text("\u00B0"),
                ),
                SizedBox(
                  height: 10,
                ),
                ListTile(
                  leading: FaIcon(FontAwesomeIcons.temperatureLow),
                  title: Text("Minimum Temperature "),
                  tileColor: Colors.tealAccent,
                  trailing: Text("\u00B0"),
                ),
                SizedBox(
                  height: 10,
                ),
                ListTile(
                  leading: FaIcon(FontAwesomeIcons.temperatureLow),
                  title: Text("Minimum Temperature "),
                  tileColor: Colors.tealAccent,
                  trailing: Text("\u00B0"),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}