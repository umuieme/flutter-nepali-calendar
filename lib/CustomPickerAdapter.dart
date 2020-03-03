import 'package:flutter/material.dart';
import 'package:flutter_picker/flutter_picker.dart';

/// CustomPickerAdapter
///
/// Use this adapter to customize the date picker item.
/// [buildItemWidget] A function which takes the [text] and [isSelected] to show in the picker and returns the widget.
class CustomPickerAdapter<T> extends PickerDataAdapter<T> {
  Function(String, bool) buildItemWidget;

  CustomPickerAdapter(
      {List pickerdata, data, isArray = false, this.buildItemWidget})
      : super(pickerdata: pickerdata, data: data, isArray: isArray);

  @override
  Widget makeText(Widget child, String text, bool isSel) {
    return buildItemWidget != null
        ? buildItemWidget(text, isSel)
        : super.makeText(child, text, isSel);
  }
}
