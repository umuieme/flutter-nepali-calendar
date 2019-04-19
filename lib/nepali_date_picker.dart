import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'package:nepali_calendar/nepali_date_converter.dart';

class NepaliDatePicker {
  final BuildContext context;
  NepaliDate currentDate;
  final Function(NepaliDate) onSelected;
  final String title;
  NepaliDatePicker(this.context, {this.currentDate, this.onSelected, this.title}) {
    currentDate = NepaliDate.fromAD(DateTime.now());
  }

  _indexOfYear(){
    return bsYears.indexWhere((value)=> value.containsKey(currentDate.year));
  }

  showDatePicker() {
    Picker(
        adapter: PickerDataAdapter<int>(pickerdata: bsYears),
        hideHeader: false,
        title: Text(title ?? "Select NepaliDate"),
        selecteds: currentDate == null ? null : [_indexOfYear(), currentDate.month-1, currentDate.day-1],
        onConfirm: (Picker picker, List value) {
          print(picker.getSelectedValues());
          if (onSelected == null) return;
          var selectedValues = picker.getSelectedValues();
          onSelected(NepaliDate.fromBS(
              selectedValues[0], selectedValues[1], selectedValues[2]));
        }).showModal(context);
  }
}
