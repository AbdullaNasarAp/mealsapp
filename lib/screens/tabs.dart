import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:mealsapp/screens/favorites.dart';
import 'package:mealsapp/widgets/main_drawer.dart';

import 'categories_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, dynamic>> pages = [
    {
      'pages': const CategoriesScreen(),
      'title': "Categories",
    },
    {
      'pages': const Favorites(),
      'title': 'Your Favorites',
    },
  ];
  int _selectedPageIndex = 0;

  void _selectedPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(pages[_selectedPageIndex]['title'],
              style: Theme.of(context).textTheme.bodyText1),
        ),
        drawer: MainDrawer(),
        body: pages[_selectedPageIndex]['pages'],
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Theme.of(context).colorScheme.primary,
          unselectedItemColor: Colors.black,
          currentIndex: _selectedPageIndex,
          selectedFontSize: 17,
          type: BottomNavigationBarType.shifting,
          onTap: _selectedPage,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.food_bank,
              ),
              label: "Categories",
              tooltip: "Categories",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
              ),
              label: "Favorite",
              tooltip: "Favorites",
            )
          ],
        ),
      ),
    );
  }
}
