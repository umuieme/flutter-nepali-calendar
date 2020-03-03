import 'package:flutter/material.dart';
import 'package:nepali_calendar/nepali_date_converter.dart';
import 'package:nepali_calendar/nepali_date_picker.dart';
import 'package:flutter/services.dart';
import 'package:flutter_picker/flutter_picker.dart';

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
  DateTime pickedAdDate;
  NepaliDate pickedNepaliDate;

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
            Text(pickedAdDate != null
                ? "${pickedAdDate.year} - ${pickedAdDate.month} - ${pickedAdDate.day} AD \t =>  ${NepaliDate.fromAD(pickedAdDate).toString()} BS"
                : "Pick a date in AD below"),
            RaisedButton(
                child: Text("Change to BS"),
                onPressed: this._onChangeToBsPressed),
            SizedBox(
              height: 10,
            ),
            Text(pickedNepaliDate != null
                ? "${pickedNepaliDate.toString()} BS => ${pickedNepaliDate.dateTime.year} - ${pickedNepaliDate.dateTime.month} - ${pickedNepaliDate.dateTime.day} AD"
                : "Pick a date in BS below"),
            RaisedButton(
              child: Text("Change to AD"),
              onPressed: this._onChangeToAdPressed,
            )
          ],
        ),
      ),
    );
  }

  _onChangeToBsPressed() {
    Picker(
        adapter: DateTimePickerAdapter(value: pickedAdDate),
        onConfirm: (picker, selecteds) {
          setState(() {
            pickedAdDate = (picker.adapter as DateTimePickerAdapter).value;
          });
        }).showModal(context);
  }

  _onChangeToAdPressed() {
    NepaliDatePicker(context, currentDate: pickedNepaliDate,
        buildItem: (text, isSelected) {
      return Text("$text");
    }, onSelected: (nepalidate) {
      setState(() {
        pickedNepaliDate = nepalidate;
      });
    }).showDatePicker();
  }
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
