import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mealsapp/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const mealDetail = '/meal_detail_screen';
  final Function toggleMeals;
  final Function ismealFavor;
  const MealDetailScreen(
      {super.key, required this.toggleMeals, required this.ismealFavor});

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)?.settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(selectedMeal.title),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 300,
            width: double.infinity,
            child: Image.network(
              selectedMeal.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          _buildSectionTitle(context, 'Ingredients'),
          _buildContainer(
            ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Text("# ${index + 1}"),
                  title: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Text(
                      selectedMeal.ingredients[index],
                      style: GoogleFonts.akshar(fontSize: 17),
                    ),
                  ),
                );
              },
              itemCount: selectedMeal.ingredients.length,
            ),
          ),
          _buildSectionTitle(context, "Steps"),
          _buildContainer(
            ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Text("# ${index + 1}"),
                  title: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Text(
                      selectedMeal.steps[index],
                      style: GoogleFonts.akshar(fontSize: 17),
                    ),
                  ),
                );
              },
              itemCount: selectedMeal.steps.length,
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          toggleMeals(mealId);
        },
        child: Icon(ismealFavor(mealId) ? Icons.star : Icons.star_border),
      ),
    );
  }

  Padding _buildContainer(Widget child) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(width: 1.0)),
          width: double.infinity,
          height: 120,
          child: child),
    );
  }

  Container _buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }
}
