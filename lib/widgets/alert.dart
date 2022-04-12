import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

alertDialog(context, AlertType type, String title, String text){
  Alert(
    context: context,
    type: type,
    title: title,
    desc: text,
    buttons: [
      DialogButton(
        child: const Text(
          "OK",
          style: TextStyle(
              color: Colors.white,
              fontSize: 20
          ),
        ),
        onPressed: () => Navigator.pop(context),
        width: 120,
      )
    ],
  ).show();
}