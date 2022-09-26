import 'package:flutter/material.dart';
import 'package:multivendor/views/category/men_category_screen.dart';

class CategoryScreen extends StatefulWidget {
  CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final PageController _pageController = PageController();
  List<itemData> items = [
    itemData(categoryName: 'Men'),
    itemData(categoryName: 'Woman'),
    itemData(categoryName: 'Shoes'),
    itemData(categoryName: 'Kids'),
    itemData(categoryName: 'Electronic'),
  ];

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              child: SizedBox(
                width: screenSize.width * .2,
                height: screenSize.height * .8,
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 1),
                      child: InkWell(
                        onTap: () {
                          _pageController.jumpToPage(index);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: items[index].isSelected == true
                                ? Colors.cyan
                                : Theme.of(context).cardColor,
                            border: items[index].isSelected == true
                                ? Border.all(color: Colors.grey)
                                : null,
                          ),
                          height: 100,
                          child: Center(
                            child: Text(items[index].categoryName),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                width: screenSize.width * .8,
                height: screenSize.height * .8,
                // color: Colors.pink,
                child: PageView(
                  controller: _pageController,
                  scrollDirection: Axis.vertical,
                  onPageChanged: (index) {
                    for (var element in items) {
                      element.isSelected = false;
                    }
                    setState(() {
                      items[index].isSelected = true;
                    });
                  },
                  children: [
                    MenCategoryScreen(),
                    Center(child: Text('woman')),
                    Center(child: Text('shoes')),
                    Center(child: Text('kids')),
                    Center(child: Text('electronic ')),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class itemData {
  String categoryName;
  bool isSelected;
  itemData({required this.categoryName, this.isSelected = false});
}
