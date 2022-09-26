import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    CollectionReference _snapshot =
        FirebaseFirestore.instance.collection('users');
    return FutureBuilder(
      future: _snapshot.doc(_auth.currentUser!.uid).get(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          Map<String, dynamic> data =
              snapshot.data.data() as Map<String, dynamic>;
          return SafeArea(
            child: Scaffold(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              body: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    expandedHeight: 140,
                    flexibleSpace: LayoutBuilder(
                      builder: (context, constraints) => FlexibleSpaceBar(
                        title: AnimatedOpacity(
                          opacity: constraints.biggest.height <= 120 ? 1 : 0,
                          duration: Duration(milliseconds: 300),
                          child: Text('Account'),
                        ),
                        background: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.black,
                                Colors.cyan,
                              ],
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 50,
                                  backgroundImage: NetworkImage(data['Image']),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  data['fullName'],
                                  textScaleFactor: 1.3,
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        SizedBox(height: 12),
                        Card(
                          elevation: 2,
                          child: Container(
                            height: 65,
                            width: MediaQuery.of(context).size.width * .95,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                TextButton(
                                  onPressed: () {},
                                  child: Text('Cart'),
                                  style: TextButton.styleFrom(
                                      primary: Colors.cyan),
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: Text('Order'),
                                  style: TextButton.styleFrom(
                                      primary: Colors.cyan),
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: Text('Wishlist'),
                                  style: TextButton.styleFrom(
                                      primary: Colors.cyan),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 40,
                              width: 50,
                              child:
                                  Divider(color: Theme.of(context).hintColor),
                            ),
                            Text(' Account Info '),
                            SizedBox(
                              height: 40,
                              width: 50,
                              child:
                                  Divider(color: Theme.of(context).hintColor),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Container(
                            height: 260,
                            width: double.infinity,
                            child: Card(
                              elevation: 3,
                              child: Column(
                                children: [
                                  ListTile(
                                    leading: Icon(
                                      Icons.email,
                                      color: Theme.of(context).hintColor,
                                    ),
                                    title: Text('Email Address'),
                                    subtitle: Text(data['email']),
                                  ),
                                  Divider(color: Colors.cyan),
                                  ListTile(
                                    leading: Icon(
                                      Icons.phone,
                                      color: Theme.of(context).hintColor,
                                    ),
                                    title: Text('Phone No'),
                                    subtitle: Text('098766768'),
                                  ),
                                  Divider(color: Colors.cyan),
                                  ReapetedListTile(
                                    icon: Icon(
                                      Icons.location_pin,
                                      color: Theme.of(context).hintColor,
                                    ),
                                    title: 'Address',
                                    subtitle: 'Kasiyadanga, Rajshahi',
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 40,
                              width: 50,
                              child:
                                  Divider(color: Theme.of(context).hintColor),
                            ),
                            Text(' Account Settings '),
                            SizedBox(
                              height: 40,
                              width: 50,
                              child:
                                  Divider(color: Theme.of(context).hintColor),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Card(
                            elevation: 3,
                            child: Column(
                              children: [
                                ReapetedListTile(
                                  icon: Icon(
                                    Icons.edit,
                                    color: Theme.of(context).hintColor,
                                  ),
                                  title: 'Edit profile',
                                  subtitle: '',
                                ),
                                Divider(color: Colors.cyan),
                                ReapetedListTile(
                                  icon: Icon(
                                    Icons.lock,
                                    color: Theme.of(context).hintColor,
                                  ),
                                  title: 'Change password',
                                  subtitle: '',
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        }
      },
    );
  }
}

class ReapetedListTile extends StatelessWidget {
  Icon icon;
  String title;
  String subtitle;
  ReapetedListTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon,
      title: Text(title),
      subtitle: Text(subtitle),
    );
  }
}
