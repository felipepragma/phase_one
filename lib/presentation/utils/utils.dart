import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///
/// Global function to show messages in the different Android and iOS OS
///
/// [showMessage] : method used for show a message
///
class Utils {
  static showMessage(BuildContext context, String title, String message) {
    if (Platform.isIOS) {
      showDialog(
          context: context,
          builder: (context) => CupertinoAlertDialog(
                title: Text(title),
                content: Text(message),
                actions: <Widget>[
                  CupertinoDialogAction(
                    isDefaultAction: true,
                    child: const Text("OK"),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              ));
    } else if (Platform.isAndroid) {
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
                title: Text(title),
                content: Text(message),
                actions: <Widget>[
                  TextButton(
                    child: const Text('OK'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ],
              ));
    }
  }
}
