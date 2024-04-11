import 'package:flutter/material.dart';


class Util {

  static InputDecoration getDropDownInputDecoration(String text, Color borderColor) {
    return InputDecoration(
      //border: InputBorder.none,
      contentPadding: EdgeInsets.fromLTRB(
          8, 0, 8, 0),
      border: UnderlineInputBorder(
          //borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(
        color: borderColor,
      )),
      errorMaxLines: 1,
      suffixIcon: text == "Email"
          ? IconButton(
        onPressed: (){},
        icon: Icon(
          Icons.email,
          color: Colors.lightBlue,
        ),
      )
          : null,
      labelText: text,
      labelStyle: TextStyle(fontWeight: FontWeight.normal, fontSize: 18.0, color: borderColor),

    );
  }

  static InputDecoration getDatePickerInputBorder() {
    return InputDecoration(
      errorMaxLines: 2,
      filled: true,
      fillColor: Colors.transparent,

      contentPadding: EdgeInsets.fromLTRB(
          2, 16, 2, 16),
      //labelText: text,
      border: InputBorder.none,
    );
  }


}
