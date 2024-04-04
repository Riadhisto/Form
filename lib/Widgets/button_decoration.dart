import 'package:flutter/material.dart';

ButtonStyle buttonInputDecoration = ButtonStyle(
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40.0),
        side: const BorderSide(color: Colors.blueAccent),
      ),
    ),
    backgroundColor: MaterialStateProperty.all<Color>(Colors.blueAccent),
    foregroundColor: MaterialStateProperty.all<Color>(Colors.white));
