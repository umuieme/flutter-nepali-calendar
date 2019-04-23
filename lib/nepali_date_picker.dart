
import 'package:flutter/material.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'package:nepali_calendar/nepali_date_converter.dart';

/// NepaliDatePicker 
/// 
/// Create a DatePicker for BS date in modal. This uses [flutter_picker] as picker 
/// [currentDate] Initial Date to show for picker. Default is today date.
/// [onSelected(date)] callback for the date selection with the selected [NepaliDate]
/// [title] to show in the DatePicker
class NepaliDatePicker {
  final BuildContext context;
  NepaliDate currentDate;
  final Function(NepaliDate) onSelected;
  final String title;
  NepaliDatePicker(this.context, {this.currentDate, this.onSelected, this.title}) {
    currentDate = currentDate ??  NepaliDate.fromAD();
  }

  _indexOfYear(){
    return bsYears.indexWhere((value)=> value.containsKey(currentDate.year));
  }

/// function to show this DatePicker. 
/// 
/// Currently shows in modal only
  showDatePicker() {
    Picker(
        adapter: PickerDataAdapter<int>(pickerdata: bsYears),
        hideHeader: false,
        title: Text(title ?? "Select NepaliDate"),
        selecteds: currentDate == null ? null : [_indexOfYear(), currentDate.month-1, currentDate.day-1],
        onConfirm: (Picker picker, List value) {
          if (onSelected == null) return;
          var selectedValues = picker.getSelectedValues();
          onSelected(NepaliDate.fromBS(
              selectedValues[0], selectedValues[1], selectedValues[2]));
        }).showModal(context);
  }
}
