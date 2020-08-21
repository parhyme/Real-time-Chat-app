import 'package:flutter/material.dart';

Widget appBarMain(BuildContext context) {
  return AppBar(
    title: Text(
      "Chat App",
    ),
  );
}

InputDecoration textFieldInputDecoration(String hintText) {
  return InputDecoration(
      hintText: "Email",
      hintStyle: TextStyle(
        color: Colors.white,
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
      ));
}

TextStyle simpleTextFieldStyle() {
  return TextStyle(color: Colors.white, fontSize: 14);
}

TextStyle btnTextStyle() {
  return TextStyle(
    color: Colors.white,
    fontSize: 20,
  );
}
