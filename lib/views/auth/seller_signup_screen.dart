// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multivendor/controllers/auth_controller.dart';
import 'package:multivendor/controllers/snackbar_controller.dart';
import 'package:multivendor/views/auth/customer_login_screen.dart';
import 'package:multivendor/views/customer_home_screen.dart';

class LandingSellerScreen extends StatefulWidget {
  // static String routeName = 'LandingSellerScreen';
  LandingSellerScreen({Key? key}) : super(key: key);

  @override
  State<LandingSellerScreen> createState() => _LandingSellerScreenState();
}

class _LandingSellerScreenState extends State<LandingSellerScreen> {
  bool passwordVisible = true;
  final AuthController _authController = AuthController();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool isLoading = false;
  signUp() async {
    setState(() {
      isLoading = true;
    });
    String res = await _authController.signUpUsers(
      fullName: _fullNameController.text,
      email: _emailController.text,
      password: _passwordController.text,
      image: _Image,
    );
    setState(() {
      isLoading = false;
    });
    if (res != 'success') {
      return snackBar(res, context);
    } else {
      return Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CustomerHomeScreen(),
          ));
    }
  }

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
              child: Column(
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
                  TextField(
                    controller: _fullNameController,
                    decoration: InputDecoration(
                      labelText: 'Full name',
                      hintText: 'Enter your name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      hintText: 'Enter your email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  TextField(
                    controller: _passwordController,
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
                      signUp();
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
                                builder: (context) => CustomerLoginScreen(),
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
                      Text('Create seller account'),
                      TextButton(onPressed: () {}, child: Text('Sign up'))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
