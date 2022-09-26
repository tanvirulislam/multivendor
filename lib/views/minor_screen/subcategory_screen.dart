import 'package:flutter/material.dart';

class SubcategoryScreen extends StatelessWidget {
  final String subcategoryName;
  final String categoryName;
  const SubcategoryScreen({
    required this.subcategoryName,
    required this.categoryName,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: Text(subcategoryName, textScaleFactor: 1.3),
          centerTitle: true,
        ),
        body: Center(
          child: Text(categoryName),
        ),
      ),
    );
  }
}
