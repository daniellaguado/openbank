import 'package:flutter/material.dart';

class InputDecorations {
  //
  static InputDecoration formImputDecoration(
    String labelText,
    String? hintText,
    Widget? icon,
    // void onPressed,
  ) {
    return InputDecoration(
        hintText: hintText,
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 197, 196, 196)),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 2),
        ),
        // hintText: 'CPF',
        labelText: labelText,
        labelStyle: const TextStyle(color: Colors.black),
        suffixIcon: icon);
  }
}
