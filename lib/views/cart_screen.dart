import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: Text('Cart', textScaleFactor: 1.3),
          centerTitle: true,
          actions: [
            Icon(Icons.delete_forever),
            SizedBox(width: 10),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Your Cart is Empty',
                textScaleFactor: 2,
                style: TextStyle(color: Colors.cyan),
              ),
              SizedBox(height: 30),
              Card(
                elevation: 7,
                child: Container(
                  width: 200,
                  height: 50,
                  color: Theme.of(context).backgroundColor,
                  child: MaterialButton(
                    onPressed: () {},
                    child: Text('Continue Shopping'),
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomSheet: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total :  TK 890',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              ElevatedButton(onPressed: () {}, child: Text('Checkout')),
            ],
          ),
        ),
      ),
    );
  }
}
