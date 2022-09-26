import 'package:flutter/material.dart';
import 'package:multivendor/views/minor_screen/subcategory_screen.dart';

class MenCategoryScreen extends StatelessWidget {
  List<String> menCategoryTitle = [
    'Shirt',
    'T-Shirt',
    'Jacket',
    'Suit',
    'Jeans',
    'Coat',
    'Vest',
    'Short',
  ];
  List<String> menCategoryImage = [
    'https://images.unsplash.com/photo-1603252109303-2751441dd157?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8c2hpcnR8ZW58MHx8MHx8&w=1000&q=80',
    'https://images.unsplash.com/photo-1627225924765-552d49cf47ad?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTN8fHQlMjBzaGlydHxlbnwwfHwwfHw%3D&w=1000&q=80',
    'https://media.istockphoto.com/photos/red-winter-jacket-on-white-picture-id184362036?k=20&m=184362036&s=612x612&w=0&h=DlrS-UyQQSuJGYv4TeBTsaM_YgkRLYZPHJoy-PK2RyE=',
    'https://media.istockphoto.com/photos/good-looking-male-business-professional-in-studio-picture-id1201437847?b=1&k=20&m=1201437847&s=612x612&w=0&h=Zt9Z266YyIEAdgBc9cMEkY0bEiXdZKyKIZMNghas6lY=',
    'https://thumbs.dreamstime.com/b/blue-jeans-isolated-white-34440719.jpg',
    'https://media.istockphoto.com/photos/good-looking-male-business-professional-in-studio-picture-id1201437847?b=1&k=20&m=1201437847&s=612x612&w=0&h=Zt9Z266YyIEAdgBc9cMEkY0bEiXdZKyKIZMNghas6lY=',
    'https://shotkit.com/wp-content/uploads/2022/02/rothco-uncle-milty.jpg',
    'https://media.istockphoto.com/photos/shorts-picture-id1237985231?k=20&m=1237985231&s=612x612&w=0&h=LXYGTYSFa2UhCIvOoMGrWsmMu0fn0wbW7RlBcleCx1k=',
  ];
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 50,
          width: screenSize.width,
          color: Theme.of(context).cardColor,
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text(
              'Men',
              textScaleFactor: 1.3,
              style: TextStyle(
                color: Colors.cyan,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Container(
          height: screenSize.height * .6,
          // color: Colors.amber,
          child: GridView.count(
            crossAxisCount: screenSize.width > 400 ? 4 : 3,
            // crossAxisSpacing: 15,
            mainAxisSpacing: 25,
            children: List.generate(
              8,
              (index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SubcategoryScreen(
                                subcategoryName: menCategoryTitle[index],
                                categoryName: 'Men',
                              ),
                            )),
                        child: SizedBox(
                          child: Image.network(
                            menCategoryImage[index],
                            fit: BoxFit.cover,
                            height: 65,
                            width: double.infinity,
                          ),
                        ),
                      ),
                      Text(menCategoryTitle[index]),
                    ],
                  ),
                );
              },
            ),
          ),
        )
      ],
    );
  }
}
