// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class LandingCustomerScreen extends StatelessWidget {
  const LandingCustomerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Create customer account',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.person,
                    size: 35,
                  ),
                )
              ],
            ),
            Row(
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.cyan,
                ),
                SizedBox(width: 10),
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.cyan,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.camera_alt,
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.cyan,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                        ),
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.photo,
                        ),
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
