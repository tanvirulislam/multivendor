// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:multivendor/views/auth/landing_customer_screen.dart';
import 'package:multivendor/views/auth/landing_seller_screen.dart';
import 'package:multivendor/views/customer_home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Widget currentPage = LandingCustomerScreen();

  voidCheckLogin() async {
    var qn = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    if (qn.exists) {
      setState(() {
        currentPage = CustomerHomeScreen();
      });
      print('user data --------- ${qn.data()}');
    } else {
      print('user not found -------------');
    }
  }

  @override
  void initState() {
    super.initState();
    voidCheckLogin();
  }

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
      // home: currentPage,
      // home: CustomerHomeScreen(),
      home: LandingCustomerScreen(),
      // initialRoute: LandingCustomerScreen.routeName,
      // routes: {
      //   CustomerHomeScreen.routeName: (context) => CustomerHomeScreen(),
      //   LandingCustomerScreen.routeName: (context) => LandingCustomerScreen(),
      // },
    );
  }
}
