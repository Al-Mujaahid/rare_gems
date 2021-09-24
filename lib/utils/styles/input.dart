import 'package:flutter/material.dart';
import 'package:rare_gem/utils/styles/colors.dart';
import 'package:rare_gem/utils/styles/text.dart';

InputDecoration underlineInputDecoration({hintText = '', filled = false, fillColor = Colors.transparent}) {
  return InputDecoration(
    filled: filled, fillColor: fillColor,
    hintText: '$hintText', alignLabelWithHint: true,
    hintStyle: subtitleStyle,
  );
}

InputDecoration outlineInputDecoration({hintText = '', filled = false, fillColor = Colors.transparent}) {
  return InputDecoration(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(color: disabledColor)
    ),
    filled: filled, fillColor: fillColor,
    hintText: '$hintText', alignLabelWithHint: true,
    hintStyle: subtitleStyle,
  );
}