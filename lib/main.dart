// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:multivendor/views/auth/customer_signup_screen.dart';
import 'package:multivendor/views/customer_home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        fontFamily: "Bold",
      ),
      themeMode: ThemeMode.system,
      darkTheme: ThemeData.dark(),
      // home: LandingCustomerScreen(),
      home: CustomerHomeScreen(),
      // home: HomeScreen(),
      // initialRoute: LandingCustomerScreen.routeName,
      // routes: {
      //   CustomerHomeScreen.routeName: (context) => CustomerHomeScreen(),
      //   LandingCustomerScreen.routeName: (context) => LandingCustomerScreen(),
      // },
    );
  }
}
