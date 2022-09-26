import 'package:flutter/material.dart';
import 'package:multivendor/controllers/auth_controller.dart';
import 'package:multivendor/controllers/snackbar_controller.dart';
import 'package:multivendor/views/customer_home_screen.dart';

class SellerLoginScreen extends StatefulWidget {
  SellerLoginScreen({Key? key}) : super(key: key);

  @override
  State<SellerLoginScreen> createState() => SellerLoginScreenState();
}

class SellerLoginScreenState extends State<SellerLoginScreen> {
  bool passwordVisible = true;
  final AuthController _authController = AuthController();

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
                        "Sign in Into Seller's Account",
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
                  SizedBox(height: 8),
                  TextField(
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
                    onTap: () {},
                    child: Container(
                      height: 55,
                      width: MediaQuery.of(context).size.width - 48,
                      decoration: BoxDecoration(
                        color: Colors.cyan,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Text(
                          'Login',
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
                      Text("Don't have an accont?"),
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('Sign up'))
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
