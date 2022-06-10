import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CountryCards extends StatefulWidget {
  const CountryCards({Key? key}) : super(key: key);

  @override
  State<CountryCards> createState() => _CountryCardsState();
}

class _CountryCardsState extends State<CountryCards> {
  var timezone;

  Future zoneFetch() async {
    final zoneAPI = await http
        .get(Uri.parse("https://timeapi.io/api/TimeZone/zone?timeZone=Asia/Dhaka"));

    var zoneData = jsonDecode(zoneAPI.body);

    print(zoneData);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 5,
            width: MediaQuery.of(context).size.width / 2,
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Text(""),
                Text("data"),
                MaterialButton(onPressed: () {
                  zoneFetch();
                })
              ],
            ),
          ),
        ],
      ),
    );
  }
}
