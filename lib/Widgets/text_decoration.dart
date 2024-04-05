import 'package:flutter/material.dart';

const textInputDecoration = InputDecoration(
    labelStyle: TextStyle(color: Colors.blueAccent, fontSize: 20),
    hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
    floatingLabelStyle: TextStyle(color: Colors.blueAccent, fontSize: 20),
    filled: true,
    fillColor: Colors.white,
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blueAccent, width: 2),
        borderRadius: BorderRadius.all(Radius.circular(20))),
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blueAccent, width: 2),
        borderRadius: BorderRadius.all(Radius.circular(10))),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.red, width: 2),
      borderRadius: BorderRadius.all(Radius.circular(20)),
    ),
    focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red, width: 2),
        borderRadius: BorderRadius.all(Radius.circular(10))));
