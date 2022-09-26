import 'package:flutter/material.dart';
import 'package:multivendor/views/cart_screen.dart';
import 'package:multivendor/views/category_screen.dart';
import 'package:multivendor/views/home_screen.dart';
import 'package:multivendor/views/inner_screen/search_screen.dart';
import 'package:multivendor/views/profile_screen.dart';

class CustomerHomeScreen extends StatefulWidget {
  // static String routeName = 'CustomerHomeScreen';
  const CustomerHomeScreen({Key? key}) : super(key: key);

  @override
  State<CustomerHomeScreen> createState() => _CustomerHomeScreenState();
}

class _CustomerHomeScreenState extends State<CustomerHomeScreen> {
  int _selectedItem = 0;
  final List _pages = [
    HomeScreen(),
    CategoryScreen(),
    Center(child: Text('shop')),
    CartScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _pages[_selectedItem],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme.of(context).bottomAppBarColor,
          selectedIconTheme: IconThemeData(
            color: Colors.cyan,
            size: 28,
          ),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          unselectedItemColor: Theme.of(context).hintColor,
          currentIndex: _selectedItem,
          type: BottomNavigationBarType.fixed,
          onTap: (val) {
            setState(() {
              _selectedItem = val;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
            BottomNavigationBarItem(icon: Icon(Icons.shop), label: 'Shop'),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), label: 'Cart'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}
