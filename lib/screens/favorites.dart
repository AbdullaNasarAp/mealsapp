import 'package:flutter/material.dart';
import 'package:mealsapp/models/meal.dart';
import 'package:mealsapp/widgets/meal_item.dart';

class Favorites extends StatefulWidget {
  final List<Meal> favor;
  const Favorites({super.key, required this.favor});

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    if (widget.favor.isEmpty) {
      return Center(
        child: Text("You have no Favorite yet - Start adding some!"),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: widget.favor[index].id,
            title: widget.favor[index].title,
            imageUrl: widget.favor[index].imageUrl,
            duration: widget.favor[index].duration,
            affordability: widget.favor[index].affordability,
            complexity: widget.favor[index].complexity,
          );
        },
        itemCount: widget.favor.length,
      );
    }
  }
}
