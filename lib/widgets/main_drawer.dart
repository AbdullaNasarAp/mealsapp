import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mealsapp/screens/filter.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    var sizedBox = const SizedBox(
      height: 20,
    );
    return Drawer(
      child: Column(
        children: [
          Container(
            color: Theme.of(context).colorScheme.primary,
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            child: Text(
              "Cooking Up !",
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          sizedBox,
          _drawerItem(Icons.restaurant, "Meals", () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          _drawerItem(Icons.settings, "Filter", () {
            Navigator.of(context).pushReplacementNamed(FilterScreen.filterPage);
          })
        ],
      ),
    );
  }

  Widget _drawerItem(IconData icons, String title, VoidCallback taptap) {
    return ListTile(
      leading: Icon(
        icons,
        size: 26,
      ),
      title: Text(title),
      onTap: taptap,
    );
  }
}
