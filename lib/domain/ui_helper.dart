import 'package:flutter/material.dart';

InputDecoration mTextDecoration({required String hint,required String heading,IconData? mIcon}){
  return InputDecoration(
    hintText: hint,
    label: Text(heading),
    prefixIcon: mIcon != null ? Icon(mIcon):null,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(21)
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(21)
    )
  );
}

Widget mSpacer({double mHeight=11.0,double mWidth=11.0}){
  return SizedBox(
    height: mHeight,
    width: mWidth,
  );
}