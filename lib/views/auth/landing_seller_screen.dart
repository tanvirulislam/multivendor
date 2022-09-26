// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multivendor/controllers/auth_controller.dart';
import 'package:multivendor/views/auth/landing_customer_screen.dart';
import 'package:multivendor/views/auth/seller_login_screen.dart';

class LandingSellerScreen extends StatefulWidget {
  // static String routeName = 'LandingSellerScreen';
  LandingSellerScreen({Key? key}) : super(key: key);

  @override
  State<LandingSellerScreen> createState() => _LandingSellerScreenState();
}

class _LandingSellerScreenState extends State<LandingSellerScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  bool passwordVisible = true;
  final AuthController _authController = AuthController();

  bool isLoading = false;

  Uint8List? _Image;
  pickImageFromGallery() async {
    Uint8List im = await _authController.pickImage(ImageSource.gallery);
    setState(() {
      _Image = im;
    });
  }

  pickImageFromCamera() async {
    Uint8List im = await _authController.pickImage(ImageSource.camera);
    setState(() {
      _Image = im;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Create A Seller Account',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Bold",
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.person,
                            size: 35,
                            color: Colors.cyan,
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        _Image != null
                            ? CircleAvatar(
                                radius: 60,
                                backgroundColor: Colors.cyan,
                                backgroundImage: MemoryImage(_Image!),
                              )
                            : CircleAvatar(
                                radius: 60,
                                backgroundImage: NetworkImage(
                                    'https://www.pngitem.com/pimgs/m/87-877270_logo-icon-profile-png-transparent-png.png'),
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
                                onPressed: () {
                                  pickImageFromCamera();
                                },
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
                                onPressed: () {
                                  pickImageFromGallery();
                                },
                                icon: Icon(
                                  Icons.photo,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return 'please enter name';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Full name',
                        hintText: 'Enter your name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    TextFormField(
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return 'please enter email';
                        } else if (!val.contains('@')) {
                          return 'please enter valid email';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Email',
                        hintText: 'Enter your email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    TextFormField(
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return 'please enter password';
                        }
                        return null;
                      },
                      obscureText: passwordVisible,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        hintText: 'Enter your password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              passwordVisible = !passwordVisible;
                            });
                          },
                          icon: passwordVisible
                              ? Icon(Icons.visibility)
                              : Icon(Icons.visibility_off),
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    InkWell(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          print('ok');
                        } else {
                          print('fill up');
                        }
                        ;
                      },
                      child: Container(
                        height: 55,
                        width: MediaQuery.of(context).size.width - 48,
                        decoration: BoxDecoration(
                          color: Colors.cyan,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: isLoading
                              ? CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : Text(
                                  'Sign up',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Already have an accont?'),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SellerLoginScreen(),
                                ),
                              );
                            },
                            child: Text('Log in'))
                      ],
                    ),
                    Text('OR', textScaleFactor: 1.2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Create Customer's Account"),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        LandingCustomerScreen(),
                                  ));
                            },
                            child: Text('Sign up'))
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
