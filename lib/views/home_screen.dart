import 'package:flutter/material.dart';
import 'package:multivendor/views/inner_screen/search_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            title: InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchScreen(),
                  )),
              child: Container(
                margin: EdgeInsets.only(top: 8),
                height: 45,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.cyan,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.search),
                    Text(
                      'What are you looking for...',
                      textScaleFactor: .8,
                    )
                  ],
                ),
              ),
            ),
            bottom: TabBar(
              tabs: [
                ReapetedTab(title: 'Men'),
                ReapetedTab(title: 'Woman'),
                ReapetedTab(title: 'Kids'),
                ReapetedTab(title: 'Shoes'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Center(child: Text('men')),
              Center(child: Text('woman')),
              Center(child: Text('kids')),
              Center(child: Text('shoes')),
            ],
          ),
        ),
      ),
    );
  }
}

class ReapetedTab extends StatelessWidget {
  String title;
  ReapetedTab({
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tab(
        child: Text(
      title,
      // style: TextStyle(color: Colors.cyan),
    ));
  }
}
