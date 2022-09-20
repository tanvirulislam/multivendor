import 'package:flutter/material.dart';

snackBar(String title, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Theme.of(context).primaryColor,
      duration: Duration(milliseconds: 500),
      content: Text(
        title,
        style: TextStyle(color: Colors.white),
      ),
    ),
  );
}
