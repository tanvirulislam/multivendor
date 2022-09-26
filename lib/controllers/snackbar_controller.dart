import 'package:flutter/material.dart';

snackBar(String title, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Theme.of(context).primaryColor,
      duration: Duration(milliseconds: 1000),
      content: Text(
        title,
        style: TextStyle(color: Colors.white),
      ),
    ),
  );
}
