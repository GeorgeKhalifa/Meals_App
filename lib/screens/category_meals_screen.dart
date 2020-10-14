import 'package:Meals_App/widgets/meal_item.dart';
import 'package:flutter/material.dart';
import 'package:Meals_App/models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';
  final List<Meal> availableMeals;

  CategoryMealsScreen(this.availableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final categoryMeals = widget.availableMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              categoryMeals[index].id,
                categoryMeals[index].title,
                categoryMeals[index].imageUrl,
                categoryMeals[index].affordability,
                categoryMeals[index].complexity,
                categoryMeals[index].duration);
          },
          itemCount: categoryMeals.length,
        ));
  }
}

