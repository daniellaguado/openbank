import 'package:flutter/material.dart';

class ScaffoldNotification {
  static GlobalKey<ScaffoldMessengerState> messengerKey =
      GlobalKey<ScaffoldMessengerState>();

  static showSnakbar(String message) {
    final snackBar = SnackBar(
      content: Text(message),
    );
    messengerKey.currentState!.showSnackBar(snackBar);
  }
}
