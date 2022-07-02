import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:practice/presentation/pages/favorites.dart';
import 'package:practice/presentation/pages/profile.dart';
import 'package:practice/presentation/widgets/main_widget.dart';

import '../../domain/entities/doc.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final navigationKey = GlobalKey<CurvedNavigationBarState>();
  int index = 0;

  final screens = [
    MainWidget(),
    FavoritesPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: CurvedNavigationBar(
        key: navigationKey,
        index: index,
        color: Color(0xFFCCC5B9),
        backgroundColor: Colors.transparent,
        //backgroundColor: Color(0xFF0B6E4F),
        items: const <Widget>[
          Icon(
            Icons.home,
            size: 30,
            color: Color(0xFF403D39),
          ),
          Icon(
            Icons.bookmark,
            size: 30,
            color: Color(0xFF403D39),
          ),
          Icon(
            Icons.account_circle,
            size: 30,
            color: Color(0xFF403D39),
          ),
        ],
        onTap: (index) {
          //Handle button tap
          // final navigationState = navigationKey.currentState!;
          // navigationState.setPage(index);
          setState(() => this.index = index);
        },
      ),
    );
  }
}


