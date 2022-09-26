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
          title: Text(subcategoryName),
          centerTitle: true,
        ),
        body: Center(
          child: Text(categoryName),
        ),
      ),
    );
  }
}
