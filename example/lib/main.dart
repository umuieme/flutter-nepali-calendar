import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:nepali_calendar/nepali_calendar.dart';
import 'package:nepali_calendar_example/nepali_date_converter.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String nepaliDate = "";
  String convertedEnglish = "";
  String englishDate = "";
  String convertedNepali = "";

  @override
  void initState() {
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(hintText: "BS - (yyyy-MM-dd)"),
              onChanged: (value) => this.nepaliDate = value,
            ),
            Text(convertedEnglish),
            RaisedButton(
              child: Text("Change AD"),
              onPressed: () {
                var data = nepaliDate.split("-");

                if (data.length != 3) {
                  setState(() {
                    convertedEnglish = "Invalid Date";
                  });
                  return;
                }
                try {
                  var nepDate = NepaliDate.fromBS(int.parse(data[0]),
                      int.parse(data[1]), int.parse(data[2]));
                  setState(() {
                    convertedEnglish =
                        "${nepDate.dateTime.year}-${nepDate.dateTime.month}-${nepDate.dateTime.day}";
                  });
                } catch (error) {
                  print(error);
                  setState(() {
                    convertedEnglish = error.message;
                  });
                }
              },
            ),
            TextField(
                decoration: InputDecoration(hintText: "AD - (yyyy-MM-dd)"),
                onChanged: (value) => this.englishDate = value),
            Text(convertedNepali),
            RaisedButton(
              child: Text("Change BS"),
              onPressed: () {
                var data = englishDate.split("-");

                if (data.length != 3) {
                  setState(() {
                    convertedNepali = "Invalid Date";
                  });
                  return;
                }
                try {
                  var engDate = NepaliDate.fromAD(DateTime(int.parse(data[0]),
                      int.parse(data[1]), int.parse(data[2])));
                  setState(() {
                    convertedNepali =
                        "${engDate.year}-${engDate.month}-${engDate.day}";
                  });
                } catch (error) {
                  print(error);
                  setState(() {
                    convertedNepali = error.message;
                  });
                }
              },
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            NepaliDate.fromBS(2076, 1, 5);
            NepaliDate.fromAD(DateTime(2019, 4, 14));
          },
        ),
      ),
    );
  }
}
