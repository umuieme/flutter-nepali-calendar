import 'package:flutter/material.dart';
import 'dart:async';
import 'package:nepali_calendar/nepali_date_converter.dart';
import 'package:nepali_calendar/nepali_date_picker.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String nepaliDate = "";
  String convertedEnglish = "";
  String englishDate = "";
  String convertedNepali = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plugin example app'),
      ),
      body: Container(
        margin: EdgeInsets.all(16),
        child: ListView(
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.number,
              inputFormatters: [DateTextInputFormatter()],
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
                inputFormatters: [DateTextInputFormatter()],
                keyboardType: TextInputType.number,
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
            SizedBox(
              height: 20,
            ),
            Text(pickedDate != null
                ? "${pickedDate.toString()} => ${pickedDate.dateTime.year}-${pickedDate.dateTime.month}-${pickedDate.dateTime.day}"
                : "Pick a date"),
            RaisedButton(
              child: Text("PickDate"),
              onPressed: () {
                NepaliDatePicker(context, currentDate: pickedDate,
                    onSelected: (nepalidate) {
                  print(nepalidate.toString());
                  print(nepalidate.dateTime);
                  setState(() {
                    pickedDate = nepalidate;
                  });
                }).showDatePicker();
              },
            )
          ],
        ),
      ),
    );
  }

  NepaliDate pickedDate;
}

class DateTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final int newTextLength = newValue.text.trim().length;
    String newText;
    if (newTextLength < oldValue.text.trim().length) {
      newText = newValue.text.endsWith("-")
          ? newValue.text.substring(0, newValue.text.length - 1)
          : newValue.text;
    } else if (newTextLength > 10) {
      newText = oldValue.text;
    } else if (newTextLength == 5 || newTextLength == 8) {
      newText = newValue.text.substring(0, newTextLength - 1) +
          "-" +
          newValue.text.substring(newTextLength - 1);
    } else
      newText = newValue.text;
    newText = newText.replaceAll("--", "-");
    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
